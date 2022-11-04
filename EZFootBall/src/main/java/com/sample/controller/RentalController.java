package com.sample.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.sample.service.LoginService;
import com.sample.service.RentalService;
import com.sample.service.TeamService;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GlistVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/rental")
public class RentalController {
	
	private RentalService service;
	private LoginService Lservice;
	private TeamService Tservice;
	

	public RentalController(RentalService service, LoginService lservice, TeamService tservice) {
		super();
		this.service = service;
		Lservice = lservice;
		Tservice = tservice;
	}

	@GetMapping("/rental")
	public String moveRental() {
		return "rental/rentalMain";
	}
	
	@PostMapping("selectRental")
	@ResponseBody
	public List<GlistVO> selectRental(@RequestBody DataVO dvo, GlistVO gvo){
		System.out.println("selectRental 컨트롤러");
		// 날짜 설정
		gvo.setGameDay(dvo.getDay());
		System.out.println("날짜 : " +gvo.getGameDay());
		// 지역 설정
		if(dvo.getPlace() == null) {
			gvo.setGamePlace(null);
			System.out.println("여기게?");
		}else {
			gvo.setGamePlace(dvo.getPlace());
			System.out.println("여기타게?");
		}
		System.out.println("장소 : " +gvo.getGamePlace());
		
		//크기 설정
		if(dvo.getMver() == null) {
			 gvo.setGameMacth(null);
		 }
		 else{
			 gvo.setGameMacth(dvo.getMver());
		 }
		System.out.println("크기 : " + gvo.getGameMacth());
		 
		return service.rvlistALL(gvo);
		
	}
	
	
	@PostMapping("/rvList")
	@ResponseBody
	public List<GlistVO> rvListAll(@RequestBody DataVO dvo,GlistVO gvo){
		// 구장예약 클릭 시 처음 실행되는 컨트롤러
		gvo.setGameDay(dvo.getDay());
		
		return service.rvlistALL(gvo);
	}

	
	@PostMapping("/timeList")
	@ResponseBody
	public List<GlistVO> timeList(@RequestBody GlistVO gvo){
		
		return service.timeList(gvo);
	}
	
	@PostMapping("/rvListSelect")
	@ResponseBody
	public List<GlistVO> rvListSelect(@RequestBody DataVO dvo,GlistVO gvo){
		gvo.setGameDay(dvo.getDay());
		gvo.setFieldCode(dvo.getCode());
		return service.rvListSelect(gvo);
	}

	
	@GetMapping("/rentalDetail")
	public String rentalDetailMove(@RequestParam("fieldCode") int fieldCode,Model model) {
		service.fieldInfo(fieldCode,model);
		return 	"rental/rentalDetail";
	}
	
	@GetMapping("/rentalDetail2")
	public String rentalDetail2Move(@RequestParam("fieldCode") int fieldCode,
									@RequestParam("num") int num,Model model) {
		service.fieldInfo(fieldCode,model);
		model.addAttribute("num",num);
		return "rental/rentalDetail";
	}
	
	@GetMapping("/paymentInter")
	public String paymentInter(FieldReservationVO fvo,HttpSession session,@RequestParam("pageurl") String pageurl) {

		System.out.println(pageurl);
		if(session.getAttribute("fieldData") != null || session.getAttribute("pageurl") != null) {
		session.removeAttribute("fieldData");
		session.removeAttribute("pageurl");
		}
		session.setAttribute("fieldData", fvo);
		session.setAttribute("pageurl",pageurl);
		
		System.out.println("나 타고가?");
		return (Lservice.isUser((UserVO)session.getAttribute("sessionVO"), session))? "redirect:/rental/rentalPayment":"redirect:/loginPage/login";
	}
	
	@GetMapping("/rentalPayment")
	public String rentalPaymentMove(Model model,@SessionAttribute("fieldData") FieldReservationVO fvo,
									@SessionAttribute("sessionVO") UserVO uvo) {
		service.fieldInfo(fvo.getFieldCode(),model);
		fvo.setUserCode(uvo.getUserCode());
		fvo.setUserPayment(fvo.getFieldRentalfee());
		
	
	
		
		return "rental/rentalPayment";
	}
	
	
	@GetMapping("/resultField")
	public String fieldResultMove(FieldReservationVO fvo,GlistVO gvo,Model model,
								@SessionAttribute("sessionVO") UserVO uvo, HttpSession session) {
		
		fvo.setUserCode(uvo.getUserCode());
		fvo.setUserPayment(fvo.getFieldRentalfee());
		
		gvo.setGameType(fvo.getRvType());
		gvo.setGameMacth(fvo.getFieldType());
		gvo.setGamePay(fvo.getFieldRentalfee());
		

		// 유효성검사 필요 없지만 확실하게 적용
		if(service.rvCheck(fvo)) {
			service.insertFieldReservation(fvo);
			service.insertRvInGameList(gvo);
			return "redirect:/myPage/rentalList";
		}else {
			System.out.println("이미 신청한 경기 표시하기");
			return "redirect:/rental/rentalPayment";
		}
	}
	
	@GetMapping("/resultTeam")
	public String teamResultMove(FieldReservationVO rvo, HttpSession session) {
		UserVO uvo = (UserVO)session.getAttribute("sessionVO"); 
		rvo.setUserCode(uvo.getUserCode());
		
		Tservice.insertFieldRVT(rvo);
		return "rental/resultTeam";

	}
	
	
	// 결제코드 확인중 .. 지우지말 것
//	@GetMapping("/resultTeam")
//	public String teamResultMove(FieldReservationVO rvo, HttpSession session, @RequestParam("merchant") String merchant) {
//		UserVO uvo = (UserVO)session.getAttribute("sessionVO"); 
//		System.out.println("컨트롤러 :"+merchant);
//		rvo.setPayCode(merchant);
//		rvo.setUserCode(uvo.getUserCode());
//		rvo.setUserPayment(rvo.getFieldRentalfee()/2);
//		Tservice.insertFieldRVT(rvo);
//		return "rental/resultTeam";
//
//	}
		
	
}
