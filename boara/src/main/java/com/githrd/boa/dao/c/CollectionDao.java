package com.githrd.boa.dao.c;
/**
 * 	컬렉션 관련 db 작업을 전담할 Dao 클래스입니다.
 * 
 * 	@author 최이지
 * 	@since 2022.06.16
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.16	-	클래스 제작
 * 								담당자 : 최이지
 * 
 * 			2022.06.21	-	함수 추가(getGnr, getTotal)
 * 								담당자 : 최이지
 * 
 * 			2022.06.22	-	함수 수정(getTotal)
 * 							함수 추가(delColl)
 * 								담당자 : 최이지
 */

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.vo.c.*;

public class CollectionDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	// 장르 리스트 뽑아오기
	public List<GenreVO> getGnr(){
		return sqlSession.selectList("cSQL.getGnr");
	}
	
// 컬렉션 리스트 관련 -----------------------------------------------------------------
	
	// 컬렉션 리스트 조회
	public List<CollecVO> getCList(CollecVO cVO){
		if(cVO.getCid() == null) {
			return sqlSession.selectList("cSQL.cListDefault", cVO);
		}else {
			return sqlSession.selectList("cSQL.cListToId", cVO);
		}
	}
	
	// 컬렉션 리스트 개수 조회
	public int getTotal(CollecVO cVO) {
		if(cVO.getCid() == null) {
			return sqlSession.selectOne("cSQL.cCntDefault");
		}else {
			return sqlSession.selectOne("cSQL.cCntToId", cVO);
		}
	}
	
	// 컬렉션 삭제버튼
	public int delColl(CollecVO cVO) {
		return sqlSession.update("cSQL.delColl", cVO);
	}
	
// 작성 -------------------------------------------------------------
// 수정 -------------------------------------------------------------
}
