package com.githrd.boa.dao.p;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.vo.p.MyInfoVO;

/**
 * 이 클래스는 마이 페이지 관련 데이터 베이스 전담 처리 함수들로 구성된 클래스
 * @author 박소연
 * @since  2022.06.16
 * @version v.1.0
 * 
 * 			작업이력 ]
 * 				2022.06.15 - 담당자 : 박소연
 * 							클래스 제작
 * 				2022.06.18 - 마이페이지 메인
 * 				2022.06.20 - 좋아요, 구매글, 포인트 내역
 * 				2022.06.21 - 찜, 나의 게시글, 나의 댓글
 * 				2022.06.22 - 포인트 충전
 * 				2022.06.24 - 환불 시 포인트 차감, 컬럼 변경
 * 				2022.07.22 - 자동 충전, 자동 충전 해지
 */
public class MyInfoDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//마이페이지 메인 정보 조회 함수
	public MyInfoVO getMyInfo(MyInfoVO iVO) {
		return sqlSession.selectOne("iSQL.getMyInfo", iVO);
	}

	//구매글 수 조회 함수
	public int myBuyCount(String id) {
		return sqlSession.selectOne("iSQL.myBuyCount", id);
	}

	//구매글 리스트 조회 함수
	public List<MyInfoVO> myBuyList(MyInfoVO iVO) {
		return sqlSession.selectList("iSQL.myBuyList", iVO);
	}
	
	//포인트 내역 갯수 조회
	public int myPointCnt(MyInfoVO iVO) {
		return sqlSession.selectOne("iSQL.myPointCnt", iVO);
	}
	//포인트 내역 조회 함수
	public List<MyInfoVO> myPoint(MyInfoVO iVO) {
		return sqlSession.selectList("iSQL.myPoint", iVO);
	}
	//좋아요 갯수 조회
	public int myLikeCnt(String id) {
		return sqlSession.selectOne("iSQL.myLikeCnt", id);
	}
	//좋아요 리스트 조회 함수
	public List<MyInfoVO> myLikeList(MyInfoVO iVO) {
		return sqlSession.selectList("iSQL.myLike", iVO);
	}
	//찜 갯수 조회
	public int myJJimCnt(String id) {
		return sqlSession.selectOne("iSQL.myJJimCnt", id);
	}
	//찜 리스트 조회 함수
	public List<MyInfoVO> myJJimList(MyInfoVO iVO) {
		return sqlSession.selectList("iSQL.myJJim", iVO);
	}

	//내가 쓴 게시글 갯수 조회
	public int myBoardCnt(String id) {
		return sqlSession.selectOne("iSQL.myBoardCnt", id);
	}
	//내가 쓴 게시글 리스트 조회 함수
	public List<MyInfoVO> myBoardList(MyInfoVO iVO) {
		return sqlSession.selectList("iSQL.myBoard", iVO);
	}
	//내가 쓴 댓글 갯수 조회
	public int myReboardCnt(String id) {
		return sqlSession.selectOne("iSQL.myReboardCnt", id);
	}
	//내가 쓴 댓글 리스트 조회 함수
	public List<MyInfoVO> myReboardList(MyInfoVO iVO) {
		return sqlSession.selectList("iSQL.myReboard", iVO);
	}
	//자동충전 해지 함수
	public int cancleAuto(MyInfoVO iVO) {
		return sqlSession.insert("iSQL.cancleAuto", iVO);
	}	
	//포인트 충전 폼보기
	public MyInfoVO addPoint(MyInfoVO iVO) {
		return sqlSession.selectOne("iSQL.addPoint", iVO);
	}
	//포인트 충전 처리 함수 {
	public int addPointProc(MyInfoVO iVO) {
		return sqlSession.insert("iSQL.addPointProc", iVO);
	}
	
	//환불 시 컬럼 변경
	public int refund(MyInfoVO iVO) {
		return sqlSession.insert("iSQL.refund", iVO);
	}

	//환불 시 포인트 차감
	public int minusPoint(MyInfoVO iVO) {
		return sqlSession.insert("iSQL.minusPoint", iVO);
	}
}
