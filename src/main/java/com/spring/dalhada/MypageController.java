package com.spring.dalhada;



import java.util.List;

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
	public ModelAndView get(MemberinfoVO vo, HttpSession session, HttpServletRequest request, String[] box) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		if (id != null) {
			if(request.getMethod().equals("POST")) {
				if(id!=null) {
					if(box!=null) {
							System.out.println("길이 :"+box.length);
							System.out.println(box[0]);
							for(int i=0;i<box.length;i++) {
								dao.delete(Integer.parseInt(box[i]));
					}
				}
			}
			}
			List<MypageBucketVO> listAll = dao.bucketAll(id);
			List<MypageBucketVO> listProg = dao.progress(id);
			
			int ProgNum= listAll.size();	
					mav.addObject("listAll",listAll);
					mav.addObject("listProg",listProg);
					mav.addObject("listDone",dao.done(id));
				mav.addObject("group", dao.groupList(id));
				mav.addObject("info", dao.UserInfo(vo));
			mav.setViewName("Mypage");	
		}else {
			mav.addObject("msg", "만료된 페이지입니다.");
			mav.setViewName("login");
		}
		return mav;
	}
	
}
