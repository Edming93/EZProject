package com.sample.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
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
	public String mainselectString (@RequestParam("select") String select,Model model) {
		model.addAttribute("select", select);
		return "userInfo/aminMain";
	}
		
	
	
}
