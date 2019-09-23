package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.LikeGetVO;
import vo.SearchBucketVO;

@Service
public class SearchBucketDAO {
	@Autowired
	SqlSession session = null;
	
	//제목검색 검색결과 수
	public int getTotalTitleCnt(String searchKeyword) {
		String statement = "resource.SearchBucketMapper.totalTitleCnt";
		return session.selectOne(statement, searchKeyword);
	}	
	
	//제목검색
	public List<SearchBucketVO> searchTitle(SearchBucketVO vo){
		List<SearchBucketVO> list = null;
		String statement = "resource.SearchBucketMapper.searchTitle";
		list = session.selectList(statement, vo);
		return list;
	}
	
	//태그검색 검색결과 수
	public int getTotalTagCnt(String searchTagName) {
		String statement = "resource.SearchBucketMapper.totalTagCnt";
		return session.selectOne(statement, searchTagName);
	}	
		
	//제목검색
	public List<SearchBucketVO> searchTag(SearchBucketVO vo){
		List<SearchBucketVO> list = null;
		String statement = "resource.SearchBucketMapper.searchTag";
		list = session.selectList(statement, vo);
		return list;
	}
	
	//가져오기 cnt값 찾기
	public LikeGetVO selectGetCnt(int id) {
		LikeGetVO vo = null;
		String statement = "resource.SearchBucketMapper.selectGetCnt";
		vo = session.selectOne(statement, id);
		return vo;
	}
	
	//가져오기 cnt값 증가
	public boolean updateGetCnt(LikeGetVO vo) {
		boolean result = true;
		String statement = "resource.SearchBucketMapper.updateGetCnt";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	//가져온 버킷을 selectedbucket에 저장
	/*public boolean insertSelectedBucket(LikeGetVO vo) {
		boolean result = true;
		String statement = "resource.SearchBucketMapper.insertSelectedBucket";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}*/
}
