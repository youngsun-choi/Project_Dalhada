package com.spring.dalhada;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.SearchBucketDAO;
import service.BucketService;
import vo.BucketDetailVO;
import vo.BucketVO;
import vo.LikeInfoVO;
import vo.PagingVO;
import vo.SearchBucketVO;
import vo.SelectedBucketVO;
import vo.StringIntVO;

@Controller
public class BucketController {
	@Autowired
	private SearchBucketDAO searchBucketDAO;
	@Resource(name="bucketService")
	private BucketService bucketservice;
	
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
	public BucketDetailVO modaldetail(HttpSession session, String selectedbucket_id) {
		String member_id = (String) session.getAttribute("id");
		StringIntVO map = new StringIntVO();
		map.setId(Integer.parseInt(selectedbucket_id));
		map.setName(member_id);
		BucketDetailVO vo =  bucketservice.selectDetail(map);
		return vo;
	}

	@RequestMapping(value="/createbucket")
	@ResponseBody
	public String createbucket(HttpSession session, SelectedBucketVO vo, @RequestParam(value="g_id")String g_id,
			@RequestParam(value="taglist")List<String> taglist, @RequestParam("file") MultipartFile file) {
		String fileName = file.getOriginalFilename(), filePath;
		String member_id = (String) session.getAttribute("id");
		vo.setMember_id(member_id);
		vo.setTag_id(taglist);
		vo.setGroup_id(Integer.parseInt(g_id));
		vo.setImage_path("_"+fileName);
		filePath = bucketservice.insertBucket(vo);
		byte[] image = null;
		try {
			image = file.getBytes();
			File f = new File("C:/Users/student/Documents/Dalhada/src/main/webapp/resources/images/bucket/"+filePath);
			FileOutputStream fos = new FileOutputStream(f);
			fos.write(image);
			fos.close();
			File newf = new File("C:/Users/student/Documents/Dalhada/src/main/webapp/resources/images/bucket/"+filePath);
	    	 if(f.exists())
	    		 f.renameTo(newf);
		}catch (IOException e) {
	    	 e.printStackTrace();
	     }	
		return "success";
	}
	
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
			listCnt = searchBucketDAO.getTotalTagCnt(tagName);
			
			mav.addObject("keyword", "");
		}else {
			listCnt = searchBucketDAO.getTotalTitleCnt(keyword);
			
			mav.addObject("keyword", keyword);	
		}
		pageList = new PagingVO(listCnt, curPage);
		searchBucketVO.setStartRow(pageList.getStartIndex());
		searchBucketVO.setEndRow(pageList.getEndIndex());
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagination", pageList);
		
		searchBucketVO.setSearchTag(tagName);
		searchList = searchBucketDAO.searchTag(searchBucketVO);
		for(BucketVO vo: searchList) {
			vo.addClass();
		}
		mav.addObject("searchList", searchList);
		List<String> tagNameList = searchBucketDAO.selectTagName();
		mav.addObject("tagNameList", tagNameList);
		
		List<String> groupNameList = searchBucketDAO.selectGroupName(id);
		mav.addObject("groupNameList", groupNameList);
		
		mav.setViewName("searchbucket");
		return mav;
	}
}
