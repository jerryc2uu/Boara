package com.githrd.boa.interceptor;
/**
 * 	로그인이 안 된 경우

 * 	로그인 페이지로 redirect 시키는 interceptor 클래스입니다.
 * 
 * 	@author 박소연
 * 	@since 2022.06.24
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.24	-	클래스 제작
 * 								담당자 : 박소연
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginRedirectInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler)
			throws Exception {
		if(req.getSession().getAttribute("SID") == null) {
			resp.sendRedirect("/boa/member/login.boa");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
