package com.githrd.boa.service.c;
/**
 * 	게시글 관련 기능을 부가적으로 처리하는 클래스
 * 
 * 	@author 최이지
 * 	@since 2022.06.22
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.22	-	클래스 제작
 * 								담당자 : 최이지
 *
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.boa.dao.c.BoardDao;
import com.githrd.boa.vo.c.*;

public class BoardService {

	@Autowired
	BoardDao bDao;
	
	// 컬렉션 정보 장르 처리
	public void getCGnr(CollecVO cVO){
		List<GenreVO> glist = bDao.getGnr();
		if(cVO.getSgenre().equals("empty")) return;
		
		for(GenreVO gvo : glist) {
			for(int gno : cVO.getGnos()) {
				if(gno == gvo.getGno()) {
					cVO.getGenre().add(gvo.getGname());
				}
			}
		}
	}
	
	// 게시글 리스트 장르 처리
	public void getBListGnr(List<BoardVO> list) {
		List<GenreVO> glist = bDao.getGnr();
		
		for(BoardVO bVO : list) {
			if(bVO.getSgenre().equals("empty")) continue;
			
			for(GenreVO gVO : glist) {
				for(int gno : bVO.getGnos()) {
					if(gno == gVO.getGno()) {
						bVO.getGenre().add(gVO.getGname());
					}
				}
			}
			
			// 유료글이면 body 변경
			if(bVO.getPrice() != 0) bVO.setBody("유료 게시글입니다.");
		}
	}
	
	// 게시글 상세보기 상세 처리
	public void setBDetail(ModelAndView mv, BoardVO bVO) {
		// 유료 게시글 구매 여부
		
		// 미구매시 미리보기 처리
		
		// 장르 처리
		
	}
}
