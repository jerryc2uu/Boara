package com.githrd.boa.dao.k;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.vo.k.FileVO;

public class MainBoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 주간 TOP 게시글
	public List<FileVO> gettopBoard() {
		return sqlSession.selectList("maSQL.topBoard");
	}
	
}