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

import dao.MemberDAO;
import vo.MemberinfoVO;

@Controller
public class memberController {

	@Autowired
	MemberDAO dao;
		
		// 회원가입 폼 처리
		@RequestMapping(value="/memberform")
		public ModelAndView signup(MemberinfoVO vo, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			if (request.getMethod().equals("GET")) {
			     mav.setViewName("memberForm");
				return mav;
			}
			if(vo.getImage()!=null) {
				String fileName = vo.getImage().getOriginalFilename();
				String newName = vo.getId()+"_"+fileName;
				vo.setImage_path(newName);
				dao.insert(vo);
			     byte[] content = null;
			     mav.setViewName("login");
			     try {
			    	 content =  vo.getImage().getBytes();
			    	 File f = new File("/images/profile/"+fileName);	
			    		 FileOutputStream fos = new FileOutputStream(f);
			    		 fos.write(content);
			    		 fos.close();
			    		 
				    	 File newf = new File("/images/profile/"+newName);
				    	 if(f.exists())
				    		 f.renameTo(newf);
			     } catch (IOException e) {
			    	 e.printStackTrace();
			     }	
			}else {
				dao.insert(vo);
				mav.setViewName("login");
			}
			return mav;
		}
			
		@RequestMapping(value="/validateForm")
		@ResponseBody
		public int idCheck(String id) {
			if (dao.checkId(id)) {
				return 1;
			}
			else return 0;
		}
}



