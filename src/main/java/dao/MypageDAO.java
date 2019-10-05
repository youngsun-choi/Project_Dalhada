package dao;


import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.GroupVO;
import vo.MemberinfoVO;
import vo.MypageBucketVO;

@Repository
public class MypageDAO {
	@Autowired
	SqlSession session = null;
	
	public MemberinfoVO UserInfo(MemberinfoVO vo1) {
		String statement= "resource.MypageMapper.memberInfo";
		MemberinfoVO vo = session.selectOne(statement,vo1);
		if(vo != null) return vo;
		return null;
	}	
	
	public List<GroupVO> groupList(String id) {
		List<GroupVO> list = null;
		String statement = "resource.MypageMapper.group";
		list = session.selectList(statement,id);
		return list;
	}
	
	public List<MypageBucketVO> GroupAllBuck(Map<String, Object> map){
		List<MypageBucketVO> list = null;
		String statement = "resource.MypageMapper.GroupAllBuck";
		list = session.selectList(statement,map);
		return list;
	}
	
	public List<MypageBucketVO> groupChos(Map<String, Object> map){
		List<MypageBucketVO> list = null;
		String statement = "resource.MypageMapper.groupChos";
		list = session.selectList(statement,map);
		return list;
	}
	
	public List<MypageBucketVO> bucketAll(String id){
		List<MypageBucketVO> list = null;
		String statement = "resource.MypageMapper.bucketAll";
		list = session.selectList(statement,id);
		return list;
	}
	
	
	public List<MypageBucketVO> choose(Map<String, Object> map){
		List<MypageBucketVO> list = null;
		String statement = "resource.MypageMapper.choose";
		list = session.selectList(statement,map);
		return list;
	}
	
	public boolean delete(int id) {
		String statement = "resource.MypageMapper.delete";
		if (session.delete(statement, id) != 1)
			return false;
		return true;
	}
	
	public boolean complete(Map<String, Object> map) {
		String statement = "resource.MypageMapper.complete";
		if (session.delete(statement, map) != 1)
			return false;
		return true;
	}
}
