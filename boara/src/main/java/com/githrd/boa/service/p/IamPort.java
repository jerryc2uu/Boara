package com.githrd.boa.service.p;
/**
 * 포인트 충전 및 환불 api 관리할 클래스
 * 
 * @author 박소연
 * @since 2022.06.22
 * @version v.1.0
 * 
 * 		작업 이력 ]
 * 			2022.06.22 - 담당자 : 박소연
 * 							클래스 제작
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
			payMentCancle(token, imp_uid, gnp);
			iDao.refund(iVO);
			iDao.minusPoint(iVO);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//토큰 발급
	public String getToken() throws IOException {
		 
		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", "1050448697343442");
		json.addProperty("imp_secret", "7c180050ae3ff7479c4d2337eb77e46d85d5cc1b399ba4359b4beaeecef0947019f695cec9bf99e9");
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
	}
	
	
	//결제 취소	
	public void payMentCancle(String access_token, String imp_uid, int gnp) throws IOException  {
		
		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/payments/cancel");
 
		conn = (HttpsURLConnection) url.openConnection();
 
		conn.setRequestMethod("POST");
 
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", access_token);
 
		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();
 
		json.addProperty("imp_uid", imp_uid);
		json.addProperty("amount", gnp);
		json.addProperty("checksum", gnp);
 
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
 
		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
 
		br.close();
	}
	
}
