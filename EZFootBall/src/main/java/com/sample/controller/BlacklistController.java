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
	
	@GetMapping("/bbs/set")
	public String setBBS(@SessionAttribute("sessionVO")UserVO uvo, 
			@ModelAttribute("bbsVO")BlacklistVO bvo, Model model) {
		System.out.println(uvo);
		if(uvo != null ) {
			String[] cateList = {"공지","잡담","공유","비밀","	알림","고민"};
			model.addAttribute("cateList", cateList);
			return "bbs4/set";
		}else {
			return "redirect:/bbs4/login";
		}
	}
	
	@PostMapping("/bbs/set")
	public String setBBSResult(@SessionAttribute("sessionVO")UserVO uvo, BlacklistVO bvo) {
		if(uvo != null ) {
			bvo.setUserName(uvo.getUserName());
			if(service.setBlackList(bvo)) {
				return "redirect:/bbs4/bbs";
			}else{
				return "bbs4/set";
			}
		}else {
			return "redirect:/bbs4/login";			
		}
	}
	
	
	
	
}
