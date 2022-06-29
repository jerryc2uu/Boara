package com.githrd.boa.interceptor;
/**
 * 	성인 인증이 필요한 기능에 미인증 회원이 접근했을 경우
 * 	성인 인증이 가능한 마이페이지로 redirect 시키는 intercepter 클래스 입니다.
 * 
 * 	@author 최이지
 * 	@since 2022.06.29
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.29	-	클래스 제작
 * 								담당자 : 최이지
 *
 */

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.*;

import com.githrd.boa.dao.c.BoardDao;
import com.githrd.boa.vo.c.BoardVO;

public class AdultInterceptor implements HandlerInterceptor {

	@Autowired
	BoardDao bDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		BoardVO bVO = (BoardVO) request.getAttribute("POST");
		String id = (String) request.getSession().getAttribute("SID");
		
		// 성인 인증 게시글 접근 시도한 경우
		if(bVO != null) {
			if(bVO.getForwho().contentEquals("A")) {
				if(id == null) {
					response.sendRedirect("/boa/member/login.boa");
					return;
				}
				if(!bDao.adultCheck(id).contentEquals("Y")) {
					request.setAttribute("SID", id);
					request.setAttribute("VIEW", "/boa/member/myinfo.boa");
					request.setAttribute("MSG", "성인인증이 필요합니다.");
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/p/redirect.jsp");
					rd.forward(request, response);
					return;
				}
				
			}
		}
		
		// 일반 성인인증 체크
		if(id == null) {
			response.sendRedirect("/boa/member/login.boa");
			return;
		}
		if(!bDao.adultCheck(id).contentEquals("Y")) {
			request.setAttribute("SID", id);
			request.setAttribute("VIEW", "/boa/member/myinfo.boa");
			request.setAttribute("MSG", "성인인증이 필요합니다.");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/p/redirect.jsp");
			rd.forward(request, response);
			return;
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
