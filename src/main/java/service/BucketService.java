package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BucketDAO;
import vo.BucketDetailVO;
import vo.BucketVO;
import vo.EditBucketInfoVO;
import vo.LikeInfoVO;
import vo.SelectedBucketVO;
import vo.StringIntVO;

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

	public String insertBucket(SelectedBucketVO vo) {
		return bucketdao.insertbucket(vo);
	}

	public EditBucketInfoVO getEditInfo(StringIntVO map) {
		EditBucketInfoVO vo = bucketdao.getEditInfo(map);
		vo.setGroup_list(bucketdao.selectGroups(map.getName()));
		vo.setTag_list(bucketdao.selectTags());
		vo.setMy_tags(bucketdao.selectTagInfo(map.getId()));
		return vo;
	}

	public int updateBucket(SelectedBucketVO vo) {
		return bucketdao.updateBucket(vo);
	}
}