package com.githrd.boa.dao.p;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.util.p.PageUtil;
import com.githrd.boa.vo.p.ReboardVO;

/**
 * 이 클래스는 댓글 게시판 관련 데이터 베이스 전담 처리 함수들로 구성된 클래스
 * @author 박소연
 * @since  2022.06.12
 * @version v.1.0
 * 
 * 			작업이력 ]
 * 				2022.06.12 - 담당자 : 박소연
 * 									클래스 제작, 리스트 조회
 */
public class ReboardDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//총 댓글 수 조회 함수
	public int getTotal(ReboardVO rVO) {
		return sqlSession.selectOne("rSQL.getTotal", rVO);
	}
	
	//총 댓글 리스트 조회 함수
	public List<ReboardVO> getList(ReboardVO rVO) {
		return sqlSession.selectList("rSQL.getList", rVO);
	}
}
