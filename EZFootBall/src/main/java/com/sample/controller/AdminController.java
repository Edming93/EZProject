package com.sample.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private AdminService service;
	
	public AdminController(AdminService service) {
		super();
		this.service = service;
	}
	
	//private GlistService service;
	//private LoginService lservice;
	//private TeamService tservice;
	
//	public AdminController(GlistService service,LoginService lservice,TeamService tservice) {
//		super();
//		this.service = service;
//		this.lservice = lservice;
//		this.tservice = tservice;
//	}
	
	@GetMapping("/admin")
	public String admin() {
		return "userInfo/aminMain";
	}
	
	@GetMapping("/select")
	public String mainselect (@RequestParam("select") String select,HttpSession session) {
		session.setAttribute("select", select);
		session.setAttribute("gamelist", service.allgame());
		session.setAttribute("userlist", service.alluser());
		return "userInfo/aminMain";
	}
	
	@GetMapping("/idselect")
	public String idselect (@RequestParam("idselect") String idselect,Model model) {
		model.addAttribute("idselect", idselect);
		return "userInfo/aminMain";
	}
	
	@GetMapping("/magselect")
	public String magselect (@RequestParam("magselect") String magselect,Model model) {
		model.addAttribute("magselect", magselect);
		return "userInfo/aminMain";
	}
	
	@GetMapping("/reserselect")
	public String reserselect (@RequestParam("reserselect") String reserselect,Model model) {
		model.addAttribute("reserselect", reserselect);
		return "userInfo/aminMain";
	}
	
	
	@GetMapping("/subselect")
	public String subselect (@RequestParam("subselect") String subselect,Model model,HttpSession session) {
		model.addAttribute("subselect", subselect);
		return "userInfo/aminMain";
	}
	
	@GetMapping("/fieldselect")
	public String fieldselect (@RequestParam("fieldselect") String fieldselect,Model model) {
		model.addAttribute("fieldselect", fieldselect);
		return "userInfo/aminMain";
	}
	
	@GetMapping("/comuselect")
	public String comuselect (@RequestParam("comuselect") String comuselect,Model model) {
		model.addAttribute("comuselect", comuselect);
		return "userInfo/aminMain";
	}
	
	@GetMapping("/payselect")
	public String payselect (@RequestParam("payselect") String payselect,Model model) {
		model.addAttribute("payselect", payselect);
		return "userInfo/aminMain";
	}
			
}
