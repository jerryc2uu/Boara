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
 *			2022.07.18	-	함수 수정(susume)
 *								담당자 : 최이지
 *
 */

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.dao.c.RecommendDao;
import com.githrd.boa.vo.c.BoardVO;

public class Recommend {
	
	@Autowired(required=false)
	RecommendDao recoDao;

	public int susume(HttpSession session) {
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		HashMap<Integer, Integer> gnoMap = new HashMap<Integer, Integer>();
		int cate = 0;
		
		if(session.getAttribute("SID") == null) return cate;	// 조회한 글이 없으면 0 반환
		
		// boara 장르와 interpark api 장르 코드 매치할 맵 작성
		map.put(1001, 102);
		map.put(1004, 102);
		map.put(1002, 101);
		map.put(1006, 101);
		map.put(1010, 101);
		map.put(1003, 108);
		map.put(1005, 108);
		map.put(1007, 108);
		map.put(1015, 108);
		map.put(1008, 205);
		map.put(1009, 205);
		map.put(1012, 205);
		map.put(1011, 215);
		map.put(1016, 215);
		map.put(1014, 214);
		map.put(1013, 214);
		map.put(1017, 214);
		map.put(1018, 214);
		map.put(1019, 128);
		map.put(1020, 207);
		
		// 최근 조회한 20개 글 장르 불러오기
		List<BoardVO> list = recoDao.logSerach((String)session.getAttribute("SID"));
		
		// gnoMap에 추가하기
		for(BoardVO bVO : list) {
			for(int gno : bVO.getGnos()) {
				if(gnoMap.get(gno) == null) {
					gnoMap.put(gno, 1);
				}else {
					gnoMap.put(gno, gnoMap.get(gno) + 1);
				}
			}
		}
		
		// 최다 조회 장르 추출
		Set<Integer> keys = gnoMap.keySet();
		for(int ori : keys) {
			int tmp = gnoMap.get(ori);
			
			// 비교
			for(int compare : keys) {
				if (gnoMap.get(compare) > tmp) cate = compare;
				else cate = ori;
			}
		}
		
		// api용 장르 값으로 변환
		cate = map.get(cate);
		return cate;
	}
}
