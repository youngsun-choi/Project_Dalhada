package service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AchieveDAO;
import vo.AchieveVO;

@Service
public class AchieveService {
	@Autowired
	private AchieveDAO dao;
	
	//birth select
	public List<Date> selectBirth(String id) {
		return dao.selectBirth(id);
	}	
	
	//버킷 완료일 select
	public List<AchieveVO> selectCompleteDate(String id){
		return dao.selectCompleteDate(id);
	}
	
	//상세버킷 선택된 태그 select
	public List<String> selectedTag(int selectedbucket_id){
		return dao.selectedTag(selectedbucket_id);
	}
}
