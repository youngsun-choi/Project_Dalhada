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
		System.out.println(vo);
		System.out.println("insert 에걸림");
		String statement = "resource.MemberMapper.insertMember";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	public boolean checkId(String id) {
		System.out.println("DAO넘어온값 " + id);
		String statement = "resource.MemberMapper.checkId";
		if (session.selectOne(statement, id) != null) {
			System.out.println("return TRUE쪽");
			return true;
		}
		System.out.println("return false걸림");
		return false;
	}	
	
	public MemberinfoVO checklogin(String id, String password) {
		String statement= "resource.MemberMapper.login";
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("password", password);
		System.out.println("checkLogin map객체 : "+map);
		MemberinfoVO vo = session.selectOne(statement,map);
		if(session.selectOne(statement,map) != null) return vo;
		return null;
	}	
		
}




