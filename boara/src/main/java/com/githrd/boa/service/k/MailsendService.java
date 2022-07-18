package com.githrd.boa.service.k;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

/**
 *  mail 관련 부가기능 관리할 클래스
 * 	@author 김소연
 * 	@since 2022.07.16
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.07.16	-	클래스 제작
 * 								담당자 : 김소연
 *
 */
public class MailsendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber; 
		
		// 난수 발생
		public void makeRandomNumber() {
			Random r = new Random();
			int checkNum = r.nextInt(888888) + 111111;
			System.out.println("인증번호 : " + checkNum);
			authNumber = checkNum;
		}
		
		
				//이메일 보낼 양식! 
		public String joinEmail(String email) {
			makeRandomNumber();
			String addr = "soyeoningk@gmail.com"; 
			String toMail = email;
			String title = "BOARA 회원 가입 인증 이메일 입니다.";
			String body = 
					"BOARA를 방문해주셔서 감사합니다." + 	
	                "<br><br>" + 
				    "인증 번호는 " + authNumber + "입니다." + 
				    "<br>" + 
				    "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
			mailSend(addr, toMail, title, body);
			return Integer.toString(authNumber);
		}
		
		//이메일 전송 메소드
		public void mailSend(String addr, String toMail, String title, String body) { 
			MimeMessage message = mailSender.createMimeMessage();
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
				helper.setFrom(addr);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(body,true);
				mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		
	
}
