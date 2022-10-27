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

import com.sample.service.RentalService;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GlistVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/rental")
public class RentalController {
	
	private RentalService service;
	
	public RentalController(RentalService service) {
		super();
		this.service = service;
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
		//지역 설정
		if(dvo.getPlace() == null) {
			gvo.setGamePlace(null);
			System.out.println("여기게?");
		}else {
			gvo.setGamePlace(dvo.getPlace());
			System.out.println("여기타게?");
		}
		System.out.println("장소 : " +gvo.getGamePlace());
		
		//마감 설정
//		if(dvo.getType().equals("true")) {
//			gvo.setGameType(null);
//		}else {
//			gvo.setGameType("S");
//		}
//		System.out.println("마감 : " +gvo.getGameType());
		
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
	
	@GetMapping("/rentalDetail")
	public String rentalDetailMove(@RequestParam("fieldCode") int fieldCode,Model model) {
		System.out.println("필드코드 : "+fieldCode);
		service.fieldInfo(fieldCode,model);
		return 	"rental/rentalDetail";
	}
	
	@GetMapping("/rentalPayment")
	public String rentalPaymentMove(@RequestParam("fieldCode") int fieldCode,Model model,
									@RequestParam("day") String day,@RequestParam("time") int time) {
		service.fieldInfo(fieldCode,model);
		model.addAttribute("day",day);
		model.addAttribute("time",time);
		
		System.out.println("여기까지오나?");
		return "rental/rentalPayment";
	}
	
	
	@GetMapping("/resultField")
	public String fieldResultMove(FieldReservationVO fvo,GlistVO gvo,
			HttpSession session) {
		System.out.println("주소와? "+fvo.getFieldAddress());
		UserVO uvo = (UserVO)session.getAttribute("sessionVO"); 
		fvo.setUserCode(uvo.getUserCode());
		fvo.setUserPayment(fvo.getFieldRentalfee());
		service.insertFieldReservation(fvo);
		return "rental/resultField";
	}
	
	@GetMapping("/resultTeam")
	public String teamResultMove() {
		return "rental/resultTeam";
	}
	

	
		
	
}
