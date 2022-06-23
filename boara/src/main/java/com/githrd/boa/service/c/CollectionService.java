package com.githrd.boa.service.c;
/**
 * 	컬렉션 관련 기능을 부가적으로 처리하는 클래스
 * 
 * 	@author 최이지
 * 	@since 2022.06.21
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.21	-	클래스 제작
 * 								담당자 : 최이지
 *
 */

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.dao.c.CollectionDao;
import com.githrd.boa.vo.c.*;

public class CollectionService {
	
	@Autowired
	CollectionDao cDao;
	
	// 컬렉션 리스트 불러오며, 장르도 같이 뽑아주기
	public List<CollecVO> getCollList(CollecVO cVO){
		// 장르 데이터 꺼내기
		List<GenreVO> glist = cDao.getGnr();
		
		// 데이터 꺼내주기
		List<CollecVO> list = cDao.getCList(cVO);
		
		// 장르 처리
		for(CollecVO vo : list) {
			if(vo.getGnos()!= null) {
				for(int gno : vo.getGnos()) {
					for(GenreVO gnr : glist) {
						if(gnr.getGno() == gno) vo.getGenre().add(gnr.getGname());
					}
				}
			}
		}
		
		return list;
	}
}
