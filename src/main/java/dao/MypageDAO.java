package dao;


import java.util.List;

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
		System.out.println("grouplist 들어옴");
		String statement = "resource.MypageMapper.group";
		list = session.selectList(statement,id);
		return list;
	}
	
	public List<MypageBucketVO> bucketAll(String id){
		List<MypageBucketVO> list = null;
		System.out.println("bucketAll 들어옴");
		String statement = "resource.MypageMapper.bucketAll";
		list = session.selectList(statement,id);
		return list;
	}
	
	public List<MypageBucketVO> progress(String id){
		List<MypageBucketVO> list = null;
		System.out.println("progress 들어옴");
		String statement = "resource.MypageMapper.progressBuck";
		list = session.selectList(statement,id);
		return list;
	}
	
	public List<MypageBucketVO> done(String id){
		List<MypageBucketVO> list = null;
		System.out.println("done 들어옴");
		String statement = "resource.MypageMapper.doneBuck";
		list = session.selectList(statement,id);
		return list;
	}
	public boolean delete(int id) {
		String statement = "resource.MypageMapper.delete";
		System.out.println("삭제 시작");
		if (session.delete(statement, id) != 1)
			return false;
		return true;
	}
}
