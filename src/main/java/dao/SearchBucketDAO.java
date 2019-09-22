package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.SearchTitleVO;

@Service
public class SearchBucketDAO {
	@Autowired
	SqlSession session = null;
	
	//페이징
	public int getTotalCnt(String searchKeyword) {
		String statement = "resource.SearchBucketMapper.totalCnt";
		return session.selectOne(statement, searchKeyword);
	}	
	
	//제목검색
	public List<SearchTitleVO> searchTitle(SearchTitleVO vo){
		List<SearchTitleVO> list = null;
		String statement = "resource.SearchBucketMapper.searchTitle";
		list = session.selectList(statement, vo);
		return list;
	}
}
