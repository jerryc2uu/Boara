package com.githrd.boa.dao.c;
/**
 * 	게시글 관련 db 작업을 전담할 Dao 클래스입니다.
 * 
 * 	@author 최이지
 * 	@since 2022.06.22
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.22	-	클래스 제작
 * 								담당자 : 최이지
 */

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.vo.c.*;

public class BoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 장르 꺼내오기
	public List<GenreVO> getGnr(){
		return sqlSession.selectList("bSQL.getGnr");
	}
	
// 게시글 리스트 관련 -------------------------------------------------------------------------

	// 컬렉션 정보 꺼내오기
	public CollecVO getCInfo(CollecVO cVO) {
		return sqlSession.selectOne("bSQL.getCInfo", cVO);
	}
	
	// 컬렉션 소속 게시글 수 도출
	public int getTotal(CollecVO cVO) {
		return sqlSession.selectOne("bSQL.getTotal", cVO);
	}
	
	// 컬렉션 소속 게시글 호출
	public List<BoardVO> getBList(CollecVO cVO){
		return sqlSession.selectList("bSQL.getBList", cVO);
	}
	
	// 게시글 삭제
	public int delBoard(BoardVO bVO) {
		return sqlSession.update("bSQL.delBoard", bVO);
	}
}
