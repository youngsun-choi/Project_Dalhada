package com.spring.dalhada;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.MemberinfoVO;

@Controller
public class memberController {

	@Autowired
	MemberService service;
		
		// 회원가입 폼 처리
		@RequestMapping(value="/memberForm")
		public ModelAndView signup(MemberinfoVO vo, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			if (request.getMethod().equals("GET")) {
				System.out.println("GET일떄");
			     
			     mav.setViewName("memberForm");
				return mav;
			}
			System.out.println("GET 아닐때");
			if(vo.getImage()!=null) {
				String fileName = vo.getImage().getOriginalFilename();
				String newName = vo.getId()+"_"+fileName;
				System.out.println("파일이름 : "+newName);
				vo.setImage_path(newName);
				service.insert(vo);
			     byte[] content = null;
			     mav.setViewName("login");
			     try {
			    	 content =  vo.getImage().getBytes();
			    	 File f = new File("C:/Seol/student/eclipse-workspace/dalhada/src/main/webapp/resources/images/profile/"+fileName);			   
			    		 FileOutputStream fos = new FileOutputStream(f);
			    		 fos.write(content);
			    		 fos.close();
			    		 
				    	 File newf = new File("C:/Seol/student/eclipse-workspace/dalhada/src/main/webapp/resources/images/profile/"+newName);
				    	 if(f.exists())
				    		 f.renameTo(newf);
			     } catch (IOException e) {
			    	 e.printStackTrace();
			     }	
			}else {
				service.insert(vo);
				mav.setViewName("login");
			}
			return mav;
		}
			
		@RequestMapping(value="/validateForm")
		@ResponseBody
		public int idCheck(String id) {
			System.out.println("Controller에 넘어온 id값 "+id);
			if (service.checkId(id)) {
				System.out.println("idcheck로 돌아와서 리턴 1함");
				return 1;
			}
			else return 0;
		}
}



