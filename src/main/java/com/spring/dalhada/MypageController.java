package com.spring.dalhada;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.BucketDAO;
import dao.MypageDAO;
import service.AchieveService;
import vo.AchieveVO;
import vo.BucketDetailVO;
import vo.MemberinfoVO;
import vo.MypageBucketVO;

@Controller
public class MypageController {
	@Autowired
	MypageDAO dao;
	@Autowired
	private BucketDAO bucketDao;
	@Autowired
	private AchieveService achieveService;


	@RequestMapping(value = "/achieve")
	public ModelAndView achieve(HttpSession session, @RequestParam(required=false) String age) {
		ModelAndView mav = new ModelAndView();
		String id = "aaa";//(String) session.getAttribute("id");
		List<AchieveVO> achieveList = achieveService.selectCompleteBucket(id);
		List<AchieveVO> selectedAchieveList = new ArrayList<AchieveVO>();
		List<Integer> ageList = new ArrayList<Integer>();
		int numAge = (age != null) ? Integer.parseInt(age) : achieveList.get(0).getAge();
		for(AchieveVO vo:achieveList) {
			ageList.add(vo.getAge());
			if(vo.getAge()==numAge)
				selectedAchieveList.add(vo);
		}
		mav.addObject("ageList", ageList.stream().distinct().collect(Collectors.toList()));
		mav.addObject("achieveList", selectedAchieveList);
		mav.setViewName("achieve");
		return mav;
	}
	@RequestMapping(value = "/mypage")
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
				choose.put("group_id", group);
				listAll = dao.GroupAllBuck(choose);
				listDone = dao.groupChos(choose);
				choose.put("stat",'f');
				mav.addObject("listProg", dao.groupChos(choose));
			}else {
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
			mav.setViewName("mypage");
		} else {
			mav.addObject("msg", "만료된 페이지입니다.");
			mav.setViewName("login");
		}
		return mav;
	}

}
