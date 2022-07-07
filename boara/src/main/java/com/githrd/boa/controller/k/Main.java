package com.githrd.boa.controller.k;
 
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.boa.dao.c.BoardDao;
import com.githrd.boa.dao.k.MainBoardDao;
import com.githrd.boa.util.k.PageUtil;
import com.githrd.boa.vo.k.FileVO;
import com.githrd.boa.vo.k.SearchVO;

/**
 * 메인 게시판 관련 요청을 처리할 controller클래스
 * @author	김소연
 * @since	2022.06.12
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.06.12	-	담당자 : 김소연
 * 									클래스 제작, 
 * 									메인화면 보기 요청 처리
 * 				2022.06.29  - 		top 게시글 조회(일주일)
 * 				2022.07.03	-		컬렉션 검색(reference collectList.jsp)
 *				2022.07.06	-		게시글 검색(reference boardList.jsp)
 */

@Controller
public class Main {
	@Autowired
	MainBoardDao mbDao;
	@Autowired
	BoardDao bDao;
	
	@RequestMapping({"/", "/main.boa"})
	public ModelAndView getMain(ModelAndView mv, HttpSession session, FileVO fVO) {
		List<FileVO> hList = mbDao.getHotBoard();
		List<FileVO> list = mbDao.getTopBoard();
		mv.addObject("HLIST", hList);
		mv.addObject("LIST", list);
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping("/search.boa")
	public ModelAndView serch(ModelAndView mv, String search, SearchVO sVO, PageUtil page, String sel) {
			
		String str = "col";
		int totalCount = mbDao.getTotal(sVO);
		page.setPage(totalCount);
		
		sVO.setStartCont(page.getStartCont());
		sVO.setEndCont(page.getEndCont());
		sVO.setSel(sel);
		sVO.setSearch(search);
		
		if(str.equals(sel)) {
			List<SearchVO> list = mbDao.getColList(sVO);
			mv.addObject("LIST", list);
		} else  {
			List<SearchVO> blist = mbDao.getBoList(sVO);
			bDao.upClick(sVO.getBno());
			mv.addObject("BLIST", blist);
		}
			 mv.addObject("PAGE", page);
			 mv.setViewName("k/search"); 
		
		return mv;
	
	}
}
 