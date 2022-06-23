package com.githrd.boa.controller.c;
/**
 * 	게시글 관련 요청 처리를 할 컨트롤러 클래스 입니다.
 * 
 * 	@author 최이지
 * 	@since 2022.06.22
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.22	-	클래스 제작
 * 								담당자 : 최이지
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.boa.dao.c.BoardDao;
import com.githrd.boa.service.c.BoardService;
import com.githrd.boa.util.c.PageUtil;
import com.githrd.boa.vo.c.*;

@Controller
@RequestMapping("/board")
public class Board {

	@Autowired
	BoardDao bDao;
	
	@Autowired
	BoardService bSrvc;
	
// 폼 보기 ------------------------------------------------------------------------------------

	@RequestMapping("/boardList.boa")
	public ModelAndView boardList(ModelAndView mv, CollecVO cVO, PageUtil page, String msg) {
		// 컬렉션 정보 세팅
		cVO = bDao.getCInfo(cVO);
		bSrvc.getCGnr(cVO);
		
		// 페이지 처리
		int totalCount = bDao.getTotal(cVO);
		int nowPage = 1;
		if(page.getNowPage() != 0) nowPage = page.getNowPage();
		page.setPage(nowPage, totalCount);
		
		// db 작업, list 불러오기
		cVO.setPage(page);
		List<BoardVO> list = bDao.getBList(cVO);
		bSrvc.getBListGnr(list);
		
		// 데이터 세팅
		mv.addObject("PLIST", list);
		mv.addObject("CINFO", cVO);
		mv.addObject("PAGE", page);
		if(msg != null) mv.addObject("MSG", msg);
		mv.setViewName("c/board/boardList");
		return mv;
	}
	
	// 게시글 상세 보기
	@RequestMapping("/boardDetail.boa")
	public ModelAndView boardDetail(ModelAndView mv, BoardVO bVO, CollecVO cVO, PageUtil page) {
		// 상세 정보 불러오기
		
		
		mv.setViewName("c/board/boardDetail");
		return mv;
	}
// 처리 요청 ----------------------------------------------------------------------------------
	
	@RequestMapping("/boardDel.boa")
	public ModelAndView boardDel(ModelAndView mv, CollecVO cVO, PageUtil page, BoardVO bVO) {
		// db 작업
		int cnt = bDao.delBoard(bVO);
		
		// 결과에 따른 처리
		String msg;
		if(cnt == 1) {// 성공
			msg = "게시글 삭제 성공";
		}else {
			msg = "게시글 삭제 실패";
		}
		
		// 데이터 세팅
		mv.addObject("VIEW", "/boa/board/boardList.boa");
		mv.addObject("MSG", msg);
		mv.addObject("CNO", cVO.getCno());
		mv.setViewName("c/board/redirect");
		
		return mv;
	}
}