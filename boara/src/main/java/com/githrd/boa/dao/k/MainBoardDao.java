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
 * 				2022.06.29  - 		top 게시글 
 * 				2022.07.03	-		컬렉션 검색
 *				2022.07.06	-		게시글 검색, hot 게시글
 *				2022.07.12	- 		발신, 수신 메세지 조회
 *				2022.07.13 	-		수신자 조회, 쪽지보내기
 *				2022.07.17	-		쪽지 상세보기
 * 
 *
 */

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.vo.k.FileVO;
import com.githrd.boa.vo.k.MessageVO;
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
	// 받은메세지 조회
	public List<MessageVO> getReceList(MessageVO msVO) {
		return  sqlSession.selectList("maSQL.receList", msVO);
	}
	// 보낸메세지 조회
	public List<MessageVO> getSendList(MessageVO msVO) {
		return  sqlSession.selectList("maSQL.sendList", msVO);
	}
	// 받는이 조회
	public List<MessageVO> getIdList(MessageVO msVO) {
		return  sqlSession.selectList("maSQL.IdList", msVO);
	}
	
	// 쪽지보내기
	public int addMess(MessageVO msVO) {
		return sqlSession.insert("maSQL.sendMess", msVO);
	}
	
	// 쪽지 상제보기
	public int updatread(MessageVO msVO) {
		return sqlSession.update("maSQL.readmess", msVO);
	}
	// 쪽지 상제보기
	public MessageVO getMessDetail(MessageVO msVO) {
		return sqlSession.selectOne("maSQL.messDetail", msVO);
	}
	
}