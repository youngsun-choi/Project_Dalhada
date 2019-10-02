package dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.AchieveVO;

@Repository
public class AchieveDAO {
	@Autowired
	SqlSession session = null;
	
	//birth select
	public List<Date> selectBirth(String id) {
		List<Date> list = null;
		String statement = "resource.AchieveMapper.selectBirth";
		list = session.selectList(statement, id);
		return list;
	}	
	
	//버킷 완료일 select
	public List<AchieveVO> selectCompleteDate(String id){
		List<AchieveVO> list = null;
		String statement = "resource.AchieveMapper.selectCompleteDate";
		list = session.selectList(statement, id);
		return list;
	}
	
	//상세버킷 선택된 태그 select
	public List<String> selectedTag(int selectedbucket_id){
		List<String> list = null;
		String statement = "resource.AchieveMapper.selectedTag";
		list = session.selectList(statement, selectedbucket_id);
		return list;
	}
}
