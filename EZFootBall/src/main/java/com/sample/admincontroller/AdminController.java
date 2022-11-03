package com.sample.admincontroller;


import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sample.adminservice.AdminService;
import com.sample.adminservice.RentalAdminService;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.UserVO;

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
		
		System.out.println("리스트한번출력");
		
		model.addAttribute("team", service.joinList());
		
//		model.addAttribute("user",service.alluser());
//		model.addAttribute("team", service.Tgame());
		
		return "adminPage/adminMain";
	}
	
	// 팀 예약현황 - 조건에 따른 리스트 출력
	@PostMapping("/reserselect1")
	public String reserselect1 (Model model, FieldReservationVO vo,
			@RequestParam("Tselect") String Tselect,
			@RequestParam("Tsearch") String Tsearch) {
		
			if(Tselect.equals("rvCode")) {
				vo.setSrvCode(Tsearch);
			}else if(Tselect.equals("rvDay")){
				vo.setRvDay(Tsearch);
			}else if(Tselect.equals("userName")) {
				vo.setUserName(Tsearch);
			}else if(Tselect.equals("fieldName")) {
				vo.setFieldName(Tsearch);
			}else if(Tselect.equals("gameDay")) {
				vo.setGameDay(Tsearch);
			}else if(Tselect.equals("fieldType")) {
				vo.setFieldType(Tsearch);
			}else if(Tselect.equals("userCode")) {
				vo.setSuserCode(Tsearch);
			}else if(Tselect.equals("gameCode")) {
				vo.setSgameCode(Tsearch);
			}
		
			model.addAttribute("team", service.joinList1(vo));
		

		return "adminPage/adminMain";
	}
	
	@PostMapping("/TdeleteList")
	@ResponseBody
	public int TdeleteList(HttpSession session, 
			@RequestParam(value="chbox[]") List<String> chArr,FieldReservationVO vo) {
		System.out.println("오긴하나1111111??");
		
		UserVO uvo = (UserVO)session.getAttribute("sessionVO");
		String userId = uvo.getUserId();
		
		int result = 0;
		int gameCode = 0;
		
		
		if(uvo != null) {
			System.out.println("제발~~~");
		
			for(String i : chArr) {
				gameCode = Integer.parseInt(i);
				vo.setGameCode(gameCode);
				System.out.println("오긴하나222222??");
				System.out.println(gameCode);
				service.TdeleteF(vo);
				service.TdeleteG(vo);
			}
			result = 1;
		}
		

		return result;
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
