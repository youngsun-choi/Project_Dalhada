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

	@RequestMapping(value = "/mypage")
	public ModelAndView get(MemberinfoVO vo, HttpSession session, HttpServletRequest request,
			String[] box, String comp, String group) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		vo.setId(id);

		if (id != null) {
			if (request.getMethod().equals("POST")) { 
				if (box != null) { // 泥댄겕諛뺤뒪濡� �궘�젣�븯湲�
					for (int i = 0; i < box.length; i++) {
						dao.delete(Integer.parseInt(box[i]));
					}
				}
				if(comp!=null) { // 踰꾪궥 �셿猷뚮쾭�듉
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("member_id",  vo.getId());
					map.put("id", Integer.parseInt(comp));
					dao.complete(map);
				}
			}	

			Map<String, Object> choose = new HashMap<String, Object>();
			choose.put("id", id);
			choose.put("stat",'p');	//吏꾪뻾瑜� �몴�쁽�쐞�빐 癒쇱� �셿猷뚰븳 踰꾪궥�쑝濡� �몴�쁽.
			
			
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
			mav.addObject("msg", "留뚮즺�맂 �럹�씠吏��엯�땲�떎.");
			mav.setViewName("login");
		}
		return mav;
	}

}
