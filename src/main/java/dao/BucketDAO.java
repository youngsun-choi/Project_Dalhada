package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BucketDetailVO;

@Repository
public class BucketDAO {
	@Autowired
	SqlSession session = null;
	
	public BucketDetailVO selectDetail(int id) {
		BucketDetailVO vo = new BucketDetailVO();
		String statement = "resource.BucketDetailMapper.detailBucket";
		vo = session.selectOne(statement);
		statement = "resource.BucketDetailMapper.bucketTags";
		vo.setTags(session.selectList(statement));
		return vo;
	}
}
