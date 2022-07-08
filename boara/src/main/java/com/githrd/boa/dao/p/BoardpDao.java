package com.githrd.boa.dao.p;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.vo.p.MyInfoVO;

/**
 * 이 클래스는 마이 페이지 관련 데이터 베이스 전담 처리 함수들로 구성된 클래스
 * @author 박소연
 * @since  2022.07.05
 * @version v.1.0
 * 
 * 			작업이력 ]
 * 				2022.07.05 - 담당자 : 박소연
 * 									클래스 제작
 */
public class BoardpDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//현재 총 포인트 조회
	public int selPoint(MyInfoVO iVO) {
		return sqlSession.selectOne("pSQL.selPoint", iVO);
	}

	//게시글 구매 함수
	public int buyBoard(MyInfoVO iVO) {
		return sqlSession.insert("pSQL.buyBoard", iVO);
	}
	
	//핫 포스팅 등록 처리 함수
	public int hotBoardProc(MyInfoVO iVO) {
		return sqlSession.insert("pSQL.hotBoardProc", iVO);
	}
	
	//핫 포스팅 등록 시 포인트 차감 함수
	public int hotBoardPoint(MyInfoVO iVO) {
		return sqlSession.insert("pSQL.hotBoardPoint", iVO);
	}
}
