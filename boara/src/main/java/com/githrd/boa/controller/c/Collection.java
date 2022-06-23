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
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.boa.dao.c.CollectionDao;
import com.githrd.boa.service.c.CollectionService;
import com.githrd.boa.util.c.PageUtil;
import com.githrd.boa.vo.c.CollecVO;
@Controller
@RequestMapping("/collection")
public class Collection {

	@Autowired
	CollectionDao cDao;
	
	@Autowired
	CollectionService cSrvc;
	
// 폼 보기 ----------------------------------------------------------

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
	
// 요청 처리 --------------------------------------------------------
	
	@RequestMapping("/collecDel.boa")
	public ModelAndView collecDel(ModelAndView mv, CollecVO cVO, PageUtil page) {
		// db 작업
		int cnt = cDao.delColl(cVO);
		
		// 결과에 따른 처리
		String msg;
		if(cnt == 1) {// 성공
			msg = "컬렉션 삭제 성공";
		}else {
			msg = "컬렉션 삭제 실패";
		}
		
		// 데이터 세팅
		mv.addObject("VIEW", "/boa/collection/collecList.boa");
		mv.addObject("MSG", msg);
		if(cVO.getCid() != null) mv.addObject("CID", cVO.getCid());
		mv.setViewName("c/collection/redirect");
		
		return mv;
	}
}