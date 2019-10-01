package com.spring.dalhada;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDAO;
import vo.MemberinfoVO;

@Controller
public class LoginController {
	@Autowired
	MemberDAO dao;

	//로그인 입력페이지
	@RequestMapping("/loginmain")
	@ResponseBody
	public ModelAndView loginmain() {
		ModelAndView mav = new ModelAndView();
		System.out.println("loginmain 호출");
		mav.setViewName("login");
		return mav;
	}

	//로그인 처리 페이지
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(String id, String password, HttpSession session,HttpServletRequest request) {
		MemberinfoVO vo = dao.checklogin(id, password);
		System.out.println("login 화면 호출");
		if (vo != null) {
			session.setAttribute("id", vo.getId());
			System.out.println(vo.getId());
			return "true";
		}
		return "false";
	}
	
	//로그아웃 
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("festivalMain");
		return mav;
	}

}