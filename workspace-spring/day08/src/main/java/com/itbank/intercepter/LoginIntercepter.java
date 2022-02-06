package com.itbank.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.itbank.member.MemberDTO;

public class LoginIntercepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// request가 있기 때문에 쿠키를 꺼내서 처리할 수 있다 
		
		// Handle : 컨트롤러가 요청을 처리하는 작업
		// preHandle : 요청이 컨트롤러에 도달하기 전에 사전 작업하는 내용 / 사전처리하기 때문에 사용량이 많다
		
		
		HttpSession session = request.getSession();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		System.out.print("1) ");
		System.out.println(login != null ? "로그인 사용자" + login.getUserid() : "로그인 없음");

		if(login != null) {
			return true;
		}
//		response.getWriter().println("로그인 객체가 없어서 다른 처리를 해야 한빈다");  <- 인코딩깨짐
		response.sendRedirect(request.getContextPath()+ "/login");
		
		return false;		// 반환값에 따라서 기준 요청에 대한 처리를 그댈 진행하거나 		true
							// 혹은 진행을 중단하고 새로운 응답을 만들어서 보낸다			false
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// Controller에서 받아온 것
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 클라로 보내고  화면이 뜨기 직전  client <- afterCompletion <- response  
	}

	
}
