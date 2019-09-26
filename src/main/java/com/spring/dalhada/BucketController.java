package com.spring.dalhada;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.SearchBucketDAO;
import vo.BucketVO;
import vo.LikeVO;
import vo.PagingVO;
import vo.SearchBucketVO;

@Controller
public class BucketController {
	@Autowired
	private SearchBucketDAO searchBucketDAO;
	
	@RequestMapping(value="/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping(value="/product")
	public ModelAndView product() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product");
		return mav;
	}
	
	@RequestMapping(value="/searchBucket")
	public ModelAndView searchBucket(HttpSession session, 
			@RequestParam(defaultValue="1")int curPage, @RequestParam(required=false)String tagName, 
			@ModelAttribute SearchBucketVO searchBucketVO, @ModelAttribute BucketVO bucketVO) {
		ModelAndView mav = new ModelAndView();
		String id = "youngsun"; //(String) session.getAttribute("id");
		String keyword = searchBucketVO.getSearchKeyword();
		int listCnt = 0;
		PagingVO pageList = null;
		List<BucketVO> searchList = null;
		
		if(tagName != null) {
			//태그검색 검색결과 수&페이징
			listCnt = searchBucketDAO.getTotalTagCnt(tagName);
			pageList = new PagingVO(listCnt, curPage); //(전체 게시물 수, 현재 페이지)
			searchBucketVO.setStartRow(pageList.getStartIndex());
			searchBucketVO.setEndRow(pageList.getEndIndex());
			mav.addObject("listCnt", listCnt);
			mav.addObject("pagination", pageList);
			
			//태그검색
			searchBucketVO.setSearchTag(tagName);
			searchList = searchBucketDAO.searchTag(searchBucketVO);
			mav.addObject("keyword", "");
			mav.addObject("searchList", searchList);
		}else {
			//제목검색 검색결과 수&페이징
			listCnt = searchBucketDAO.getTotalTitleCnt(keyword);
			pageList = new PagingVO(listCnt, curPage); //(전체 게시물 수, 현재 페이지)
			searchBucketVO.setStartRow(pageList.getStartIndex());
			searchBucketVO.setEndRow(pageList.getEndIndex());
			mav.addObject("listCnt", listCnt);
			mav.addObject("pagination", pageList);
			
			//제목검색
			searchList = searchBucketDAO.searchTitle(searchBucketVO);
			mav.addObject("keyword", keyword);
			mav.addObject("searchList", searchList);
		}
		
		//태그명 찾기
		List<String> tagNameList = searchBucketDAO.selectTagName();
		mav.addObject("tagNameList", tagNameList);
		
		//좋아요&가져오기
		/*if(id != null) {
			//좋아요
			
			if(bucketVO.getIsget() == 1) { //가져오기 전 상태
				boolean result = searchBucketDAO.insertSelectedBucket(bucketVO);
				if(result) System.out.println("성공");
				else System.out.println("실패");
			}else { //가져온 후
				mav.addObject("afterGetMsg", "이미 가져온 버킷리스트입니다!");
			}
		}*//*else {
			mav.addObject("likeGetInfoMsg", "로그인 후 이용가능합니다!");
		}*/
		mav.addObject("status", id);
		mav.setViewName("searchBucket");
		return mav;
	}
}
