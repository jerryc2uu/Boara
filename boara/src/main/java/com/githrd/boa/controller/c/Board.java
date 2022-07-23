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
 * 
 * 			2022.06.26	-	함수 추가(boardWrite, boardWriteProc, boardEdit, boaradEditProc)
 * 								담당자 : 최이지
 * 
 * 			2022.06.29	-	함수 추가(likeProc, jjimProc, discardMark)
 * 							로그 처리를 위한 함수 수정(boardWriteProc, boardEditProc, boardDel)
 * 								담당자 : 최이지
 * 
 */

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
		String id = cVO.getId();
		cVO = bDao.getCInfo(cVO);
		bSrvc.getCGnr(cVO);
		
		// 본인 컬렉션인지 파악
		int totalCount;
		if(id == null || !id.equals(cVO.getId())) {
			totalCount  = bDao.getTotal(cVO);
		}else {
			totalCount = bDao.getSelfTotal(cVO);
		}
		
		// 페이지 처리
		int nowPage = 1;
		if(page.getNowPage() != 0) nowPage = page.getNowPage();
		page.setPage(nowPage, totalCount);
		
		// db 작업, list 불러오기
		cVO.setPage(page);
		List<BoardVO> list;
		if(id == null || !id.equals(cVO.getId())) {
			list = bDao.getBList(cVO);
		}else {
			list = bDao.getSelfBList(cVO);
		}
		
		bSrvc.getBListGnr(list);
		
		// 데이터 세팅
		mv.addObject("PLIST", list);
		mv.addObject("CINFO", cVO);
		mv.addObject("PAGE", page);
		if(msg != null) mv.addObject("MSG", msg);
		mv.setViewName("c/board/boardList");
		return mv;
	}
	
	@RequestMapping("/boardWrite.boa")
	public ModelAndView boardWrite(ModelAndView mv, String id) {
		// 기초 데이터 가져오기
		List<CollecVO> clist = bDao.getCList(id);	// 컬렉션 리스트
		List<GenreVO> glist = bDao.getGnr();		// 장르 리스트
		
		// 데이터 세팅
		mv.addObject("CLIST", clist);
		mv.addObject("GLIST", glist);
		mv.setViewName("c/board/boardWrite");
		return mv;
	}
	
	@RequestMapping("/boardEdit.boa")
	public ModelAndView boardEdit(ModelAndView mv, BoardVO bVO) {
		// 기초 데이터 가져오기
		bVO = bDao.getBInfo(bVO.getBno());
		List<FileVO> his = bDao.getBHis(bVO);
		List<GenreVO> glist = bDao.getGnr();	// 장르 리스트
		
		// 데이터 세팅
		mv.addObject("GLIST", glist);
		mv.addObject("BINFO", bVO);
		mv.addObject("HISTORY", his);
		mv.setViewName("c/board/boardEdit");
		return mv;
	}
	
	// 게시글 상세 보기
	@RequestMapping("/boardDetail.boa")
	public ModelAndView boardDetail(ModelAndView mv, BoardVO bVO, HttpServletRequest req, String nowPage) {
		// 상세 정보 불러오기
		bVO = bSrvc.setBDetail(bVO);
		if(nowPage == null) nowPage = "1";

		mv.addObject("POST", bVO);
		mv.setViewName("c/board/boardDetail");
		req.setAttribute("POST", bVO);
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
			bVO.setResult("YES");
		}else {
			msg = "게시글 삭제 실패";
			bVO.setResult("NO");
		}
		
		// 데이터 세팅
		mv.addObject("VIEW", "/boa/board/boardList.boa");
		mv.addObject("MSG", msg);
		mv.addObject("CNO", cVO.getCno());
		mv.setViewName("c/board/redirect");
		
		return mv;
	}
	
	@RequestMapping("/boardWriteProc.boa")
	public ModelAndView boardWriteProc(ModelAndView mv, BoardVO bVO) {
		// db 작업
		int cnt = bSrvc.addBoard(bVO);
		
		// 결과에 따른 처리
		String msg;
		if(cnt != 0) {
			msg = "게시글 작성 성공";
			bVO.setResult("YES");
		}else {
			msg = "게시글 작성 실패";
			bVO.setResult("NO");
		}
		
		// 데이터 세팅
		mv.addObject("VIEW", "/boa/board/boardList.boa");
		mv.addObject("CNO", bVO.getCno());
		mv.addObject("MSG", msg);
		mv.setViewName("c/board/redirect");
		return mv;
	}
	
	@RequestMapping("/boardEditProc.boa")
	public ModelAndView boardEditProc(ModelAndView mv, BoardVO bVO, String nowPage) {
		// db 작업
		int cnt = bSrvc.editBoard(bVO);
		
		// 결과에 따른 처리
		String msg;
		if(cnt != 0) {
			msg = "게시글 수정 성공";
			bVO.setResult("YES");
		}else {
			msg = "게시글 수정 실패";
			bVO.setResult("NO");
		}
		
		// 데이터 세팅
		mv.addObject("VIEW", "/boa/board/boardList.boa");
		mv.addObject("CNO", bVO.getCno());
		mv.addObject("NOWPAGE", nowPage);
		mv.addObject("MSG", msg);
		mv.setViewName("c/board/redirect");
		
		return mv;
	}

	@RequestMapping("/likeProc.boa")
	@ResponseBody
	public HashMap<String, String> likeProc(ModelAndView mv, BoardVO bVO) {
		// 반환값 변수 초기화
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";

		// mark 여부 검사
		int marked = bDao.cntStat(bVO);
		int success;
		
		if(marked == 0) {
			success = bDao.newLike(bVO);
			if(success == 1) result = "YES";
		}else {
			success = bDao.reLike(bVO);
			if(success == 1) result = "YES";
		}
		bVO.setResult(result);
		
		map.put("result", result);
		return map;
	}
	
	@RequestMapping("/jjimProc.boa")
	@ResponseBody
	public HashMap<String, String> jjimProc(ModelAndView mv, BoardVO bVO) {
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		// mark 여부 검사
		int marked = bDao.cntStat(bVO);
		int success;
		
		if(marked == 0) {
			success = bDao.newJjim(bVO);
			if(success == 1) result = "YES";
		}else {
			success = bDao.reJjim(bVO);
			if(success == 1) result = "YES";
		}
		bVO.setResult(result);
		
		map.put("result", result);
		return map;
	}
	
	@RequestMapping("/discardMark.boa")
	@ResponseBody
	public HashMap<String, String> discardMark(BoardVO bVO) {
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		int success = bDao.discard(bVO);
		if(success == 1) result = "YES";
		bVO.setResult(result);
		
		map.put("result", result);
		return map;
	}
}
