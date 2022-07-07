package com.githrd.boa.dao.k;
/**
 * 메인 게시판 관련 db 작업 할 Dao클래스
 * @author	김소연
 * @since	2022.06.12
 * @version	v.1.0
 *  
 * 			작업이력 ]
 * 				2022.06.12	-	담당자 : 김소연
 * 									클래스 제작 
 *
 */

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


import com.githrd.boa.vo.k.FileVO;
import com.githrd.boa.vo.k.SearchVO;

public class MainBoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 주간 TOP 게시글
	public List<FileVO> getTopBoard() {
		return sqlSession.selectList("maSQL.topBoard");
	}
	// HOT 게시글
	public List<FileVO> getHotBoard() {
		return sqlSession.selectList("maSQL.hotBoard");
	}
	// 검색 게시물, 컬렉션 개수 조회
	public int getTotal(SearchVO sVO) {
		return sqlSession.selectOne("maSQL.getTotal", sVO);
	}
	// 컬렉션 조회 목록
	public List<SearchVO> getColList(SearchVO sVO) {
		return sqlSession.selectList("maSQL.getColList", sVO);
	}
	//게시물 조회 목록
	public List<SearchVO> getBoList(SearchVO sVO) {
		return sqlSession.selectList("maSQL.getBoList", sVO);
	}
	// 장르 디테일 조회
	public List<SearchVO> getGnr() {
		return sqlSession.selectList("maSQL.gnrList");
	}
	
}