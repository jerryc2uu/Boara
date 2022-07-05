package com.githrd.boa.service.p;



import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.*;
import org.springframework.stereotype.Service;

import com.githrd.boa.vo.p.*;

@Service
@Aspect
public class LogService {
	
	private static Logger reboardLog = LoggerFactory.getLogger("reboardLog"); 
	private static Logger myInfoLog = LoggerFactory.getLogger("myInfoLog"); 
	
	//댓글 등록 로그
	@After("execution(* com.githrd.boa.controller.p.Reboard.reboardWriteProc(..))")
	public void boardLogWrite(JoinPoint join) {
		ReboardVO rVO = (ReboardVO) join.getArgs()[1];
		String result = rVO.getResult();
		String id = rVO.getId();
		int rno = rVO.getRno();
		
		
		if(result.equals("OK")){
			//정상 등록
			reboardLog.info(id + " 회원님이 [ " + rno + " ] 번 댓글을 작성했습니다.");
		}
	}
	
	//대댓글 등록 로그
	@After("execution(* com.githrd.boa.controller.p.Reboard.reboardCommentProc(..))")
	public void commentLog(JoinPoint join) {
		ReboardVO rVO = (ReboardVO) join.getArgs()[1];
		String id = rVO.getId();
		int cnt = rVO.getCnt();
		int rno = rVO.getRno();
		
		if(cnt == 1) {
			//정상 등록
			reboardLog.info(id + " 회원님이 [ " + rno + " ] 번 대댓글을 작성했습니다.");
		}
	}
	
	//댓글 삭제 로그
	@After("execution(* com.githrd.boa.controller.p.Reboard.reboardDel(..))")
	public void reboardDel(JoinPoint join) {
		ReboardVO rVO = (ReboardVO) join.getArgs()[1];
		String id = rVO.getId();
		int cnt = rVO.getCnt();
		int rno = rVO.getRno();
		
		if(cnt == 1) {
			//정상 삭제
			reboardLog.info(id + " 회원님이 [ " + rno + " ] 번 댓글을 삭제했습니다.");
		}
	}
	
	//댓글 수정 로그
	@After("execution(* com.githrd.boa.controller.p.Reboard.reboardEditProc(..))")
	public void reboardEdit(JoinPoint join) {
		ReboardVO rVO = (ReboardVO) join.getArgs()[1];
		String id = rVO.getId();
		int cnt = rVO.getCnt();
		int rno = rVO.getRno();
		
		if(cnt == 1) {
			//정상 삭제
			reboardLog.info(id + " 회원님이 [ " + rno + " ] 번 댓글을 수정했습니다.");
		}
	}
	
	//포인트 충전 로그
	@After("execution(* com.githrd.boa.controller.p.MyInfo.addPointProc(..))")
	public void addPoint(JoinPoint join) {
		MyInfoVO iVO = (MyInfoVO) join.getArgs()[1];
		String id = iVO.getId();
		String result = iVO.getResult();
		int gnp = iVO.getGnp();
		if(result.equals("OK") ) {
			//정상 삭제
			myInfoLog.info(id + " 회원님이 [ " + gnp + " ] 포인트를 충전했습니다.");
		}
	}
	
}
