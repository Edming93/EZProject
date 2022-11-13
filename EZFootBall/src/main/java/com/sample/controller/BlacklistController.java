package com.sample.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sample.service.BlacklistService;
import com.sample.vo.BlacklistCommentVO;
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
		UserVO vo = (UserVO) session.getAttribute("sessionVO");
		model.addAttribute("userdata", vo);
		service.getBlackList(model);
		return "/blacklist/blacklistmain";
	}

	// 상세 페이지 이동
	@GetMapping("/blacklistmain/{blacklistCode}")
	public String getBlacklistItem(HttpSession session, Model model,
			@PathVariable("blacklistCode") String blacklistCode, BlacklistVO bvo) {
		System.out.println(blacklistCode);
		System.out.println(bvo.getBlacklistCode());
		UserVO vo = (UserVO) session.getAttribute("sessionVO");
		model.addAttribute("userdata", vo);
		
		service.getBlackListContent(model, blacklistCode);
		return "blacklist/detailpage";
	}

	// 페이지 입력
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

	// 페이지 상세
	@PostMapping("/blacklistmain/setbbs")
	public String setBBSResult(@SessionAttribute("sessionVO") UserVO uvo, BlacklistVO bvo) {
		System.out.println(uvo);

		if (uvo != null) {
			System.out.println(uvo.getUserCode());
			bvo.setUserId(uvo.getUserId());
			bvo.setBuserName(uvo.getUserName());
			bvo.setUserCode(uvo.getUserCode());
			service.adduserBlack(bvo);
			if (service.setBlackList(bvo)) {
				
				return "redirect:/blacklist/blacklistmain";
			} else {
				return "blacklist/setbbs";
			}
		} else {
			return "redirect:/loginPage/login";
		}
	}

	// 페이지 수정
	@GetMapping("/blacklistmain/editbbs/{blacklistCode}")
	public String editBBS(@SessionAttribute("sessionVO") UserVO uvo, Model model,
			@PathVariable("blacklistCode") String blacklistCode) {
		if (uvo != null) {
			service.getBlackListContent(model, blacklistCode);
			String[] cateList = { "서울", "인천", "경기도", "강원도", "경상도", "전라도", "충청도", "제주도" };
			model.addAttribute("blacklistLocal", cateList);
			return "blacklist/editbbs";
		} else {
			return "redirect:/loginPage/login";
		}
	}

	// 페이지 수정 로직
	@PostMapping("/blacklistmain/editbbs")
	public String editBBSResult(@SessionAttribute("sessionVO") UserVO uvo,
			@ModelAttribute("BlacklistVO") BlacklistVO bvo) {
		bvo.setUserId(uvo.getUserId());
		bvo.setBuserName(uvo.getUserName());
		bvo.setUserCode(uvo.getUserCode());

		System.out.println(bvo.getBlackuserCode());
		
		service.adduserBlack(bvo);
		if (service.editBlackList(bvo)) {
			return "redirect:/blacklist/blacklistmain";
		} else {
			return "redirect:/blacklist/editbbs/" + bvo.getBlacklistCode();
		}
	}

	// 페이지 삭제
	@GetMapping("/blacklistmain/deletebbs/{blacklistCode}")
	public String deleteBBSResult(@SessionAttribute("sessionVO") UserVO uvo, Model model,
			@ModelAttribute("BlacklistVO") BlacklistVO bvo, @PathVariable("blacklistCode") String blacklistCode) {
		
		bvo.setUserCode(uvo.getUserCode());
		bvo.getBlackuserCode();
		
		System.out.println(bvo.getBlackuserCode());
		
		service.deleteuserBlack(bvo);
		
		if (service.deleteBlackList(bvo)) {
		
			return "redirect:/blacklist/blacklistmain";
		} else {
			return "redirect:/blacklist/deletebbs/" + bvo.getBlacklistCode();
		}
	}

	// 댓글 view
	@GetMapping("/comment/{blackCode}")
	@ResponseBody
	public List<BlacklistCommentVO> getComments(@PathVariable("blackCode") int blackCode) {
		return service.getCommentList(blackCode);
	}

	// 댓글 작성
	// 커멘트를 저장
		@PostMapping("/comment")
		@ResponseBody
		public BlacklistCommentVO setComments(HttpSession session,@SessionAttribute("sessionVO") UserVO uvo, @RequestBody BlacklistCommentVO bvo) {
			
			bvo.setUserCode(uvo.getUserCode());
			bvo.setUserName(uvo.getUserName());
			
			return service.setBlacklistComment(bvo);

		}
		
		
		// 댓글 수정
		@PostMapping("/comment/edit")
		@ResponseBody
		public String editblacklistComment(HttpSession session,@SessionAttribute("sessionVO") UserVO uvo, @RequestBody BlacklistCommentVO vo
				,@ModelAttribute("BlacklistVO") BlacklistVO bvo){
			
			vo.setUserCode(uvo.getUserCode());
			vo.setUserName(uvo.getUserName());
			if (service.editBlackListComment(vo)) {
				return "redirect:/blacklist/blacklistmain";
			} else {
				return "redirect:/blacklist/blacklistmain/" + bvo.getBlacklistCode();
			}
			
		}

			
		  //댓글 삭제
		  @PostMapping("/comment/delete")
		  @ResponseBody
		  public BlacklistCommentVO deleteblacklistComment(@RequestBody BlacklistCommentVO vo){
		    return service.deleteBlackListComment(vo);
		  }
		
		
}
