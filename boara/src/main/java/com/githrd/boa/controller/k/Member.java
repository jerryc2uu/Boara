package com.githrd.boa.controller.k;
 
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.githrd.boa.dao.k.MemberDao;
import com.githrd.boa.vo.k.MemberVO;
/**
 * 이 클래스는 member 관련 요청을 처리할 클래스
 * @author	김소연
 * @since	2022.06.13
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.06.13	-	담당자 : 김소연
 * 									클래스 제작, 
 * 									로그인 화면보기 , 로그인 요청 처리, 로그아웃
 *  *
 */

@Controller
@RequestMapping("/member")
public class Member {
	@Autowired
	MemberDao mDao;
	
	@RequestMapping("/login.boa")
	public ModelAndView loginForm(ModelAndView mv, HttpSession session) {
		mv.setViewName("k/login");
		return mv;
	}
	
	@RequestMapping(path="/loginProc.boa", method=RequestMethod.POST, params= {"id", "pw"})
	public ModelAndView loginProc(MemberVO mVO, HttpSession session, ModelAndView mv, RedirectView rv) {
		
		int cnt = mDao.getLogin(mVO);
		if(cnt == 1) {
			session.setAttribute("SID", mVO.getId());
			rv.setUrl("/boa/main.boa");
		} else {
			rv.setUrl("/boa/member/login.boa");
		}
			mv.setView(rv);
			return mv;
	
	}
	@RequestMapping("/logout.boa")
	public ModelAndView logout(ModelAndView mv, HttpSession session, RedirectView rv) {
		session.removeAttribute("SID");
		rv.setUrl("/boa/main.boa");
		mv.setView(rv);
		
		return mv;
	}
	
}