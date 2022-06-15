package com.githrd.boa.controller.k;
 
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
 * 				2022.06.15 	-		회원가입 화면보기, id, mail, pw 체크 
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
	
	@RequestMapping("/join.boa")
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("k/join");
		return mv;
	}
	// 회원가입정보 중복 체크
	@RequestMapping(path="/idCheck.boa", 
			method=RequestMethod.POST, params="id")
	@ResponseBody
	public Map<String, String> idCheck(String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		int cnt = mDao.getIdCnt(id);
		
		if(cnt == 0) {
			result = "OK";
		}
		
		map.put("result", result);
		return map;
		}
	@RequestMapping(path="/mailCheck.boa", 
			method=RequestMethod.POST, params="mail")
	
	@ResponseBody
	public Map<String, String> mail(String mail) {
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		int cnt = mDao.getIdCnt(mail);
		
		if(cnt == 0) {
			result = "OK";
		}
		
		map.put("result", result);
		return map;
		}
	
	@RequestMapping(path="/telCheck.boa", 
			method=RequestMethod.POST, params="tel")
	@ResponseBody
	public Map<String, String> telCheck(String tel) {
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		int cnt = mDao.getIdCnt(tel);
		
		if(cnt == 0) {
			result = "OK";
		}
		
		map.put("result", result);
		return map;
		}
}