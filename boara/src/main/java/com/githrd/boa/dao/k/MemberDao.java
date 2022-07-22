package com.githrd.boa.dao.k;
/**
 * member 게시판 관련 db 작업 할 Dao클래스
 * @author	김소연
 * @since	2022.06.13
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.06.13	-	담당자 : 김소연
 * 									클래스 제작 
 * 									로그인, 로그아웃
 * 				2022.06.15 	-		회원가입 , id, mail, pw 체크 
 * 				2022.06.16	-		id/pw 찾기 
 * 				2022.06.21 	-		탈퇴처리
 * 				2022.06.23 	-		회원가입
 * 				2022.06.26 	- 		회원정보 수정
 * 				2022.07.20	-		로그인 날짜, 휴면유저 스케쥴러
 * 				2022.07.21	- 		휴면 조회, 해제
 * 				2022.07.22	-		성인등록, 회원가입쪽지
 *
 */
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.vo.k.FileVO;
import com.githrd.boa.vo.k.MemberVO;

public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 회원 조회
	public int getMemb(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.selmemb", mVO);
	}
	// 로그인 전 휴면회원 조회
	public String gethumeon(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.humeon", mVO);
	} 
	// 휴면회원 해제
	public int humeonClear(MemberVO mVO) {
		return sqlSession.update("mSQL.humeonCear", mVO);
	} 
	// 로그인 처리
	public int getLogin(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.login", mVO);
	}
	// 로그인 날짜 처리
	public int updateLo(MemberVO mVO) {
		return sqlSession.update("mSQL.upLodate", mVO);
	}
	// 회원가입
	public int addMember(MemberVO mVO) {
		return sqlSession.insert("mSQL.join", mVO);
	}
	// 포인트
	public int addPoint(MemberVO mVO) {
		return sqlSession.insert("mSQL.addPoint", mVO);
	}
	// idault 추가
	public int adult(MemberVO mVO) {
		return sqlSession.update("mSQL.adult", mVO);
	}
	// 첫회원가입 쪽지
	public int joinMess(MemberVO mVO) {
		return sqlSession.insert("mSQL.joinmess", mVO);
	}
	
	// 회원가입시 프로필 사진 추가
	public int addFile(FileVO fVO) {
		return sqlSession.insert("mSQL.joinimg", fVO);
	}
	
	// id 중복 체크
	public int getIdCnt(String id) {
		return sqlSession.selectOne("mSQL.idCnt", id);
	}
	// mail 중복 체크
	public int getmailCnt(String email) {
		return sqlSession.selectOne("mSQL.mailCnt", email);
	}
	// tel 중복 체크
	public int gettelCnt(String tel) {
		return sqlSession.selectOne("mSQL.telCnt", tel);
	}
	
	// id 찾기
	public String getSearchId(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.idSeacch", mVO);
	}
	// pw 찾기
	public int getSearchPw(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.pwSeacch", mVO);
	}
	
	// pw 변경
	public int updatePw(MemberVO mVO) {
		return sqlSession.update("mSQL.updatePw", mVO);
	}
	
	// 아이디로 회원정보조회
	public MemberVO getIdInfo(String id) {
		return sqlSession.selectOne("mSQL.getIdInfo", id);
	}
	// 아이디로 회원프로필 사진조회(리스트로 담기)
	public List<FileVO> getIdImg(String id) {
		return sqlSession.selectList("mSQL.getIdImg", id);
	}
	
	// fno 로 프로필 사진 삭제
	public int getDelImg(int fno) {
		return sqlSession.update("mSQL.delImg", fno);
	}
	// 회원정보 수정
	public int updateInfo(MemberVO mVO) {
		return sqlSession.update("mSQL.editInfo", mVO);
	}
	// 탈퇴
	public int getDelMember(MemberVO mVO) {
		return sqlSession.update("mSQL.delMember", mVO);
	}
	// lodate 1년이상 조회
	public List<MemberVO> getUpId(){
		return sqlSession.selectList("mSQL.selUpId");
	}
	// 휴먼 처리함수
	public int upIsshow() {
		return sqlSession.update("mSQL.upIsshow");
		}
}