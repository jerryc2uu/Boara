package com.githrd.boa.service.k;



import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.githrd.boa.vo.k.MemberVO;
import com.githrd.boa.vo.k.MessageVO;

/**
 *  member 관련 로그 처리를 관리할 클래스
 * 	@author 김소연
 * 	@since 2022.06.29
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.29	-	클래스 제작
 * 								담당자 : 김소연
 *
 */


  @Service // service 클래스 빈 등록해주는 annotation
  @Aspect 
  public class MemberLogService { 
	  private static Logger memberLog = LoggerFactory.getLogger("memberLog");
  
  
  // 로그인
  
  @After("execution(* com.githrd.boa.controller.k.Member.loginProc(..))")
  public void login(JoinPoint join) { 
	  MemberVO mVO = (MemberVO) join.getArgs()[0];
	 
	  if(mVO.getCnt() == 1) { 
		  memberLog.info(mVO.getId() + " 님이 로그인 했습니다."); 
		  } 
	  }
  
  // 로그아웃
  @After("execution(* com.githrd.boa.controller.k.Member.logout(..))") 
  public void logout(JoinPoint join) { 
	  MemberVO mVO = (MemberVO) join.getArgs()[2];
	  String result = mVO.getResult();
  
	  if(result.equals("OK")){ 
		  memberLog.info(mVO.getId() + " 님이 로그아웃 했습니다."); 
		  } 
	  }
  
  // 회원가입
  @After("execution(* com.githrd.boa.controller.k.Member.joinProc(..))") 
  public  void addMember(JoinPoint join) { 
	  MemberVO mVO = (MemberVO) join.getArgs()[2];
	  String result = mVO.getResult(); 
	  if(result.equals("OK")){
		  memberLog.info(mVO.getId() + " 님이 회원가입 했습니다."); 
		  } 
	  } 
  
  // 회원정보 수정
  @After("execution(* com.githrd.boa.controller.k.Member.editProc(..))") 
  public void edit(JoinPoint join) { 
	  MemberVO mVO = (MemberVO) join.getArgs()[2];
	  String result = mVO.getResult(); 
	  if(result.equals("OK")) {
		  memberLog.info(mVO.getId() + " 님이 회원정보를 수정했습니다."); 
		  } 
	  }
  // 비밀번호 변경
  @After("execution(* com.githrd.boa.controller.k.Member.updatePw(..))")
  public void upPw(JoinPoint join) { 
	  MemberVO mVO = (MemberVO) join.getArgs()[0];
	 
	  if(mVO.getCnt() == 1) { 
		  memberLog.info(mVO.getId() + " 님이 비밀번호를 변경 했습니다."); 
		  } 
	  }
  
   //탈퇴

  @After("execution(* com.githrd.boa.controller.k.Member.delProc(..))")
  public void del(JoinPoint join) { 
	  MemberVO mVO = (MemberVO)join.getArgs()[3]; 
	  if(mVO.getCnt() == 1) {  
		  memberLog.info(mVO.getId() +" 님이 회원탈퇴 했습니다."); 

	  } 
  }
  
  //쪽지 전송
  @After("execution(* com.githrd.boa.controller.k.Main.sendMess(..))")
  public void message(JoinPoint join) { 
	  MessageVO msVO = (MessageVO)join.getArgs()[0]; 
	  if(msVO.getCnt() == 1) {  
		  memberLog.info(msVO.getId() + " 님이 " + msVO.getRecvid() + "님에게 쪽지를 발신했습니다."); 
		  
	  } 
  }
}
 
