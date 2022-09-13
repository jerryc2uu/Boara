package com.githrd.boa.service.p;
/**
 * 포인트 충전 및 환불 api 관리할 클래스

 * 
 * @author 박소연
 * @since 2022.06.22
 * @version v.1.0
 * 
 *       작업 이력 ]
 *          2022.06.22 - 담당자 : 박소연
 *                      클래스 제작
 */
import java.io.*;


import java.net.URL;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.githrd.boa.dao.p.MyInfoDao;
import com.githrd.boa.vo.p.MyInfoVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;


@Service
public class IamPort {
   
   @Autowired
   MyInfoDao iDao;
   
   //결제 취소
   @Transactional
   public void refundPoint(MyInfoVO iVO) {
      
      String imp_uid = iVO.getImp_uid(); 
      int gnp = iVO.getGnp();
      
      try {
         String token = getToken();
         if(payMentCancle(token, imp_uid, gnp) == true) {            
            iDao.refund(iVO);
            iDao.minusPoint(iVO);
         }
      } catch (IOException e) {
         e.printStackTrace();
      }
      
   }
   
   //토큰 발급
   public String getToken() throws IOException { //버퍼를 사용하므로 예외 처리
       
      
	  //REST api 호출 위해 사용 (웹을 통해 데이터 주고 받을 때 사용)
      HttpsURLConnection conn = null;

      //절대 경로로 사이트와 연결
      URL url = new URL("https://api.iamport.kr/users/getToken");
      conn = (HttpsURLConnection) url.openConnection();
      
      //전달 방식은 post, json 형식으로 데이터 주고 받는다.
      conn.setRequestMethod("POST");
      conn.setRequestProperty("Content-type", "application/json");
      conn.setRequestProperty("Accept", "application/json");
      
      //서버와 통신하고자 true 설정
      conn.setDoOutput(true);
      
      //json 객체
      JsonObject json = new JsonObject();

      //json 형식으로 관리자 정보 보내주고
      json.addProperty("imp_key", "1050448697343442");
      json.addProperty("imp_secret", "7c180050ae3ff7479c4d2337eb77e46d85d5cc1b399ba4359b4beaeecef0947019f695cec9bf99e9");
      
      //할당된 버퍼에 값 넣어주기
      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
      
      bw.write(json.toString()); // 버퍼에 있는 값 모두 출력 (문자열 형식으로)
      bw.flush(); //남은 데이터 모두 출력
      bw.close(); //스트림 닫기
      
      //utf-8 인코딩 방식으로 토큰을 읽어온다.
      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            
      //gson을 사용해 json을 hashMap으로 변환
      Gson gson = new Gson();
      String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
      String token = gson.fromJson(response, Map.class).get("access_token").toString();
      
      //버퍼 닫아주고
      br.close();
      
      //연결 끊고
      conn.disconnect();
      
      //토큰 반환
      return token;
   }
   
   
   //결제 취소   
   public boolean payMentCancle(String access_token, String imp_uid, int gnp) throws IOException  {
      
	  //REST api 호출 위해 사용 (웹을 통해 데이터 주고 받을 때 사용)
      HttpsURLConnection conn = null;
      
      //절대 경로로 사이트와 연결
      URL url = new URL("https://api.iamport.kr/payments/cancel");
      conn = (HttpsURLConnection) url.openConnection();
 
      //전달 방식은 post, json 형식으로 데이터 주고 받는다.
      conn.setRequestMethod("POST");
      conn.setRequestProperty("Content-type", "application/json");
      conn.setRequestProperty("Accept", "application/json");
      conn.setRequestProperty("Authorization", access_token);
 
      //서버와 통신하고자 true 설정
      conn.setDoOutput(true);
      
      //json 객체
      JsonObject json = new JsonObject();
      
      //json 형식으로 결제번호, 금액 생성
      json.addProperty("imp_uid", imp_uid);
      json.addProperty("amount", gnp);
 
      //할당된 버퍼에 데이터 입력
      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
 
      bw.write(json.toString());
      bw.flush();
      bw.close();
      
      //utf-8 인코딩 방식으로 데이터 출력
      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
 
      br.close();
      
      //반환값
      return true;
   }
   
}