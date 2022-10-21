package com.sample.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.EmailService;
import com.sample.service.LoginService;
import com.sample.service.MailSendService;
import com.sample.vo.EmailVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/loginPage")
public class LoginController {
	
	private LoginService service;
	//private EmailService mailService;
	private MailSendService mailService;
	
	public LoginController(LoginService service, MailSendService mailService) {
		super();
		this.service = service;
		this.mailService = mailService;
	}


	@GetMapping("/login")
	public String getLogin(UserVO vo, HttpSession session) {
		if(service.isUser(vo, session)) {
		}
		return "loginPage/login";
	}
	
	@PostMapping("/login")
	public String postLogin(UserVO vo, HttpSession session) {
		System.out.println(service.isUser(vo,session));
		return (service.isUser(vo,session))? "redirect:/home":"loginPage/login";
	}
	
	@GetMapping("/logout")
	public String getLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
	
	
	@GetMapping("/signUp")
	public String getSignUp(UserVO vo,Model model) {
		service.getUserIdList(model);
		return "loginPage/signUp";
	}
	
	@PostMapping("/signUp")
	public String insertUser(UserVO vo) {
		vo.setUserAddress(vo.getUserAddress1()+" "+vo.getUserAddress2());
		service.setUserInfo(vo);
		return "redirect:/loginPage/login";
	}
	
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(@RequestParam("email") String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}
	
	
}
