package com.githrd.boa.dao.k;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.vo.k.FileVO;
import com.githrd.boa.vo.k.MemberVO;

public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인 처리
	public int getLogin(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.login", mVO);
	}
	// 회원가입
	public int addMember(MemberVO mVO) {
		return sqlSession.insert("mSQL.join", mVO);
	}
	// 회원가입시 프로필 사진 정보 
	public int addFile(FileVO fVO) {
		return sqlSession.insert("mSQL.joinimg", fVO);
	}
	
	// id 중복 체크
	public int getIdCnt(String id) {
		return sqlSession.selectOne("mSQL.idCnt", id);
	}
	// id 중복 체크
	public int getmailCnt(String mail) {
		return sqlSession.selectOne("mSQL.mailCnt", mail);
	}
	// id 중복 체크
	public int gettelCnt(String tel) {
		return sqlSession.selectOne("mSQL.telCnt", tel);
	}
	
	// id 찾기
	public String getSearchId(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.idSeacch", mVO);
	}
	// pw 찾기
	public String getSearchPw(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.pwSeacch", mVO);
	}
	
	// 회원정보조회
	public MemberVO getIfInfo(String id) {
		return sqlSession.selectOne("mSQL.getIdInfo", id);
	}
	
	// 탈퇴
	public int getDelMember(MemberVO mVO) {
		return sqlSession.update("mSQL.delMember", mVO);
	}
}