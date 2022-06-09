package com.githrd.boa.dao.p;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.vo.p.MainVO;

public class MainDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//메인페이지에 컬렉션 리스트 띄우기
	public List<MainVO> getCol() {
		return sqlSession.selectList("mSQL.allCollection");
	}
}
