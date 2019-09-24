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
		String bucket_id = request.getParameter("bucket_id");
		String selectedbucket_id = request.getParameter("selectedbucket_id");
		
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
		if(bucket_id != null) {
			int numBucket_id = Integer.parseInt(bucket_id);
			int numSelectedbucket_id = Integer.parseInt(selectedbucket_id);
			likeGetVO.setMember_id("aaa");
			likeGetVO.setBucket_id(numBucket_id);
			likeGetVO.setSelectedbucket_id(numSelectedbucket_id);
			likeGetVO.setCnt(searchBucketDAO.selectGetCnt(numBucket_id).getCnt());
			
			searchBucketDAO.updateGetCnt(likeGetVO);
			boolean result = searchBucketDAO.insertSBId(likeGetVO);
			searchBucketDAO.insertSBId(likeGetVO);
			if(result) System.out.println("성공!");
			else System.out.println("실패!");
		}
		
		//태그명 찾기
		
		mav.setViewName("searchBucket");
		return mav;
	}
}
