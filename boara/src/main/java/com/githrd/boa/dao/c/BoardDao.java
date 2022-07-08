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
 * 
 * 			2022.06.26	-	함수 추가(getCList, addBoard, addThumb, getBInfo, editBoard, setOldThumb, setNewThumb)
 * 								담당자 : 최이지
 * 
 * 			2022.06.27	-	함수 추가(getBDetail, didBuy, getStat)
 * 								담당자 : 최이지
 * 
 * 			2022.06.28	-	함수 추가(upClick)
 * 								담당자 : 최이지
 * 
 * 			2022.06.29	-	함수 추가(cntStat, newLike, reLike, newJjim, reJjim, discard, adultCheck, addPoint)
 * 								담당자 : 최이지
 * 
 * 			2022.07.08	-	함수 추가(getSelfTotal, getSelfBList, viewCheck)
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
	
	// 갖고 있는 컬렉션 꺼내오기
	public List<CollecVO> getCList(String id){
		return sqlSession.selectList("bSQL.getCList", id);
	}
	
// 게시글 리스트 관련 ---------------------------------------------------------------------------

	// 컬렉션 정보 꺼내오기
	public CollecVO getCInfo(CollecVO cVO) {
		return sqlSession.selectOne("bSQL.getCInfo", cVO);
	}
	
	// 컬렉션 소속 게시글 수 도출
	public int getTotal(CollecVO cVO) {
		return sqlSession.selectOne("bSQL.getTotal", cVO);
	}
	// 본인 컬렉션일 때
	public int getSelfTotal(CollecVO cVO) {
		return sqlSession.selectOne("bSQL.getSelfTotal", cVO);
	}
	
	// 컬렉션 소속 게시글 호출
	public List<BoardVO> getBList(CollecVO cVO){
		return sqlSession.selectList("bSQL.getBList", cVO);
	}
	// 본인컬렉션일때
	public List<BoardVO> getSelfBList(CollecVO cVO){
		return sqlSession.selectList("bSQL.getSelfBList", cVO);
	}
	
	// 게시글 삭제
	public int delBoard(BoardVO bVO) {
		return sqlSession.update("bSQL.delBoard", bVO);
	}

// 게시글 작성/수정 관련 ------------------------------------------------------------------------
	
	// 새 썸네일 업로드
	public int addThumb(FileVO cfVO) {
		return sqlSession.insert("bSQL.addThumb", cfVO);
	}
	
	// 게시글 작성 (파일X)
	public int addBoard(BoardVO bVO) {
		return sqlSession.insert("bSQL.addBoard", bVO);
	}
	
	// 게시글 작성시 포인트 적립
	public int addPoint(String id) {
		return sqlSession.insert("bSQL.addPoint", id);
	}
	
	// 게시글 수정시 기본 정보 불러오기
	public BoardVO getBInfo(int bno) {
		return sqlSession.selectOne("bSQL.getBInfo", bno);
	}
	
	// 게시글 썸네일 히스토리 불러오기
	public List<FileVO> getBHis(BoardVO bVO){
		return sqlSession.selectList("bSQL.getBHis", bVO);
	}
	
	// 게시글 정보 수정
	public int editBoard(BoardVO bVO) {
		return sqlSession.update("bSQL.editBoard", bVO);
	}
	
	// 게시글 썸네일 히스토리 isshow 변경
	public int setOldThumb(int bno) {
		return sqlSession.update("bSQL.setOldThumb", bno);
	}
	
	// 썸네일 히스토리 중 선택시 isshow 변경
	public int setNewThumb(int fno) {
		return sqlSession.update("bSQL.setNewThumb", fno);
	}
	
// 게시글 상세 페이지 관련 ----------------------------------------------------------------------

	// 게시글 기본 상세정보 얻기
	public BoardVO getBDetail(BoardVO bVO) {
		return sqlSession.selectOne("bSQL.getBDetail", bVO);
	}
	
	// 게시글 구매 여부 얻기
	public int didBuy(BoardVO bVO) {
		return sqlSession.selectOne("bSQL.didBuy", bVO);
	}
	
	// 좋아요/찜 여부 불러오기
	public String getStat(BoardVO bVO) {
		return sqlSession.selectOne("bSQL.getStat", bVO);
	}
	
	// 조회수 올리기
	public int upClick(int bno) {
		return sqlSession.update("bSQL.upClick", bno);
	}
	
	// 조회 기록 남기기
	public int viewCheck(BoardVO bVO) {
		return sqlSession.insert("bSQL.viewCheck", bVO);
	}
	
	// 성인 인증 여부
	public String adultCheck(String id) {
		return sqlSession.selectOne("bSQL.adultCheck", id);
	}
	
// 좋아요/찜 처리 관련 -------------------------------------------------------------------------

	// 해당 게시글 mark 여부 검사
	public int cntStat (BoardVO bVO) {
		return sqlSession.selectOne("bSQL.cntStat", bVO);
	}
	
	// NEW : 좋아요 처리
	public int newLike(BoardVO bVO) {
		return sqlSession.insert("bSQL.newLike", bVO);
	}
	
	// RE : 좋아요 처리
	public int reLike(BoardVO bVO) {
		return sqlSession.update("bSQL.reLike", bVO);
	}
	
	// NEW : 찜 처리
	public int newJjim(BoardVO bVO) {
		return sqlSession.insert("bSQL.newJjim", bVO);
	}
	
	// RE : 찜 처리
	public int reJjim(BoardVO bVO) {
		return sqlSession.update("bSQL.reJjim", bVO);
	}
	
	// 좋아요, 찜 해제 처리
	public int discard(BoardVO bVO) {
		return sqlSession.update("bSQL.discard", bVO);
	}
}