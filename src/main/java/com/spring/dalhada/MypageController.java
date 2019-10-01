package com.spring.dalhada;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MypageService;
import vo.MemberinfoVO;
import vo.MypageBucketVO;
import vo.MypageVO;

@Controller
public class MypageController {
	@Autowired
	MypageService service;

	@RequestMapping(value = "/mypage")
	public ModelAndView get(MemberinfoVO vo, HttpSession session, HttpServletRequest request,MypageVO vo1) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		vo1.setMember_id(id);
		if (id != null) {
			if (request.getMethod().equals("POST")) {
				System.out.println("post들어옴");
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("member_id", id);
				if(vo1.getGroup1()!=null && vo1.getGroupnum()!=null) { // 그룹 업데이트
					System.out.println("Group 있음");

					for(int i=0; i<vo1.getGroup1().length;i++) {
						System.out.println(vo1.getGroup1()[i]+" : "+vo1.getOriGroup()[i]);
						if(!vo1.getGroup1()[i].equals(vo1.getOriGroup()[i])) {
							map.put("id",Integer.parseInt(vo1.getGroupnum()[i]));
							map.put("name", vo1.getGroup1()[i]);
							service.updateGroup(map);
							break;
						}
					}
				}
				if(vo1.getCreGroup()!=null) {//그룹 작성
					for(int i=0;i<vo1.getCreGroup().length;i++) {
						map.put("CreGroup", vo1.getCreGroup()[i]);
						service.CreateGroup(map);
					}
				}
				
				if (vo1.getBox() != null) { // 체크박스로 삭제하기
					for (int i = 0; i < vo1.getBox().length; i++) {
						service.delete(Integer.parseInt(vo1.getBox()[i]));
					}
				}
				if(vo1.getComp()!=null) { // 버킷 완료버튼
					System.out.println(vo1.getComp());
					map.put("member_id",  vo.getId());
					map.put("id", Integer.parseInt(vo1.getComp()));
					service.complete(map);
				}
			}
			
			

			Map<String, Object> choose = new HashMap<String, Object>();
			choose.put("id", id);
			choose.put("stat",'p');	//진행률 표현위해 먼저 완료한 버킷으로 표현.
			
			
			List<MypageBucketVO> listAll = null;
			List<MypageBucketVO> listDone = null;
			
			if(vo1.getGroup() != null && !vo1.getGroup().equals("all")) {
				System.out.println("group이 있음!");
				choose.put("group_id", vo1.getGroup());
				listAll = service.GroupAllBuck(choose);
				listDone = service.groupChos(choose);
				choose.put("stat",'f');
				mav.addObject("listProg", service.groupChos(choose));
			}else {
				System.out.println("group이 없음");
				listAll = service.bucketAll(id);
				listDone = service.choose(choose);
				choose.put("stat",'f');
				mav.addObject("listProg", service.choose(choose));
			}
			
			int ProgNum = (int) (listDone.size() / (double) listAll.size() * 100);
			mav.addObject("perc", ProgNum);
			
			mav.addObject("listAll", listAll);
			mav.addObject("listDone", listDone);

			mav.addObject("group", service.groupList(id));
			mav.addObject("info", service.UserInfo(vo));
			mav.setViewName("mypage");
		} else {
			mav.addObject("msg", "만료된 페이지입니다.");
			mav.setViewName("login");
		}
		return mav;
	}

}
