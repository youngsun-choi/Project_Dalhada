package com.spring.dalhada;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.SearchBucketDAO;
import vo.LikeGetVO;
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
	public ModelAndView searchBucket(@RequestParam(defaultValue="1")int curPage, SearchBucketVO searchBucketVO,
			HttpServletRequest request, LikeGetVO likeGetVO) {
		ModelAndView mav = new ModelAndView();
		String keyword = searchBucketVO.getSearchKeyword();
		String tagName = request.getParameter("searchTag");
		searchBucketVO.setSearchTag(tagName);
		String id = request.getParameter("id");
		
		if(tagName != null) {
			//태그검색 검색결과 수&페이징
			int listCnt = searchBucketDAO.getTotalTagCnt(tagName);
			PagingVO pageList = new PagingVO(listCnt, curPage); //(전체 게시물 수, 현재 페이지)
			searchBucketVO.setStart(pageList.getStartIndex());
			searchBucketVO.setLast(pageList.getEndIndex());
			mav.addObject("listCnt", listCnt);
			mav.addObject("pagination", pageList);
			
			//태그검색
			List<SearchBucketVO> searchList = searchBucketDAO.searchTag(searchBucketVO);
			mav.addObject("searchList", searchList);
			mav.addObject("keyword", "");
		}else {
			//제목검색 검색결과 수&페이징
			int listCnt = searchBucketDAO.getTotalTitleCnt(keyword);
			PagingVO pageList = new PagingVO(listCnt, curPage); //(전체 게시물 수, 현재 페이지)
			searchBucketVO.setStart(pageList.getStartIndex());
			searchBucketVO.setLast(pageList.getEndIndex());
			mav.addObject("listCnt", listCnt);
			mav.addObject("pagination", pageList);
			
			//제목검색
			List<SearchBucketVO> searchList = searchBucketDAO.searchTitle(searchBucketVO);
			mav.addObject("searchList", searchList);
			mav.addObject("keyword", keyword);
		}
		
		//가져오기 버튼을 눌렀을 때
		if(id != null) {
			int numId = Integer.parseInt(id);
			likeGetVO.setId(numId);
			likeGetVO.setCnt(searchBucketDAO.selectGetCnt(numId).getCnt());
			likeGetVO.setMember_id("aaa");
			searchBucketDAO.updateGetCnt(likeGetVO);
			//boolean result = searchBucketDAO.insertSelectedBucket(likeGetVO);
			//if(result) System.out.println("selectedbucket 삽입 성공!");
			//else System.out.println("selectedbucket 삽입 실패!");
		}
		mav.setViewName("searchBucket");
		return mav;
	}
}
