package com.sample.admincontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.adminservice.AdminService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	private AdminService service;
	
	public ManagerController(AdminService service) {
		super();
		this.service = service;
	}

	@GetMapping("/manager")
	public String manager(HttpServletRequest request,HttpSession session) {
		// (모든경기)
				session.setAttribute("gamelist", service.allgame());
				// 모든 유저 정보
				session.setAttribute("userlist", service.alluser());
				// st 신청정보
				session.setAttribute("stgamelist", service.stgame());
				// s 신청정보
				session.setAttribute("sgamelist", service.sgame());
				// 취소된 신청
				session.setAttribute("cgamelist", service.cgame());
				// 모든 팀 코드
				session.setAttribute("tcodelist", service.teamcode());
				// 모든 경기장 정보
				session.setAttribute("allfield", service.allfield());
				// 경기결과 정보
				session.setAttribute("result", service.result());
				//랭킹정보
				session.setAttribute("rankall", service.rankall());
				
		String page = request.getParameter("page");
		if(page == null) {
			page = "ranking";
		}
		
		if(page.equals("ranking")) {
			request.setAttribute("page","ranking");
		}else if(page.equals("subMain")) {
			request.setAttribute("page", "subMain");
		}else if(page.equals("gameMain")) {
			request.setAttribute("page", "gameMain");
		}
		
		String subPage = request.getParameter("subPage");
		
		if(subPage == null) {
			subPage = "sub1";
		}
		
		if(subPage.equals("sub1")) {
			request.setAttribute("subPage","sub1");
		}else if(subPage.equals("sub2")) {
			request.setAttribute("subPage", "sub2");
		}else if(subPage.equals("sub3")) {
			request.setAttribute("subPage", "sub3");
		}
		
		String gamePage = request.getParameter("gamePage");
		
		if(gamePage == null) {
			gamePage = "game1";
		}
		
		if(gamePage.equals("game1")) {
			request.setAttribute("gamePage","game1");
		}else if(gamePage.equals("game2")) {
			request.setAttribute("gamePage", "game2");
		}else if(gamePage.equals("game3")) {
			request.setAttribute("gamePage", "game3");
		}
		
		String rankPage = request.getParameter("rankPage");
		
		if(rankPage == null) {
			rankPage = "rank1";
		}
		
		if(rankPage.equals("rank1")) {
			request.setAttribute("rankPage","rank1");
		}

		return "managerPage/managerMain";
	}
	
//	@GetMapping("/sub") 
//	public String sub(HttpServletRequest request,HttpSession session) {
//		String subPage = request.getParameter("subPage");
//		
//		if(subPage == null) {
//			subPage = "sub1";
//		}
//		
//		if(subPage.equals("sub1")) {
//			request.setAttribute("page","sub1");
//		}else if(subPage.equals("sub2")) {
//			request.setAttribute("page", "sub2");
//		}else if(subPage.equals("sub3")) {
//			request.setAttribute("page", "sub3");
//		}
//		return "redirect:/manager/manager?subPage="+subPage;
//	}
//	
//	@GetMapping("/game") 
//	public String game(HttpServletRequest request) {
//		String subPage = request.getParameter("page");
//		
//		if(subPage == null) {
//			subPage = "game1";
//		}
//		
//		if(subPage.equals("game1")) {
//			request.setAttribute("page","game1");
//		}else if(subPage.equals("game2")) {
//			request.setAttribute("page", "game2");
//		}else if(subPage.equals("game3")) {
//			request.setAttribute("page", "game3");
//		}
//		return "managerPage/managerMain";
//	}
	
	
}
