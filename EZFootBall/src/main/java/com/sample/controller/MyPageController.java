package com.sample.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.service.LoginService;
import com.sample.service.UinService;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	private LoginService loginService;
	private UinService uinService;

	public MyPageController(LoginService loginService, UinService uinService) {
		super();
		this.loginService = loginService;
		this.uinService = uinService;
	}

	@GetMapping("myPage")
	public String move(UserVO userVO, UinVO uinVO, HttpSession session, Model model) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		int userCode = userVO.getUserCode();
		System.out.println("useCode ::: " + userCode);
		uinVO = uinService.getUserAbil(userCode);
		System.out.println("level : " + uinVO.getUserLevel());
		System.out.println("controller : " + uinService.getUserAbil(userCode).getUserGroup());
		model.addAttribute("uinVO", uinVO);
		model.addAttribute("userVO", userVO);

		return "/myPage/myPage";
	}

	@GetMapping("/changePw")
	public String changePw(UserVO userVO, HttpSession session, Model model) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		model.addAttribute("userVO", userVO);
		return "/myPage/changePw";
	}

	@PostMapping("/changePw/result")
	public String changePwResult() {

		return "/myPage";
	}
}
