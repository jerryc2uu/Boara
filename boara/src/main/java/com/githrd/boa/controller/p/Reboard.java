package com.githrd.boa.controller.p;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.boa.dao.p.ReboardDao;
import com.githrd.boa.util.p.PageUtil;
import com.githrd.boa.vo.p.ReboardVO;

/**
 * 이 클래스는 댓글 게시판 관련 요청을 처리할 클래스
 * 
 * @author 박소연
 * @since 2022.06.12
 * @version v.1.0
 * 
 * 		작업 이력 ]
 * 			2022.06.12 - 담당자 : 박소연
 * 							클래스 제작,
 *  						리스트 보기 요청 처리
 */
@Controller
@RequestMapping("/reboard")
public class Reboard {
	
	@Autowired
	ReboardDao rDao;
	
	//댓글 리스트 보기 요청
	@RequestMapping("/reboardList.boa")
	public ModelAndView reboardList(ModelAndView mv, ReboardVO rVO) {
		
		//페이징 처리
		int total = rDao.getTotal(rVO);
		int nowPage = rVO.getNowPage();
		
		PageUtil page = new PageUtil(nowPage, total);
		
		rVO.setStartCont(page.getStartCont());
		rVO.setEndCont(page.getEndCont());
		
		
		//댓글 리스트 조회
		List<ReboardVO> list = rDao.getList(rVO);
		
		
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		mv.setViewName("p/reboardList");
		return mv;
	}
}
