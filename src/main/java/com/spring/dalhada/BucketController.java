package com.spring.dalhada;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.BucketDAO;
import vo.BucketDetailVO;
import vo.BucketVO;
import vo.LikeInfoVO;

@Controller
public class BucketController {
	@Autowired
	BucketDAO dao;
	
	@RequestMapping(value="/main")
	public ModelAndView main(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
	
		List<BucketVO> list = dao.selectADBucket(id);
		for(BucketVO vo: list) {
			vo.addClass();
		}
		mav.addObject("list", list);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping(value="/main/like")
	@ResponseBody
	public String clickheart(HttpSession session, LikeInfoVO vo) {
		int result = 0;
		String id = (String)session.getAttribute("id");
		
		if(id != null) {
			vo.setMember_id(id);
			String action = vo.getAction();
			if(action.equals("insert")) {
				result = dao.insertLikeInfo(vo);
			}else if(action.equals("delete")) {
				result = dao.deleteLikeInfo(vo);
			}
		}else {
			result = -1;
		}
		return result>0?"success":"error";
	}
	
	@RequestMapping(value="/main/modaldetail")
	public BucketDetailVO modaldetail(HttpSession session, int bucket_id, int selectedbucket_id) {
		BucketDetailVO vo =  dao.selectDetail(bucket_id, selectedbucket_id);
		System.out.println(vo.toString());
		return vo;
	}
	
	@RequestMapping(value="/product")
	public ModelAndView product() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product");
		return mav;
	}
	
	@RequestMapping(value="/searchBucket")
	public ModelAndView searchBucket() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("searchBucket");
		return mav;
	}
}
