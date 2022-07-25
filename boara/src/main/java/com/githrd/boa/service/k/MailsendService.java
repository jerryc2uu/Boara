package com.githrd.boa.service.k;

import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



/**
 *  메일, 문자 인증 관련 부가기능 관리할 클래스
 * 	@author 김소연
 * 	@since 2022.07.16
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.07.16	-	클래스 제작
 * 							메일 인증
 * 			2022.07.19	-	문자 인증
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
		
		public String humeonEmail(String email) {
			makeRandomNumber();
			String addr = "soyeoningk@gmail.com"; 
			String toMail = email;
			String title = "BOARA 휴면 해제 인증 이메일 입니다.";
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
		
		
		public void certifiedPhoneNumber(String tel, int randomNumber) {
			String api_key = "NCS8L2IUTGEWTBL9";
		    String api_secret = "NPGZRC9LGJQF7LBWDUTJB6GTMNWUKVFP";
		    Message coolsms = new Message(api_key, api_secret);

		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", tel);    // 수신전화번호
		    params.put("from", "01049931627");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		    params.put("type", "SMS");
		    params.put("text", "[BOARA] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
		    params.put("app_version", "test app 1.2"); 

		    try {
		        JSONObject obj = (JSONObject) coolsms.send(params);
		        System.out.println(obj.toString());
		      } catch (CoolsmsException e) {
		        System.out.println(e.getMessage());
		        System.out.println(e.getCode());
		      }
		    
		}
		
	
}
