package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.BucketVO;
import vo.SearchBucketVO;

@Service
public class SearchBucketDAO {
	@Autowired
	SqlSession session = null;
	
	//제목검색 검색결과 수
	public int getTotalTitleCnt(String keyword) {
		String statement = "resource.SearchBucketMapper.totalTitleCnt";
		return session.selectOne(statement, keyword);
	}	
	
	//제목검색
	public List<BucketVO> searchTitle(SearchBucketVO vo){
		List<BucketVO> list = null;
		String statement = "resource.SearchBucketMapper.searchTitle";
		list = session.selectList(statement, vo);
		System.out.println(list.toString());
		System.out.println(vo);
		return list;
	}
	
	//태그검색 검색결과 수
	public int getTotalTagCnt(String tagName) {
		String statement = "resource.SearchBucketMapper.totalTagCnt";
		return session.selectOne(statement, tagName);
	}	
		
	//태그검색
	public List<BucketVO> searchTag(SearchBucketVO vo){
		List<BucketVO> list = null;
		String statement = "resource.SearchBucketMapper.searchTag";
		list = session.selectList(statement, vo);
		return list;
	}
	
	//태그명 찾기
	public List<String> selectTagName() {
		List<String> list = null;
		String statement = "resource.SearchBucketMapper.selectTagName";
		list = session.selectList(statement);
		return list;
	}
	
	//가져온 버킷을 selectedbucket에 저장
	public boolean insertSelectedBucket(BucketVO vo) {
		boolean result = true;
		String statement = "resource.SearchBucketMapper.insertSelectedBucket";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	//가져온 버킷을 selectedbucket에 저장
	/*public boolean insertSBId(LikeGetVO vo) {
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
