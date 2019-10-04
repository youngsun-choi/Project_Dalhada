package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.*;

@Repository
public class BucketDAO {
	@Autowired
	SqlSession session = null;
	
	public BucketDetailVO selectDetail(StringIntVO map) {
		BucketDetailVO vo = new BucketDetailVO();
		int selectedbucket_id = map.getId();
		String statement = "resource.BucketMapper.detailBucket";
		vo = session.selectOne(statement, map);
		statement = "resource.BucketMapper.bucketTags";
		List<String> tags = session.selectList(statement, selectedbucket_id);
		if(tags == null) 
			vo.setTags(new ArrayList<String>());
		else 
			vo.setTags(tags);
		return vo;
	}
	public List<BucketVO> selectTOPBucket(String id) {
		List<BucketVO> list = new ArrayList<BucketVO>();
		String statement = "resource.BucketMapper.selectTOPBucket";
		list = session.selectList(statement, id);
		
		return list;
	}
	public int insertLikeInfo(LikeInfoVO vo) {
		String statement = "resource.BucketMapper.insertLike";
		return session.update(statement, vo);
	}
	public int deleteLikeInfo(LikeInfoVO vo) {
		int result;
		String statement = "resource.BucketMapper.deleteLike";
		result = session.delete(statement, vo);
		return result;
	}
	public List<StringIntVO> selectGroups(String member_id) {
		String statement = "resource.SearchBucketMapper.selectGroupName";
		return session.selectList(statement, member_id);
	}
	public List<StringIntVO> selectTags() {
		String statement = "resource.SearchBucketMapper.selectTags";
		return session.selectList(statement);
	}
	public String insertbucket(SelectedBucketVO vo) {
		String result = "";
		String statement = "resource.BucketMapper.insertBucket";
		session.insert(statement, vo);
		statement = "resource.BucketMapper.selectImagePath";
		String member_id = vo.getMember_id();
		result = session.selectOne(statement, member_id);
		return result;
	}
}
