package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BucketDetailVO;
import vo.BucketVO;
import vo.LikeInfoVO;

@Repository
public class BucketDAO {
	@Autowired
	SqlSession session = null;
	
	public BucketDetailVO selectDetail(int bucket_id, int selectedbucket_id) {
		BucketDetailVO vo = new BucketDetailVO();
		String statement = "resource.BucketMapper.isADBucket";
		String flag = session.selectOne(statement, bucket_id);
		System.out.println(flag);
		if(flag != "(null)") 
			statement = "resource.BucketMapper.detailBucket";
		else 
			statement = "resource.BucketMapper.detailADBucket";
		vo = session.selectOne(statement, selectedbucket_id);
		statement = "resource.BucketMapper.bucketTags";
		vo.setTags(session.selectList(statement, selectedbucket_id));
		return vo;
	}
	public List<BucketVO> selectADBucket(String id) {
		List<BucketVO> list = new ArrayList<BucketVO>();
		String statement = "resource.BucketMapper.selectADBucket";
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
}
