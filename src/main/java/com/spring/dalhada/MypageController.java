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

import dao.MypageDAO;
import vo.MemberinfoVO;
import vo.MypageBucketVO;

@Controller
public class MypageController {
	@Autowired
	MypageDAO dao;

	@RequestMapping(value = "/Mypage")
	public ModelAndView get(MemberinfoVO vo, HttpSession session, HttpServletRequest request,
			String[] box, String comp, String group) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		vo.setId(id);

		if (id != null) {
			if (request.getMethod().equals("POST")) { 
				if (box != null) { // 체크박스로 삭제하기
					for (int i = 0; i < box.length; i++) {
						dao.delete(Integer.parseInt(box[i]));
					}
				}
				if(comp!=null) { // 버킷 완료버튼
					System.out.println(comp);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("member_id",  vo.getId());
					map.put("id", Integer.parseInt(comp));
					dao.complete(map);
				}
			}
			
			

			Map<String, Object> choose = new HashMap<String, Object>();
			choose.put("id", id);
			choose.put("stat",'p');	//진행률 표현위해 먼저 완료한 버킷으로 표현.
			
			
			List<MypageBucketVO> listAll = null;
			List<MypageBucketVO> listDone = null;
			
			if(group != null && !group.equals("all")) {
				System.out.println("group이 있음!");
				choose.put("group_id", group);
				listAll = dao.GroupAllBuck(choose);
				listDone = dao.groupChos(choose);
				choose.put("stat",'f');
				mav.addObject("listProg", dao.groupChos(choose));
			}else {
				System.out.println("group이 없음");
				listAll = dao.bucketAll(id);
				listDone = dao.choose(choose);
				choose.put("stat",'f');
				mav.addObject("listProg", dao.choose(choose));
			}
			
			int ProgNum = (int) (listDone.size() / (double) listAll.size() * 100);
			mav.addObject("perc", ProgNum);
			
			mav.addObject("listAll", listAll);
			mav.addObject("listDone", listDone);

			mav.addObject("group", dao.groupList(id));
			mav.addObject("info", dao.UserInfo(vo));
			mav.setViewName("Mypage");
		} else {
			mav.addObject("msg", "만료된 페이지입니다.");
			mav.setViewName("login");
		}
		return mav;
	}

}
