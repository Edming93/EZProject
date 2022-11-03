package com.sample.admincontroller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sample.adminservice.AdminService;
import com.sample.adminservice.RentalAdminService;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private AdminService service;
	private RentalAdminService raService;
	

	
	//private GlistService service;
	//private LoginService lservice;
	//private TeamService tservice;
	
//	public AdminController(GlistService service,LoginService lservice,TeamService tservice) {
//		super();
//		this.service = service;
//		this.lservice = lservice;
//		this.tservice = tservice;
//	}
	
	public AdminController(AdminService service, RentalAdminService raService) {
		super();
		this.service = service;
		this.raService = raService;
	}

	@GetMapping("/admin")
	public String admin() {
		return "adminPage/adminMain";
	}
	
	@GetMapping("/select")
	public String mainselect (@RequestParam("select") String select,HttpSession session,Model model) {
		session.setAttribute("select", select);
		//(모든경기)
		session.setAttribute("gamelist", service.allgame());
		//모든 유저 정보
		session.setAttribute("userlist", service.alluser());
		//st 신청정보
		session.setAttribute("stgamelist", service.stgame());
		//s 신청정보
		session.setAttribute("sgamelist", service.sgame());
		//취소된 신청
		session.setAttribute("cgamelist", service.cgame());
		
		
		session.setAttribute("fieldList", raService.getFieldListAll());
		model.addAttribute("fieldList", raService.getFieldListAll());
		return "adminPage/adminMain";
	}
	
	@GetMapping("/idselect")
	public String idselect (@RequestParam("idselect") String idselect,Model model) {
		model.addAttribute("idselect", idselect);
		return "adminPage/adminMain";
	}
	
	@GetMapping("/magselect")
	public String magselect (@RequestParam("magselect") String magselect,Model model) {
		model.addAttribute("magselect", magselect);
		return "adminPage/adminMain";
	}
	
	@GetMapping("/reserselect")
	public String reserselect (@RequestParam("reserselect") String reserselect,Model model,
								@SessionAttribute("fieldList") GameFieldInfoVO fieldList) {
		model.addAttribute("reserselect", reserselect);
		model.addAttribute("fieldList",fieldList);
		

		model.addAttribute("team", service.joinList());
		
//		model.addAttribute("user",service.alluser());
//		model.addAttribute("team", service.Tgame());
		
		return "adminPage/adminMain";
	}
	
	
	@GetMapping("/subselect")
	public String subselect (@RequestParam("subselect") String subselect,Model model,HttpSession session) {
		model.addAttribute("subselect", subselect);
		return "adminPage/adminMain";
	}
	
	@GetMapping("/fieldselect")
	public String fieldselect (@RequestParam("fieldselect") String fieldselect,Model model) {
		model.addAttribute("fieldselect", fieldselect);
		return "adminPage/adminMain";
	}
	
	@GetMapping("/comuselect")
	public String comuselect (@RequestParam("comuselect") String comuselect,Model model) {
		model.addAttribute("comuselect", comuselect);
		return "adminPage/adminMain";
	}
	
	@GetMapping("/payselect")
	public String payselect (@RequestParam("payselect") String payselect,Model model) {
		model.addAttribute("payselect", payselect);
		return "adminPage/adminMain";
	}
			
}
