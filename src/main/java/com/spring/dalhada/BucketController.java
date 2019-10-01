package com.spring.dalhada;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.BucketDAO;
import service.SearchBucketService;
import vo.BucketDetailVO;
import vo.BucketVO;
import vo.GroupVO;
import vo.LikeInfoVO;
import vo.PagingVO;
import vo.SearchBucketVO;
import vo.TagInfoVO;

@Controller
public class BucketController {
	@Autowired
	private SearchBucketService searchBucketService;
	@Autowired
	private BucketDAO dao;
	
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
	public int clickheart(HttpSession session, LikeInfoVO vo) {
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
		return result;
	}
	
	@RequestMapping(value="/main/modaldetail")
	@ResponseBody
	public BucketDetailVO modaldetail(HttpSession session, int bucket_id, int selectedbucket_id) {
		BucketDetailVO vo =  dao.selectDetail(bucket_id, selectedbucket_id);
		System.out.println(vo.toString());
		return vo;
	}
	
	@RequestMapping(value="/searchbucket/get")
	@ResponseBody
	public BucketDetailVO groupmodal(HttpSession session, @RequestParam(required=false) String selectedbucket_id) {
	      String id = (String) session.getAttribute("id");
	      BucketDetailVO selectedBucketList = null;
	      List<BucketDetailVO> selectedTagList = null;
	      int sid= Integer.parseInt(selectedbucket_id);
	      if(id != null) {
	         //가져오기 select
	         System.out.println("가져오기 버튼 눌렀을 때 selectedbucket_id값 : "+selectedbucket_id);
	 		 selectedBucketList = searchBucketService.selectSelectedBucket(sid);
	 		 System.out.println("selectedBucketList값 : "+selectedBucketList.toString());
	 		 selectedBucketList.setTags(searchBucketService.selectSelectedTag(sid));
	      }
	    return selectedBucketList;
	}      
	
	//좋아요  많은 거 / 추천 버킷
	@RequestMapping(value="/searchbucket")
	public ModelAndView searchBucket(HttpSession session, 
			@RequestParam(defaultValue="1")int curPage, @RequestParam(required=false)String tagName, 
			@ModelAttribute SearchBucketVO searchBucketVO, @ModelAttribute BucketVO bucketVO) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		searchBucketVO.setMember_id(id);
		String keyword = searchBucketVO.getSearchKeyword();
		int listCnt;
		PagingVO pageList;
		List<BucketVO> searchList;
		
		if(tagName != null) {
			//태그검색 검색결과 수&페이징
			listCnt = searchBucketService.getTotalTagCnt(tagName);
			pageList = new PagingVO(listCnt, curPage); //(전체 게시물 수, 현재 페이지)
			searchBucketVO.setStartRow(pageList.getStartIndex());
			searchBucketVO.setEndRow(pageList.getEndIndex());
			mav.addObject("listCnt", listCnt);
			mav.addObject("pagination", pageList);
			
			//태그검색
			searchBucketVO.setSearchTag(tagName);
			searchList = searchBucketService.searchTag(searchBucketVO);
			for(BucketVO vo: searchList) {
				vo.addClass();
			}
			mav.addObject("keyword", "");
			mav.addObject("searchList", searchList);
		}else {
			//제목검색 검색결과 수&페이징
			listCnt = searchBucketService.getTotalTitleCnt(keyword);
			pageList = new PagingVO(listCnt, curPage); //(전체 게시물 수, 현재 페이지)
			searchBucketVO.setStartRow(pageList.getStartIndex());
			searchBucketVO.setEndRow(pageList.getEndIndex());
			mav.addObject("listCnt", listCnt);
			mav.addObject("pagination", pageList);
			
			//제목검색
			searchList = searchBucketService.searchTitle(searchBucketVO);
			for(BucketVO vo: searchList) {
				vo.addClass();
			}
			mav.addObject("keyword", keyword);
			mav.addObject("searchList", searchList);
		}
		
		//태그명 찾기
		List<TagInfoVO> tagNameList = searchBucketService.selectTagName();
		mav.addObject("tagNameList", tagNameList);
		
		//그룹명 찾기
		List<GroupVO> groupNameList = searchBucketService.selectGroupName(id);
		mav.addObject("groupNameList", groupNameList);
		
		mav.setViewName("searchbucket");
		return mav;
	}
}
