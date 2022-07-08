package com.githrd.boa.service.c;
/**
 * 	회원별 선호장르 파악 후
 * 	회원별 최다 조회 장르의 실물 도서를 추천을 하는 서비스 클래스 입니다.
 *	@author 최이지
 *	@since 2022.07.08
 *	@version v.1.0
 *		작업 이력
 *			2022.07.08	-	클래스 제작
 *								담당자 : 최이지
 *
 */

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.dao.c.RecommendDao;
import com.githrd.boa.vo.c.BoardVO;

public class Recommend {
	
	@Autowired(required=false)
	RecommendDao recoDao;

	public int susume(HttpSession session) {
		int cate = 0;
		
		if(session.getAttribute("SID") == null) return cate;
		
		List<BoardVO> list = recoDao.logSerach((String)session.getAttribute("SID"));
		int cnt = 0;
		for(BoardVO bVO : list) {
			for(int gno : bVO.getGnos()) {
				cnt++;
			}
		}
		
		int[] gnos = new int[cnt];
		
		int tmp = 0;
		for(BoardVO bVO : list) {
			for(int gno : bVO.getGnos()) {
				gnos[tmp] = gno;
				tmp++;
			}
		}
		
		for(int most : gnos) {
			
		}
		
		switch(cate){
			case 0:
				break;
		}
		
		return cate;
	}
}
