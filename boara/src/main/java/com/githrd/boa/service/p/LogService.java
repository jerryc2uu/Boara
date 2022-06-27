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
	
	
	
	
	//댓글 등록 로그
	@After("execution(* com.githrd.boa.controller.p.Reboard.reboardWriteProc(..))")
	public void boardLogWrite(JoinPoint join) {
		ReboardVO rVO = (ReboardVO) join.getArgs()[1];
		String result = rVO.getResult();
		String id = rVO.getId();
		int rno = rVO.getRno();
		
		System.out.println("************** result : " + result);
		
		if(result.equals("OK")){
			System.out.println("gggg");
			//정상 등록
			reboardLog.info(id + " 회원님이 [ " + rno + " ] 번 댓글을 작성했습니다.");
		}
	}
	
	
}
