package com.githrd.boa.controller.c;
/**
 * 	컬렉션 관련 요청 처리를 할 컨트롤러 클래스 입니다.
 * 
 * 	@author 최이지
 * 	@since 2022.06.16
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.16	-	클래스 제작
 * 								담당자 : 최이지
 * 
 *			2022.06.21	-	함수 추가(collecList)
 *								담당자 : 최이지
 *
 *			2022.06.22	-	함수 추가(collecDel)
 *								담당자 : 최이지
 *
 *			2022.06.26	-	함수 추가(collecWrite, collecWriteProc, collecEdit, collecEditProc)
 *								담당자 : 최이지
 *
 *			2022.06.29	-	로그처리를 위한 함수 수정(collecWriteProc, collecEditProc, collecDel)
 *								담당자 : 최이지
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.boa.dao.c.CollectionDao;
import com.githrd.boa.service.c.CollectionService;
import com.githrd.boa.util.c.PageUtil;
import com.githrd.boa.vo.c.*;
@Controller
@RequestMapping("/collection")
public class Collection {

	@Autowired
	CollectionDao cDao;
	
	@Autowired
	CollectionService cSrvc;
	
// 폼 보기 -------------------------------------------------------------------------------------

	@RequestMapping("/collecList.boa")
	public ModelAndView collecList(ModelAndView mv, CollecVO cVO, PageUtil page, String msg) {
		// 페이지 처리
		int totalCount = cDao.getTotal(cVO);
		int nowPage = 1;
		if(page.getNowPage() != 0) nowPage = page.getNowPage();
		page.setPage(nowPage, totalCount);
		
		// db 작업, list 불러오기
		cVO.setPage(page);
		List<CollecVO> list = cSrvc.getCollList(cVO);
		
		// 데이터 세팅
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		if(cVO.getCid() != null) mv.addObject("CID", cVO.getCid());
		if(msg != null) mv.addObject("MSG", msg);
		mv.setViewName("c/collection/collecList");
		
		return mv;
	}
	
	@RequestMapping("/collecWrite.boa")
	public ModelAndView collecWrite(ModelAndView mv) {
		// 장르 목록 가져오기
		List<GenreVO> glist = cDao.getGnr();
		
		// 데이터 심기
		mv.addObject("GLIST", glist);
		mv.setViewName("c/collection/collecWrite");
		return mv;
	}
	
	@RequestMapping("/collecEdit.boa")
	public ModelAndView collecEdit(ModelAndView mv, CollecVO cVO) {
		// 정보 가져오기
		int cno = cVO.getCno();
		cVO = cDao.getCInfo(cno);				// 컬렉션 정보
		List<FileVO> his = cDao.getCHis(cno);	// 컬렉션 파일 히스토리
		List<GenreVO> glist = cDao.getGnr();	// 장르 정보
		
		// 데이터 심기
		mv.addObject("GLIST", glist);
		mv.addObject("HISTORY", his);
		mv.addObject("CINFO", cVO);
		mv.setViewName("c/collection/collecEdit");
		return mv;
	}
	
// 요청 처리 -----------------------------------------------------------------------------------
	
	@RequestMapping("/collecDel.boa")
	public ModelAndView collecDel(ModelAndView mv, CollecVO cVO, PageUtil page) {
		// db 작업
		int cnt = cDao.delColl(cVO);
		
		// 결과에 따른 처리
		String msg;
		if(cnt == 1) {// 성공
			msg = "컬렉션 삭제 성공";
			cVO.setResult("YES");
		}else {
			msg = "컬렉션 삭제 실패";
			cVO.setResult("NO");
		}
		
		// 데이터 세팅
		mv.addObject("VIEW", "/boa/collection/collecList.boa");
		mv.addObject("MSG", msg);
		if(cVO.getCid() != null) mv.addObject("CID", cVO.getCid());
		mv.setViewName("c/collection/redirect");
		
		return mv;
	}
	
	@RequestMapping("/collecWriteProc.boa")
	public ModelAndView collecWriteProc(ModelAndView mv, CollecVO cVO) {
		int cnt = cSrvc.addColl(cVO);
		
		// 결과에 따른 처리
		String msg;
		if(cnt != 0) {
			msg = "컬렉션 추가 성공";
			cVO.setResult("YES");
		}else {
			msg = "컬렉션 추가 실패";
			cVO.setResult("NO");
		}
		
		// 데이터 세팅
		mv.addObject("VIEW", "/boa/collection/collecList.boa");
		mv.addObject("MSG", msg);
		if(cVO.getCid() != null) mv.addObject("CID", cVO.getCid());
		mv.setViewName("c/collection/redirect");
		return mv;
	}
	
	@RequestMapping("/collecEditProc.boa")
	public ModelAndView collecEditProc(ModelAndView mv, CollecVO cVO) {
		int cnt = cSrvc.editColl(cVO);
		
		// 결과에 따른 처리
		String msg;
		if(cnt != 0) {
			msg = "컬렉션 수정 성공";
			cVO.setResult("YES");
		}else {
			msg = "컬렉션 수정 실패";
			cVO.setResult("NO");
		}
		
		// 데이터 세팅
		mv.addObject("VIEW", "/boa/collection/collecList.boa");
		mv.addObject("MSG", msg);
		if(cVO.getCid() != null) mv.addObject("CID", cVO.getCid());
		mv.setViewName("c/collection/redirect");
		return mv;
	}
}
