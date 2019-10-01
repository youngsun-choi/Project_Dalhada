package dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberinfoVO;

@Repository
public class MemberDAO {
	@Autowired
	SqlSession session = null;
	
	public boolean insert(MemberinfoVO vo) {
		boolean result=true;
		String statement = "resource.MemberMapper.insertMember";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	public boolean checkId(String id) {
		String statement = "resource.MemberMapper.checkId";
		if (session.selectOne(statement, id) != null) {
			return true;
		}
		return false;
	}	
	
	public MemberinfoVO checklogin(String id, String password) {
		String statement= "resource.MemberMapper.login";
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("password", password);
		MemberinfoVO vo = session.selectOne(statement,map);
		if(session.selectOne(statement,map) != null) return vo;
		return null;
	}	
		
}




