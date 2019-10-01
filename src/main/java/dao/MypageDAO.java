package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.GroupVO;
import vo.MemberinfoVO;
import vo.MypageBucketVO;
import vo.MypageVO;

@Repository
public class MypageDAO {
	@Autowired
	SqlSession session = null;
	
	public MemberinfoVO UserInfo(MemberinfoVO vo1) {
		String statement= "resource.MypageMapper.memberInfo";
		return session.selectOne(statement,vo1);
	}	
	
	public List<GroupVO> groupList(String id) {
		String statement = "resource.MypageMapper.group";
		return session.selectList(statement,id);
	}
	
	public List<MypageBucketVO> GroupAllBuck(Map<String, Object> map){
		String statement = "resource.MypageMapper.GroupAllBuck";
		return session.selectList(statement,map);
	}
	
	public List<MypageBucketVO> groupChos(Map<String, Object> map){
		String statement = "resource.MypageMapper.groupChos";
		return session.selectList(statement,map);
	}
	
	public List<MypageBucketVO> bucketAll(String id){
		String statement = "resource.MypageMapper.bucketAll";
		return session.selectList(statement,id);
	}
	
	
	public List<MypageBucketVO> choose(Map<String, Object> map){
		String statement = "resource.MypageMapper.choose";
		return session.selectList(statement,map);
	}
	
	public int delete(int id) {
		String statement = "resource.MypageMapper.delete";
		return session.delete(statement, id);
	}
	
	public int complete(Map<String, Object> map) {
		String statement = "resource.MypageMapper.complete";
		return session.delete(statement, map);
	}
	
	public int updateGroup(Map<String, Object> map) {
		String statement = "resource.MypageMapper.updateGroup";
		return session.update(statement, map);
	}
	
	public int DeleteGroup(GroupVO vo) {
		String statement = "resource.MypageMapper.DeleteGroup";
		return session.update(statement, vo);
	}
	
	public int CreateGroup(Map<String, Object> map) {
		String statement = "resource.MypageMapper.CreateGroup";
		return session.insert(statement,map);
	}
}
