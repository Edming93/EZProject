package com.sample.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.RankService;
import com.sample.service.TeamService;
import com.sample.vo.DataVO;
import com.sample.vo.GlistVO;
import com.sample.vo.MatchRegVO;
import com.sample.vo.SearchVO;
import com.sample.vo.TeamMemberVO;
import com.sample.vo.TlistVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/rank")
public class RankController {
	
	private RankService service;
	
	public RankController(RankService service) {
		super();
		this.service = service;
	}
	
	@GetMapping("/rank")
	public String rank(Model model) {
		model.addAttribute("rank", service.rank());
		
		return "rank/rankMain";
	}
	

}
