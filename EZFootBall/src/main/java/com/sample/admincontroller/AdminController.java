package com.sample.admincontroller;

import java.util.ArrayList;
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
import com.sample.adminservice.FieldAdminService;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private AdminService service;
	private FieldAdminService fdService;
	

	@GetMapping("/admin")
	public String admin() {
		return "adminPage/adminMain";
	}
	
	public AdminController(AdminService service,FieldAdminService fdService) {
		super();
		this.service = service;
		this.fdService = fdService;
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
		
		
		session.setAttribute("fieldList", fdService.getFieldListAll());
		model.addAttribute("fieldList", fdService.getFieldListAll());
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
	
	// 구장 관리 리스트
	@GetMapping("/fieldselect")
	public String fieldselect (Model model,HttpServletRequest request,HttpSession session) {
		// 경로 이동 페이지 값
		String fieldselect = request.getParameter("fieldselect");
		// 수정 or 삭제버튼 클릭 여부
		String fieldChange = request.getParameter("fieldChange");
		// 선택한 check버튼
		String check_btn[] = request.getParameterValues("check_btn");
		
		// 삭제 버튼 클릭했을 때
		if(fieldChange != null) {
			if(fieldChange.equals("delete")) {
				for(int i=0; i<check_btn.length; i++) {
				fdService.deleteSeleteField(check_btn[i]);
				}
				return "redirect:/admin/select?select=fieldAdmin";
			// 수정버튼 클릭했을 때
			}else {
				List<String> list = new ArrayList<String>(); 
				
				if(check_btn != null) {
					for(int i=0; i<check_btn.length; i++) {
						fdService.selectFieldData(check_btn[i],model);
						model.addAttribute("gameFieldInfoVO"+i,fdService.selectFieldData(check_btn[i],model));
//						model.addAttribute("field",fdService.selectFieldData(check_btn[i],model));
						list.add("gameFieldInfoVO"+i);
					}
				}
				model.addAttribute("list", list);
			return "adminPage/adminMain";
			}
		}
		model.addAttribute("fieldselect", fieldselect);
		return "adminPage/adminMain";
	}
	
	// 구장 수정
	@PostMapping("/fieldModify")
	public String modifyField(Model model,GameFieldInfoVO gfVO,@RequestParam("select") String select) {
		model.addAttribute("select",select);
		fdService.modifyUpdate(gfVO);
		model.addAttribute("gfVO",gfVO);
		return "redirect:/admin/select";
	}
	
	
	@GetMapping("/comuselect")
	public String comuselect (@RequestParam("comuselect") String comuselect, Model model) {		
		model.addAttribute("review", service.reviewCommentList());
		model.addAttribute("comuselect", comuselect);
		return "adminPage/adminMain";
	}
	
	@GetMapping("/payselect")
	public String payselect (@RequestParam("payselect") String payselect,Model model) {
		model.addAttribute("payselect", payselect);
		return "adminPage/adminMain";
	}
			
}
