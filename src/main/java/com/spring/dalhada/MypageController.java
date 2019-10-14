package com.spring.dalhada;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.AchieveService;
import service.MypageService;
import vo.AchieveVO;
import vo.MemberinfoVO;
import vo.MypageBucketVO;
import vo.MypageVO;


@Controller
public class MypageController {
	@Autowired
	MypageService service;
	String id = null;
	@Autowired
	private AchieveService achieveService;


	@RequestMapping(value = "/achieve")
	public ModelAndView achieve(HttpSession session, @RequestParam(required=false) String age) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		List<AchieveVO> achieveList = achieveService.selectCompleteBucket(id);
		List<AchieveVO> selectedAchieveList = new ArrayList<AchieveVO>();
		List<Integer> ageList = new ArrayList<Integer>();
		int numAge = 0;
		if(achieveList.size() != 0) {
			numAge = (age != null) ? Integer.parseInt(age) : achieveList.get(0).getAge();
			for(AchieveVO vo:achieveList) {
				ageList.add(vo.getAge());
				if(vo.getAge()==numAge)
					selectedAchieveList.add(vo);
			}
			mav.addObject("ageList", ageList.stream().distinct().collect(Collectors.toList()));
		}
		mav.addObject("achieveList", selectedAchieveList);
		System.out.println("achieveList"+selectedAchieveList.toString());
		mav.setViewName("achieve");
		return mav;
	}
	
	
	@RequestMapping(value = "/mypage")
	public ModelAndView get(MemberinfoVO vo, HttpSession session, HttpServletRequest request,MypageVO vo1) {
		ModelAndView mav = new ModelAndView();
		id = (String) session.getAttribute("id");
		vo.setId(id);
		vo1.setMember_id(id);
		
		if (id != null) {
			if (request.getMethod().equals("POST")) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("member_id", id);
				
				if(vo1.getAction()!=null) { // 개인정보 수정
				if(vo1.getAction().equals("UpCheck")) { // 비밀번호 수정
					service.UpCheck(vo);
					
				}else if(vo1.getAction().equals("UpInfo")) { // 나머지 개인정보 수정
					String originFilename = service.UserInfo(vo).getImage_path();
					if(!vo.getImage().getContentType().equals("application/octet-stream")) {
						String fileName = vo.getImage().getOriginalFilename();
						String newName = vo.getId()+"_"+fileName;
						vo.setImage_path(newName);
						service.UpInfo(vo);
					     byte[] content = null;
					     mav.setViewName("login");
					     try {
					    	 
					    	 File originFilepath = new File("C:/jjn/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/dalhada/resources/images/profile/"+originFilename);
					    	 if(originFilepath.exists()) {
					    		 originFilepath.delete();	 
					    	 }
					    	 
					    	 content =  vo.getImage().getBytes();
					    	 File f = new File("C:/jjn/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/dalhada/resources/images/profile/"+fileName);			   
					    		 FileOutputStream fos = new FileOutputStream(f);
					    		 fos.write(content);
					    		 fos.close();
					    		 
						    	 File newf = new File("C:/jjn/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/dalhada/resources/images/profile/"+newName);
						    	 if(f.exists())
						    		 f.renameTo(newf);

					     } catch (IOException e) {
					    	 e.printStackTrace();
					     }	
					}else {
						vo.setImage_path(originFilename);
						service.UpInfo(vo);
					}
				}
				}
				
				if(vo1.getGroup1()!=null && vo1.getGroupnum()!=null) { // 그룹 업데이트

					for(int i=0; i<vo1.getGroup1().length;i++) {
						if(!vo1.getGroup1()[i].equals(vo1.getOriGroup()[i])) {
							map.put("id",Integer.parseInt(vo1.getGroupnum()[i]));
							map.put("name", vo1.getGroup1()[i]);
							service.updateGroup(map);
							break;
						}
					}
				}
				
				if(vo1.getCreGroup()!=null) {//그룹 작성
					for(int i=0;i<vo1.getCreGroup().length;i++) {
						map.put("CreGroup", vo1.getCreGroup()[i]);
						service.CreateGroup(map);
					}
				}
				
				if (vo1.getBox() != null) { // 체크박스로 삭제하기
					for (int i = 0; i < vo1.getBox().length; i++) {
						service.delete(Integer.parseInt(vo1.getBox()[i]));
					}
				}
				if(vo1.getComp()!=null) { // 버킷 완료버튼
					map.put("member_id",  vo.getId());
					map.put("id", Integer.parseInt(vo1.getComp()));
					service.complete(map);
				}
			}

			Map<String, Object> choose = new HashMap<String, Object>();
			choose.put("id", id);
			choose.put("stat",'p');	//진행률 표현위해 먼저 완료한 버킷으로 표현.
			
			
			List<MypageBucketVO> listAll = null;
			List<MypageBucketVO> listDone = null;
			
			if(vo1.getGroup() != null && !vo1.getGroup().equals("all")) {
				choose.put("group_id", vo1.getGroup());
				listAll = service.GroupAllBuck(choose);
				listDone = service.groupChos(choose);
				choose.put("stat",'f');
				mav.addObject("listProg", service.groupChos(choose));
			}else {
				listAll = service.bucketAll(id);
				listDone = service.choose(choose);
				choose.put("stat",'f');
				mav.addObject("listProg", service.choose(choose));
			}
			
			int ProgNum = (int) (listDone.size() / (double) listAll.size() * 100);
			mav.addObject("perc", ProgNum);
			
			mav.addObject("listAll", listAll);
			mav.addObject("listDone", listDone);
			mav.addObject("info", service.UserInfo(vo));
			mav.addObject("group", service.groupList(id));
			mav.setViewName("mypage");
		} else {
			mav.setViewName("redirect:/loginmain");
		}
		return mav;
	}
	@RequestMapping(value = "/delGroup", method = RequestMethod.POST)
	@ResponseBody
	public String login(String id) {
		if (service.DeleteGroup(Integer.parseInt(id))) {
			return "true";
		}
		return "false";
	}
	
	@RequestMapping(value = "/Checkpw", method = RequestMethod.POST)
	@ResponseBody
	public String Checkpw() {
		return service.Checkpw(id);
	}
}
