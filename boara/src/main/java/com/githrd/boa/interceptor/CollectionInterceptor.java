package com.githrd.boa.interceptor;
/**
 * 	컬렉션/게시글 관련 요청처리시 cno가 넘어오지 않았을 경우
 * 	페이지를 컬렉션 리스트로 redirect 시키는 interceptor 클래스입니다.
 * 
 * 	@author 최이지
 * 	@since 2022.06.26
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.26	-	클래스 제작
 * 								담당자 : 최이지
 */

import javax.servlet.http.*;

import org.springframework.web.servlet.*;

public class CollectionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getParameter("cno") == null) {
			response.sendRedirect("/boa/collection/collecList.boa");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
