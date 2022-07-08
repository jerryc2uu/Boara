package com.githrd.boa.dao.c;
/**
 * 	회원별 선호장르 파악 후
 * 	회원별 최다 조회 장르의 실물 도서를 추천 db작업을 할
 * 	dao 클래스 입니다.
 *	@author 최이지
 *	@since 2022.07.08
 *	@version v.1.0
 *		작업 이력
 *			2022.07.08	-	클래스 제작
 *								담당자 : 최이지
 *
 */

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.vo.c.BoardVO;

public class RecommendDao {

	@Autowired(required=false)
	SqlSessionTemplate sqlSession;
	
	public List<BoardVO> logSerach(String id){
		return sqlSession.selectList("recoSQL.logSerach", id);
	}
}
