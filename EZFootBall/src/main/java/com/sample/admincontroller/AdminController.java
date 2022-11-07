package com.sample.admincontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.adminservice.AdminService;
import com.sample.adminservice.FieldAdminService;
import com.sample.service.InquiryService;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;
import com.sample.vo.InquiryVO;
import com.sample.vo.ReviewCommentVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private AdminService service;
	private FieldAdminService fdService;
	private InquiryService inquiryService;

	@GetMapping("/admin")
	public String admin() {
		return "adminPage/adminMain";
	}

	public AdminController(AdminService service, FieldAdminService fdService, InquiryService inquiryService) {
		super();
		this.service = service;
		this.fdService = fdService;
		this.inquiryService = inquiryService;
	}

	@GetMapping("/select")
	public String mainselect(@RequestParam("select") String select, HttpSession session, Model model) {
		session.setAttribute("select", select);
		// (모든경기)
		session.setAttribute("gamelist", service.allgame());
		// 모든 유저 정보
		session.setAttribute("userlist", service.alluser());
		// st 신청정보
		session.setAttribute("stgamelist", service.stgame());
		// s 신청정보
		session.setAttribute("sgamelist", service.sgame());
		//취소된 신청
		session.setAttribute("cgamelist", service.cgame());
		//모든 팀 코드
		session.setAttribute("tcodelist", service.teamcode());
		//모든 경기장 정보
		session.setAttribute("allfield", service.allfield());
		//경기결과 정보
		session.setAttribute("result", service.result());
		//모든 팀코드
		session.setAttribute("teamlist", service.teamcode());

		session.setAttribute("fieldList", fdService.getFieldListAll());
		model.addAttribute("fieldList", fdService.getFieldListAll());
		model.addAttribute("inquiryList", inquiryService.inquiryListAdmin());
		return "adminPage/adminMain";
	}
	
	@GetMapping("/gameselect")
	public String gameselect(@RequestParam("gameselect") String gameselect,Model model) {
		model.addAttribute("gameselect", gameselect);
		return "adminPage/adminMain";		
	}

	@GetMapping("/idselect")
	public String idselect(@RequestParam("idselect") String idselect, Model model) {
		model.addAttribute("idselect", idselect);
		return "adminPage/adminMain";
	}

	@GetMapping("/magselect")
	public String magselect(@RequestParam("magselect") String magselect, Model model) {
		model.addAttribute("magselect", magselect);
		return "adminPage/adminMain";
	}

	// 팀매치 리스트 출력
	// 구장 예약 현황 리스트 출력 및 추가 수정 삭제
	@GetMapping("/reserselect")
	public String reserselect(@RequestParam("reserselect") String reserselect, Model model,
			HttpServletRequest request) {

		String[] chBox = request.getParameterValues("chBox");

		if (reserselect.equals("teamMatch")) {
			model.addAttribute("team", service.joinList());
		} else if (reserselect.equals("rvField")) {
			// type 이 G이고, state가 '예약완료'인 list출력
			model.addAttribute("fieldRV", fdService.GFieldReservationList());
		} else if (reserselect.equals("Gcancel")) {
			model.addAttribute("cancelRV", fdService.GCancelList());
		} else if (reserselect.equals("delete")) {
			for (int i = 0; i < chBox.length; i++) {
				fdService.updateFieldReservation(chBox[i]);
				fdService.deleteFieldGamelist(chBox[i]);
			}
			// 다시 구장예약 현황 경로 넣어주기
			return "redirect:/admin/reserselect?reserselect=rvField";
		} else if (reserselect.equals("Tcancel")) {
			// 팀매치 취소 현황
			model.addAttribute("team1", service.joinList2());

		}
		model.addAttribute("reserselect", reserselect);

		return "adminPage/adminMain";
	}

	// 팀 예약현황 - 조건에 따른 리스트 출력
	@PostMapping("/reserselect1")
	public String reserselect1(Model model, FieldReservationVO vo, @RequestParam("Tselect") String Tselect,
			@RequestParam("Tsearch") String Tsearch) {

		if (Tselect.equals("rvCode")) {
			vo.setSrvCode(Tsearch);
		} else if (Tselect.equals("rvDay")) {
			vo.setRvDay(Tsearch);
		} else if (Tselect.equals("userName")) {
			vo.setUserName(Tsearch);
		} else if (Tselect.equals("fieldName")) {
			vo.setFieldName(Tsearch);
		} else if (Tselect.equals("gameDay")) {
			vo.setGameDay(Tsearch);
		} else if (Tselect.equals("fieldType")) {
			vo.setFieldType(Tsearch);
		} else if (Tselect.equals("userCode")) {
			vo.setSuserCode(Tsearch);
		} else if (Tselect.equals("gameCode")) {
			vo.setSgameCode(Tsearch);
		}

		model.addAttribute("team", service.joinList1(vo));

		return "adminPage/adminMain";
	}

	@PostMapping("/TdeleteList")
	@ResponseBody
	public int TdeleteList(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr,
			FieldReservationVO vo) {
		System.out.println("오긴하나1111111??");

		UserVO uvo = (UserVO) session.getAttribute("sessionVO");
		String userId = uvo.getUserId();

		int result = 0;
		int gameCode = 0;

		if (uvo != null) {
			System.out.println("제발~~~");

			for (String i : chArr) {
				gameCode = Integer.parseInt(i);
				vo.setGameCode(gameCode);
				System.out.println("오긴하나222222??");
				System.out.println(gameCode);
				System.out.println("왜다지워짐? : " + gameCode);
				service.TdeleteG(gameCode);
				service.TupdateF(gameCode);
			}
			result = 1;
		}

		return result;
	}

	@PostMapping("/reserselect2")
	public String reserselect2(Model model, FieldReservationVO vo, @RequestParam("Tselect") String Tselect,
			@RequestParam("Tsearch") String Tsearch) {

		if (Tselect.equals("rvCode")) {
			vo.setSrvCode(Tsearch);
		} else if (Tselect.equals("rvDay")) {
			vo.setRvDay(Tsearch);
		} else if (Tselect.equals("userName")) {
			vo.setUserName(Tsearch);
		} else if (Tselect.equals("fieldName")) {
			vo.setFieldName(Tsearch);
		} else if (Tselect.equals("gameDay")) {
			vo.setGameDay(Tsearch);
		} else if (Tselect.equals("fieldType")) {
			vo.setFieldType(Tsearch);
		} else if (Tselect.equals("userCode")) {
			vo.setSuserCode(Tsearch);
		} else if (Tselect.equals("gameCode")) {
			vo.setSgameCode(Tsearch);
		}

		model.addAttribute("team", service.joinList3(vo));

		return "adminPage/adminMain";
	}

	// 구장 관리 리스트
	@GetMapping("/fieldselect")
	public String fieldselect(Model model, HttpServletRequest request, HttpSession session) {
		// 경로 이동 페이지 값
		String fieldselect = request.getParameter("fieldselect");
		// 수정 or 삭제버튼 클릭 여부
		String fieldChange = request.getParameter("fieldChange");
		// 선택한 check버튼
		String check_btn[] = request.getParameterValues("check_btn");

		// 삭제 버튼 클릭했을 때
		if (fieldChange != null) {
			if (fieldChange.equals("delete")) {
				for (int i = 0; i < check_btn.length; i++) {
					fdService.deleteSelectField(check_btn[i]);
					fdService.deleteSelectFieldInGamelist(check_btn[i]);
				}
				return "redirect:/admin/select?select=fieldAdmin";
				// 수정버튼 클릭했을 때
			} else {
				List<String> list = new ArrayList<String>();

				if (check_btn != null) {
					for (int i = 0; i < check_btn.length; i++) {
						model.addAttribute("gameFieldInfoVO" + i, fdService.selectFieldData(check_btn[i], model));
						list.add("gameFieldInfoVO" + i);
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
	public String modifyField(Model model, GameFieldInfoVO gfvo, @RequestParam("select") String select,
			FieldReservationVO fvo, GlistVO gvo) {
		model.addAttribute("select", select);

		fdService.modifyFieldUpdate(gfvo);

		gvo.setGameMacth(gfvo.getFieldType());
		fdService.modifyGameListUpdate(gvo);

		fdService.modifyFieldReservationUpdate(fvo);
		model.addAttribute("gfVO", gfvo);
		return "redirect:/admin/select";
	}

	@GetMapping("/comuselect")
	public String comuselect(@RequestParam("comuselect") String comuselect, Model model) {
		model.addAttribute("review", service.reviewCommentList());
		model.addAttribute("comuselect", comuselect);
		return "adminPage/adminMain";
	}

	@PostMapping("/reviewselect")
	public String reviewselect(@RequestParam("reviewsel") String reviewsel, @RequestParam("reviewcode") int reviewcode,
			Model model, ReviewCommentVO vo) {
		vo.setUserName(reviewsel);
		vo.setUserCode(reviewcode);
		List<ReviewCommentVO> list = service.selectCommentList(vo);
		model.addAttribute("review", list);
		System.out.println(list.get(0));
		return "adminPage/adminMain";
	}

	/*
	 * @PostMapping("/reviewselect2") public String reviewselect
	 * (@RequestParam("reviewcode") int reviewcode, Model model, ReviewCommentVO vo)
	 * { vo.setUserCode(reviewcode); List<ReviewCommentVO> list =
	 * service.selectCommentList(vo); model.addAttribute("review", list); return
	 * "adminPage/adminMain"; }
	 */

	@GetMapping("/payselect")
	public String payselect(@RequestParam("payselect") String payselect, Model model) {
		model.addAttribute("payselect", payselect);
		return "adminPage/adminMain";
	}

	@GetMapping("/adminselect")
	public String adminselect(@RequestParam("adminselect") String adminselect, Model model) {
		model.addAttribute("inquiryList", inquiryService.inquiryListAdmin());
		model.addAttribute("adminselect", adminselect);
		return "adminPage/adminMain";
	}

	@GetMapping("/detail/{detail}")
	public String inquiryDetail(@PathVariable("detail") int detail, Model model, InquiryVO inquiryVO) {
		System.out.println("여기 타나??? :: " + detail);
		inquiryVO.setInquiryCode(detail);
		model.addAttribute("inquiryVO", inquiryService.inquiryDetail(inquiryVO));
		model.addAttribute("adminselect", "qna");
		return "adminPage/adminMain";
	}

	@GetMapping("/inquiry_add")
	public String inquiryAdd(String detail, String answer, Model model, InquiryVO inquiryVO) {
		inquiryVO.setInquiryCode(Integer.parseInt(detail));
		inquiryVO.setAnswerContent(answer);
		inquiryService.InquiryAdd(inquiryVO);
		model.addAttribute("adminselect", "qna");
		return "redirect:/admin/adminselect";
	}

}
