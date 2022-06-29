package com.githrd.boa.service.c;
/**
 * 	이 클래스는 게시글, 컬렉션 관련 로그 처리를 담당할
 * 	Logger 클래스입니다.
 * 	@author 최이지
 * 	@since 2022.06.29
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.29	-	클래스 제작
 * 								담당자 : 최이지
 *
 */

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.*;
import org.springframework.stereotype.Service;

import com.githrd.boa.vo.c.*;

@Service
@Aspect
public class EzLogger {
	private static Logger collecLog = LoggerFactory.getLogger("collectionLog");
	private static Logger boardLog = LoggerFactory.getLogger("boardLog");
	
// 컬렉션 관련 로그 작업 ------------------------------------------------------------------------

	// 컬렉션 작성
	@After("execution(* com.githrd.boa.controller.c.Collection.collecWriteProc(..))")
	public void collLogWrite(JoinPoint join) {
System.out.println("Logger 작동");
		CollecVO cVO = (CollecVO) join.getArgs()[1];
		if(cVO.getResult().contentEquals("YES")) collecLog.info(cVO.getId() + " 회원 " + cVO.getCno() + "번 컬렉션 작성");
	}
	
	// 컬렉션 수정
	@After("execution(* com.githrd.boa.controller.c.Collection.collecEditProc(..))")
	public void collLogEdit(JoinPoint join) {
System.out.println("Logger 작동");
		CollecVO cVO = (CollecVO) join.getArgs()[1];
		if(cVO.getResult().contentEquals("YES")) collecLog.info(cVO.getId() + " 회원 " + cVO.getCno() + "번 컬렉션 수정");
	}
	
	// 컬렉션 삭제
	@After("execution(* com.githrd.boa.controller.c.Collection.collecDel(..))")
	public void collLogDel(JoinPoint join) {
		CollecVO cVO = (CollecVO) join.getArgs()[1];
		if(cVO.getResult().contentEquals("YES")) collecLog.info(cVO.getId() + " 회원 " + cVO.getCno() + "번 컬렉션 삭제");
	}
	
// 게시글 관련 로그 작업 ------------------------------------------------------------------------

	// 게시글 작성
	@After("execution(* com.githrd.boa.controller.c.Board.boardWriteProc(..))")
	public void boardLogWrite(JoinPoint join) {
		BoardVO bVO = (BoardVO) join.getArgs()[1];
		if(bVO.getResult().contentEquals("YES")) boardLog.info(bVO.getId() + " 회원 " + bVO.getBno() + "번 게시글 작성, 10P 적립");
	}
	
	// 게시글 수정
	@After("execution(* com.githrd.boa.controller.c.Board.boardEditProc(..))")
	public void boardLogEdit(JoinPoint join) {
		BoardVO bVO = (BoardVO) join.getArgs()[1];
		if(bVO.getResult().contentEquals("YES")) boardLog.info(bVO.getId() + " 회원 " + bVO.getBno() + "번 게시글 수정");
	}
	
	// 게시글 삭제
	@After("execution(* com.githrd.boa.controller.c.Board.boardDel(..))")
	public void boardLogDel(JoinPoint join) {
		BoardVO bVO = (BoardVO) join.getArgs()[3];
		CollecVO cVO = (CollecVO) join.getArgs()[1];
		if(bVO.getResult().contentEquals("YES")) boardLog.info(cVO.getId() + " 회원 " + bVO.getBno() + "번 게시글 삭제");
	}
	
	// 좋아요
	@After("execution(* com.githrd.boa.controller.c.Board.likeProc(..))")
	public void boardLogLike(JoinPoint join) {
		BoardVO bVO = (BoardVO) join.getArgs()[1];
		if(bVO.getResult().contentEquals("YES")) boardLog.info(bVO.getId() + " 회원 " + bVO.getBno() + "번 게시글 좋아요");
	}
	
	// 찜
	@After("execution(* com.githrd.boa.controller.c.Board.jjimProc(..))")
	public void boardLogJjim(JoinPoint join) {
		BoardVO bVO = (BoardVO) join.getArgs()[1];
		if(bVO.getResult().contentEquals("YES")) boardLog.info(bVO.getId() + " 회원 " + bVO.getBno() + "번 게시글 찜");
		
	}
	
	// 좋아요, 찜 해제
	@After("execution(* com.githrd.boa.controller.c.Board.discardMark(..))")
	public void boardLogDiscard(JoinPoint join) {
		BoardVO bVO = (BoardVO) join.getArgs()[0];
		if(bVO.getResult().contentEquals("YES")) boardLog.info(bVO.getId() + " 회원 " + bVO.getBno() + "번 게시글 좋아요/찜 해제");
	}
}
