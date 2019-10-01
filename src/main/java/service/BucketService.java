package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BucketDAO;
import vo.*;

@Service("bucketService")
public class BucketService {
	@Autowired
	BucketDAO bucketdao;

	public List<BucketVO> selectTOPBucket(String id) {
		List<BucketVO> list = bucketdao.selectTOPBucket(id);
		for(BucketVO vo: list) {
			vo.addClass();
		}
		return list;
	}

	public int insertLikeInfo(LikeInfoVO vo) {
		return bucketdao.insertLikeInfo(vo);
	}

	public int deleteLikeInfo(LikeInfoVO vo) {
		return bucketdao.deleteLikeInfo(vo);
	}

	public BucketDetailVO selectDetail(int bucket_id, int selectedbucket_id) {
		return bucketdao.selectDetail(bucket_id, selectedbucket_id);
	}

	public List<StringIntVO> selectGroups(String member_id) {
		return bucketdao.selectGroups(member_id);
	}

	public List<StringIntVO> selectTags() {
		return bucketdao.selectTags();
	}
}
