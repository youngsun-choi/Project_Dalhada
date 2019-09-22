package com.spring.dalhada;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.SearchBucketDAO;
import vo.PagingVO;
import vo.SearchTitleVO;

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
	public ModelAndView searchBucket(@RequestParam(defaultValue="1")int curPage, SearchTitleVO searchTitleVO) {
		ModelAndView mav = new ModelAndView();
		String keyword = searchTitleVO.getSearchKeyword();
		
		//페이징
		int listCnt = searchBucketDAO.getTotalCnt(keyword);
		PagingVO pageList = new PagingVO(listCnt, curPage); //(전체 게시물 수, 현재 페이지)
		searchTitleVO.setStart(pageList.getStartIndex());
		searchTitleVO.setLast(pageList.getEndIndex());
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagination", pageList);
		
		//제목검색
		List<SearchTitleVO> searchTitleList = searchBucketDAO.searchTitle(searchTitleVO);
		mav.addObject("searchTitleList", searchTitleList); 
		mav.addObject("keyword", keyword);
						
		mav.setViewName("searchBucket");
		return mav;
	}
}
