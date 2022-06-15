package com.githrd.boa.dao.k;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.vo.k.MemberVO;

public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인 처리
	public int getLogin(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.login", mVO);
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
	
	
	
}