package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BucketDAO;
import vo.BucketDetailVO;
import vo.BucketVO;
import vo.EditBucketInfoVO;
import vo.LikeInfoVO;
import vo.InsertedBucketVO;
import vo.StringIntVO;
import vo.UpdatedBucketVO;

@Service("bucketService")
public class BucketService {
	@Autowired
	BucketDAO bucketdao;

	public List<BucketVO> selectTOPBucket(String member_id) {
		List<BucketVO> list = bucketdao.selectTOPBucket(member_id);
		for(BucketVO vo: list) {
			vo.addClass();
		}
		return list;
	}
	public List<BucketVO> selectTagBucket(String member_id) {
		List<BucketVO> list = bucketdao.selectTagBucket(member_id);
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

	public BucketDetailVO selectDetail(StringIntVO map) {
		BucketDetailVO vo = bucketdao.selectDetail(map);
		vo.addClass();
		return vo;
	}

	public List<StringIntVO> selectGroups(String member_id) {
		return bucketdao.selectGroups(member_id);
	}

	public List<StringIntVO> selectTags() {
		return bucketdao.selectTags();
	}

	public String insertBucket(InsertedBucketVO vo) {
		return bucketdao.insertbucket(vo);
	}
	
	public int insertGetBucket(InsertedBucketVO vo) {
		return bucketdao.insertGetBucket(vo);
	}

	public EditBucketInfoVO getEditInfo(StringIntVO map) {
		EditBucketInfoVO vo = bucketdao.getEditInfo(map);
		vo.setGroup_list(bucketdao.selectGroups(map.getName()));
		vo.setTag_list(bucketdao.selectTags());
		vo.setMy_tags(bucketdao.selectTagInfo(map.getId()));
		return vo;
	}

	public int updateBucket(UpdatedBucketVO vo) {
		return bucketdao.updateBucket(vo);
	}
}