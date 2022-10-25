package com.sample.service;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	


}
