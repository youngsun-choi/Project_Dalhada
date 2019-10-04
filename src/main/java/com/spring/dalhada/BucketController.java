package com.spring.dalhada;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.BucketService;
import service.NaverBlogService;
import service.SearchBucketService;
import vo.BucketDetailVO;
import vo.BucketVO;
import vo.GroupVO;
import vo.LikeInfoVO;
import vo.PagingVO;
import vo.SearchBucketVO;
import vo.StringIntVO;
import vo.TagInfoVO;

@Controller
public class BucketController {
	@Resource(name="bucketService")
	private BucketService bucketservice;
	@Autowired
	private SearchBucketService searchBucketService;
	@Autowired
	private NaverBlogService naverBlogService;
	
	@RequestMapping(value="/main")
	public ModelAndView main(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
	
		List<BucketVO> TOPlist = bucketservice.selectTOPBucket(id);
		
		mav.addObject("TOPlist", TOPlist);
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
				result = bucketservice.insertLikeInfo(vo);
			}else if(action.equals("delete")) {
				result = bucketservice.deleteLikeInfo(vo);
			}
		}else {
			result = -1;
		}
		return result+"";
	}
	
	@RequestMapping(value="/main/getgrouptag")
	@ResponseBody
	public List<List<StringIntVO>> getgroup(HttpSession session) {
		String member_id = (String)session.getAttribute("id");
		List<List<StringIntVO>> list = new ArrayList<List<StringIntVO>>();
		
		if(member_id!=null) {
			List<StringIntVO> groups = bucketservice.selectGroups(member_id);
			List<StringIntVO> tags = bucketservice.selectTags();
			list.add(groups);
			list.add(tags);
			
		}
		return list;
	}
	
	@RequestMapping(value="/main/modaldetail")
	@ResponseBody
	public BucketDetailVO modaldetail(HttpSession session, int bucket_id, int selectedbucket_id) {
		BucketDetailVO vo =  bucketservice.selectDetail(bucket_id, selectedbucket_id);
		System.out.println(vo.toString());
		return vo;
	}
	
	/*@RequestMapping(value="/searchbucket/get")
	@ResponseBody
	public BucketDetailVO groupmodal(HttpSession session, @RequestParam(required=false) String selectedbucket_id) {
	      String id = (String) session.getAttribute("id");
	      BucketDetailVO selectedBucketList = null;
	      int sid= Integer.parseInt(selectedbucket_id);
	      if(id != null) {
	         //가져오기 select
	         System.out.println("가져오기 버튼 눌렀을 때 selectedbucket_id값 : "+selectedbucket_id);
	 		 selectedBucketList = searchBucketService.selectSelectedBucket(sid);
	 		 System.out.println("selectedBucketList값 : "+selectedBucketList.toString());
	 		 selectedBucketList.setTags(searchBucketService.selectSelectedTag(sid));
	      }
	    return selectedBucketList;
	}*/      
	
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
			
			//검색어 미입력시 검색된 결과없음
			searchList = (keyword != null && keyword.equals("")) ? null : searchList;
			mav.addObject("searchList", searchList);
			mav.addObject("keyword", keyword);
		}
		
		//태그명 찾기
		List<TagInfoVO> tagNameList = searchBucketService.selectTagName();
		mav.addObject("tagNameList", tagNameList);
		
		//그룹명 찾기
		//List<GroupVO> groupNameList = searchBucketService.selectGroupName(id);
		//mav.addObject("groupNameList", groupNameList);
		
		//네이버 블로그 검색결과
		naverBlogService.selectNaverBlog(keyword);
		
		mav.setViewName("searchbucket");
		return mav;
	}
}
