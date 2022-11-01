package com.sample.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.FindService;
import com.sample.service.GlistService;
import com.sample.service.LoginService;
import com.sample.service.RentalService;
import com.sample.service.UinService;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	private LoginService loginService;
	private UinService uinService;
	private FindService findService;
	private RentalService rentalService;
	private GlistService glistService;

	public MyPageController(LoginService loginService, UinService uinService, FindService findService,
			RentalService rentalService, GlistService glistService) {
		super();
		this.loginService = loginService;
		this.uinService = uinService;
		this.findService = findService;
		this.rentalService = rentalService;
		this.glistService = glistService;
	}

	@GetMapping("myPage")
	public String move(UserVO userVO, UinVO uinVO, HttpSession session, Model model) {
		userVO = (UserVO) session.getAttribute("sessionVO");
//		int userCode = userVO.getUserCode();
//		System.out.println("useCode ::: " + userCode);
		uinVO = uinService.getUserAbil(userVO.getUserCode());
//		System.out.println("level : " + uinVO.getUserLevel());
//		System.out.println("controller : " + uinService.getUserAbil(userCode).getUserGroup());
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
	public String changePwResult(UserVO userVO, HttpSession session, @RequestParam("pw1") String pw,
			@RequestParam("new_pw1") String pw1, Model model) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		System.out.println("pwpwpw : " + userVO.getUserPw());
//		System.out.println("pwpwpwpw : " + pw1);
//		if (userVO.getUserPw().equals(pw)) {
		userVO.setUserPw(pw1);
		findService.setPassword(userVO);
		return "redirect:/myPage/myPage";
//		} else {
//			return "redirect:/myPage/changePw";
//		}
	}

	// 현재비밀번호 비교
	@PostMapping("/changePw/isPassword")
	@ResponseBody
	public Map<String, String> isPassword(String pass1, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("sessionVO");

		System.out.println("upw : " + pass1);
		Map<String, String> map = new HashMap<>();

		if (uvo.getUserPw().equals(pass1)) {
			map.put("state", "ok");

		} else {
			map.put("state", "no");
		}
		return map;
	}

	// 경기내역
	@GetMapping("/matchList")
	public String matchList() {

		return "/myPage/matchList";
	}

	@GetMapping("/getMatchList")
	@ResponseBody
	public Map<String, Object> getMatchList(UserVO userVO, HttpSession session) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		Map<String, Object> map = new HashMap<>();
		List<FieldReservationVO> list = glistService.getMatchList(userVO.getUserCode());
		map.put("userName", userVO.getUserName());
		map.put("list", list);
		return map;
	}

	// 구장예약 내역
	@GetMapping("/rentalList")
	public String rentalList(UserVO userVO, HttpSession session, Model model) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		model.addAttribute("userVO", userVO);
		return "/myPage/rentalList";
	}

	@GetMapping("/getRentalList")
	@ResponseBody
	public Map<String, Object> getRentalList(UserVO userVO, HttpSession session, Model model) {
		userVO = (UserVO) session.getAttribute("sessionVO");
		System.out.println("구장예약자 이름 : " + userVO.getUserName() + userVO.getUserCode());
		int userCode = userVO.getUserCode();
		Map<String, Object> map = new HashMap<>();
		List<FieldReservationVO> list = rentalService.getFieldReservationVO(userCode);
		map.put("userName", userVO.getUserName());
		map.put("list", list);
		return map;
	}

	@GetMapping("/guide1")
	public String guide1() {

		return "/myPage/guide1";
	}
}
