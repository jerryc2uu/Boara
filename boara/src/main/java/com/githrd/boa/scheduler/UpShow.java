package com.githrd.boa.scheduler;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.dao.k.MemberDao;
import com.githrd.boa.vo.k.MemberVO;

public class UpShow {
	@Autowired
	MemberDao mDao;
	
	private static final Logger mLog = LoggerFactory.getLogger("memberLog");
	
	public void upIsshow() {
		List<MemberVO> list = mDao.getUpId();
		int cnt = mDao.upIsshow();
		if(cnt >= 1) {
			for(MemberVO mVO : list) {
				mLog.info(mVO.getId() + "님이 휴먼계정으로 변경됐습니다.");
			}
		}
	}
}
