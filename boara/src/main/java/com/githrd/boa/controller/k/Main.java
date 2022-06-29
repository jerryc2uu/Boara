package com.githrd.boa.controller.k;
 
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.boa.dao.k.MainBoardDao;
import com.githrd.boa.vo.k.FileVO;
/**
 * 이 클래스는 메인 게시판 관련 요청을 처리할 클래스
 * @author	김소연
 * @since	2022.06.12
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.06.12	-	담당자 : 김소연
 * 									클래스 제작, 
 * 									메인화면 보기 요청 처리
 * 				2022.06.29 - 		top 게시글 조회(일주일)
 *
 */

@Controller
public class Main {
	@Autowired
	MainBoardDao mbDao;
	
	@RequestMapping({"/", "/main.boa"})
	public ModelAndView getMain(ModelAndView mv, HttpSession session, FileVO fVO) {
		List<FileVO> list = mbDao.gettopBoard();
		
		mv.addObject("LIST", list);
		mv.setViewName("main");
		return mv;
	}
}
