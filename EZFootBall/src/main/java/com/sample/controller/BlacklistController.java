package com.sample.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sample.service.BlacklistService;
import com.sample.vo.BlacklistVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/blacklist")
public class BlacklistController {

	private BlacklistService service;

	public BlacklistController(BlacklistService service) {
		super();
		this.service = service;
	}

	// 페이지 이동
	@GetMapping("/blacklistmain")
	public String move(HttpSession session, Model model) {

		service.getBlackList(model);
		return "/blacklist/blacklistmain";
	}

	// 상세 페이지 이동
	@GetMapping("/blacklistmain/{blacklistCode}")
	public String getBlacklistItem(HttpSession session, Model model,
			@PathVariable("blacklistCode") String blacklistCode) {
		UserVO vo = (UserVO) session.getAttribute("sessionVO");
		model.addAttribute("userdata", vo);
		service.getBlackListContent(model, blacklistCode);
		return "blacklist/detailpage";
	}

	@GetMapping("/blacklistmain/setbbs")
	public String setBBS(@SessionAttribute("sessionVO") UserVO uvo, @ModelAttribute("BlacklistVO") BlacklistVO bvo,
			Model model) {
		System.out.println(uvo);
		if (uvo != null) {
			String[] cateList = { "서울", "인천", "경기도", "강원도", "경상도", "전라도", "충청도", "제주도" };
			model.addAttribute("blacklistLocal", cateList);
			return "blacklist/setbbs";
		}

		else {
			return "redirect:/loginPage/login";
		}

	}

	@PostMapping("/blacklistmain/setbbs")
	public String setBBSResult(@SessionAttribute("sessionVO") UserVO uvo, BlacklistVO bvo) {
		System.out.println(uvo);
		
		if (uvo != null) {
			System.out.println(uvo.getUserCode());
			bvo.setUserId(uvo.getUserId());
			bvo.setUserName(uvo.getUserName());
			bvo.setUserCode(uvo.getUserCode());
			if (service.setBlackList(bvo)) {
				return "redirect:/blacklist/blacklistmain";
			} else {
				return "blacklist/setbbs";
			}
		} else {
			return "redirect:/loginPage/login";
		}
	}
	
	

}
