package com.sample.service;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.UserDAO;
import com.sample.vo.UserVO;

@Service
public class LoginService {
	
	UserDAO dao;
	
	public LoginService(UserDAO dao) {
		super();
		this.dao = dao;
	}

	public boolean isUser(UserVO vo, HttpSession session) {
		UserVO uvo = dao.idPwCheck(vo);
		if(uvo != null) {
			session.setAttribute("sessionVO", uvo);
			session.setMaxInactiveInterval(999999);
			return true;
		}else {
			return false;
		}
	}
	
	public void setUserInfo(UserVO vo) {
		String userId = dao.userId(vo.getUserId());
		
		if(vo.getUserId().equals(userId)) {
			System.out.println("이미 존재하는 아이디 입니다."); 

		}else {
			vo.setUserBirth(vo.getUserBirthYear()+vo.getUserBirthMonth()+vo.getUserBirthDay());
			dao.insertUser(vo);
			dao.insertGameStat(vo);
			System.out.println("가입에 성공하셨습니다!");
		}
	}
	
	public void getUserIdList(Model model) {
		
		model.addAttribute("userIdList",dao.userIdList());
	}
	
//	public String isGameNum(HttpSession session, UserVO vo) {
//
//	}
	
	public String rememId(String id_ck,String pageurl,UserVO vo,
							HttpSession session,HttpServletRequest request,
							HttpServletResponse response) {

		String url = null;
		
		if(id_ck == null) {
			id_ck = "n";
		}

		if(pageurl == null) {
			pageurl = "redirect:/home";
		}
		
		session = request.getSession();
		if(isUser(vo, session)) {
			url = pageurl;
			
			if(id_ck.equals("checked")) {
				Cookie cookie1 = new Cookie("userId", vo.getUserId());
				Cookie cookie2 = new Cookie("id_ck", id_ck);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				session.setAttribute("id_ck", id_ck);
			} else if (id_ck == "n"){
				Cookie cookie1 = new Cookie("userId",vo.getUserId());
				Cookie cookie2 = new Cookie("id_ck", id_ck);
				cookie1.setMaxAge(0);
				cookie2.setMaxAge(0);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				session.setAttribute("id_ck", id_ck);
			}

		}else {
			request.setAttribute("page", "login");
			url = "redirect:/loginPage/login?pageurl="+pageurl;
			
		}
		
		return url;
	}

	
}
