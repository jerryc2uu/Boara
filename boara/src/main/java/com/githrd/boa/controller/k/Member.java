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
import com.githrd.boa.service.k.MemberService;
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
 * 				2022.06.16	-		id/pw 찾기 
 * 				2022.06.18  -		탈퇴 페이지	처리
 * 				2022.06.21 	-		탈퇴처리
 * 				2022.06.23 	-		회원가입
 *  *
 */

@Controller
@RequestMapping("/member")
public class Member {
	@Autowired
	MemberDao mDao;
	@Autowired
	MemberService mSrvc;
	
	@RequestMapping("/login.boa")
	public ModelAndView loginForm(ModelAndView mv, HttpSession session) {
		mv.setViewName("k/login");
		return mv;
	}
	
	// 다른게시판에서 로그인 폼보기를 요청할때 처리함수
	@RequestMapping(path="/login.boa", params={"vw", "nowPage"})
	public ModelAndView loginForm(ModelAndView mv, HttpSession session, String vw, String nowPage) {
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
	
	// 다른게시판에서 로그인 처리를 요청할때 처리함수
	@RequestMapping(path="/loginProc.boa", method=RequestMethod.POST, params= {"id", "pw", "vw", "nowPage"})
	public ModelAndView loginProc(MemberVO mVO, HttpSession session, ModelAndView mv, RedirectView rv, String vw, String nowPage) {
		
		int cnt = mDao.getLogin(mVO);
		String view = vw;
		if(cnt == 1) {
			session.setAttribute("SID", mVO.getId());
		} else {
			view = "/boa/member/login.boa";
		}
		mv.addObject("VIEW", view);
		mv.addObject("NOWPAGE", nowPage);
		mv.setViewName("k/redirect");
			return mv;
	}
	
	@RequestMapping("/logout.boa")
	public ModelAndView logout(ModelAndView mv, HttpSession session, RedirectView rv, String vw, String nowPage) {
		session.removeAttribute("SID");
		if(vw == null) {
			vw = "/boa/";
		}
		if(nowPage != null) {
			mv.addObject("NOWPAGE", nowPage);
		}
		mv.addObject("VIEW", vw);
		mv.setViewName("k/redirect");
		
		return mv;
	}
	
	@RequestMapping("/join.boa")
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("k/join");
		return mv;
	}
	
	@RequestMapping("/joinProc.boa")
	public ModelAndView joinProc(ModelAndView mv,HttpSession session, MemberVO mVO, String vw, String nowPage) {
		String view = "/boa/main.boa";
		try {
			mSrvc.addMemberData(mVO);
			if(vw != null) {
				view = vw;
			}
			if(nowPage != null) {
				mv.addObject("NOWPAGE", nowPage);
			}
			session.setAttribute("SID", mVO.getId());
		} catch(Exception e) {
			view = "/boa/member/join.boa";
			e.printStackTrace();
		}
		mv.addObject("VIEW", view);
		mv.setViewName("k/redirect");
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
	public Map<String, String> mailCheck(String mail) {
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
	
	// idPw 찾기 
	@RequestMapping("/idpwSearch.boa")
	public ModelAndView idpwSearch(ModelAndView mv) {
		mv.setViewName("k/idpwSearch");

		return mv;
	}
	
	// id 찾기 
	@RequestMapping(path="/idSearchProc.boa", 
			method=RequestMethod.POST, params= {"name", "tel"})
	@ResponseBody
	public Map<String, String> idSearch(MemberVO mVO) {
	HashMap<String, String> map = new HashMap<String, String>();
	String result = "NO";
	
	String sid = mDao.getSearchId(mVO);
		if(sid != null) {
			result= "OK";
		}
		map.put("result", result);
		map.put("id", sid);
	
		return map;
	}
	
	// pw 찾기 
	@RequestMapping(path="/pwSearchProc.boa", 
			method=RequestMethod.POST, params= {"id", "mail"})
	@ResponseBody
	public Map<String, String> pwSearch(MemberVO mVO) {
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		String spw = mDao.getSearchPw(mVO);
		if(spw != null) {
			result= "OK";
		}
		map.put("result", result);
		map.put("pw", spw);
		
		return map;
	}
	
	
	
	// 회원정보 수정 페이지(사진 불러오기 미구현)
	@RequestMapping("/editInfo.boa")
	public ModelAndView editinfo(ModelAndView mv, HttpSession session,RedirectView rv) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/boa/member/login.boa");
			mv.setView(rv);
			return mv;
		}
		

		
		MemberVO mVO = mDao.getIfInfo(sid);
		mv.addObject("DATA", mVO);
		
		mv.setViewName("k/editInfo");
		return mv;
	}
	
	
	// 탈퇴 
	
	@RequestMapping("/delMember.boa")
	public ModelAndView delMember(ModelAndView mv, HttpSession session,RedirectView rv) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/boa/member/login.boa");
			mv.setView(rv);
			return mv;
		}
		mv.setViewName("k/delMember");
		return mv;
		
	}
	
	@RequestMapping(path="/delMemberProc.boa", params= {"pw", "id"})
	public ModelAndView delProc(ModelAndView mv,  RedirectView rv, HttpSession session, MemberVO mVO) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/boa/member/login.boa");
			mv.setView(rv);
			return mv;
		}
		
		int cnt = mDao.getDelMember(mVO);
		if(cnt == 1) {
			// 세션에 기억한 데이터 삭제
			session.removeAttribute("SID");
			rv.setUrl("/boa/main.boa");	
		} else {
			rv.setUrl("/boa/member/delMember.boa");	
		}
		mv.setView(rv);
		return mv;
	}
}