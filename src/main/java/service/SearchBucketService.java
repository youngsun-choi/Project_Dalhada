package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SearchBucketDAO;
import vo.BucketVO;
import vo.SearchBucketVO;
import vo.TagInfoVO;

@Service
public class SearchBucketService {
	@Autowired
	private SearchBucketDAO dao;
	
	//제목검색 검색결과 수
	public int getTotalTitleCnt(String keyword) {
		return dao.getTotalTitleCnt(keyword);
	}	
	
	//제목검색
	public List<BucketVO> searchTitle(SearchBucketVO vo){
		return dao.searchTitle(vo);
	}
	
	//태그검색 검색결과 수
	public int getTotalTagCnt(String tagName) {
		return dao.getTotalTagCnt(tagName);
	}	
		
	//태그검색
	public List<BucketVO> searchTag(SearchBucketVO vo){
		return dao.searchTag(vo);
	}
	
	//태그명 찾기
	public List<TagInfoVO> selectTagName() {
		return dao.selectTagName();
	}
	
	//그룹명 찾기
	/*public List<GroupVO> selectGroupName(String id) {
		return dao.selectGroupName(id);
	}
	
	//가져오기 select
	public BucketDetailVO selectSelectedBucket(int id) {
		return dao.selectSelectedBucket(id);
	}	
	
	//선택된 태그 검색
	public List<String> selectSelectedTag(int id) {
		return dao.selectSelectedTag(id);
	}	
	
	//가져온 버킷을 selectedbucket에 저장
	public boolean insertSelectedBucket(BucketVO vo) {
		return dao.insertSelectedBucket(vo);
	}
	
	//가져온 버킷을 selectedbucket에 저장
	public boolean insertSBId(LikeGetVO vo) {
		boolean result = true;
		String statement = "resource.SearchBucketMapper.insertSBId";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	public boolean insertSBContent(LikeGetVO vo) {
		boolean result = true;
		String statement = "resource.SearchBucketMapper.insertSBContent";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}*/
}
