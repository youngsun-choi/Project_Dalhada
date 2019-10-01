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
	
	public int insert(MemberinfoVO vo) {
		String statement = "resource.MemberMapper.insertMember";
		return session.insert(statement,vo);
	}
	
	public String checkId(String id) {
		String statement = "resource.MemberMapper.checkId";
		return session.selectOne(statement,id);
	}	
	
	public MemberinfoVO checklogin(String id, String password) {
		String statement= "resource.MemberMapper.login";
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("password", password);
		return session.selectOne(statement,map);
	}	
		
}




