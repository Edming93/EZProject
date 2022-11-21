package com.goodee.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.sample.vo.UserVO;

public class paymentInterceptor implements HandlerInterceptor {
@Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
	
		HttpSession session = request.getSession();
	
		if (session.getAttribute("sessionVO") == null) {
			response.sendRedirect(request.getContextPath() + "/loginPage/login");
			return true;
	
		} else {
			response.sendRedirect(request.getContextPath() + "/rental/rentalPayment");
			return false;
		}
	}

}





