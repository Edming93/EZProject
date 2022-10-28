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
import com.sample.service.TeamService;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GlistVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/rental")
public class RentalController {
	
	private RentalService service;
	private TeamService Tservice;
	
	public RentalController(RentalService service, TeamService tservice) {
		super();
		this.service = service;
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
		UserVO uvo = (UserVO)session.getAttribute("sessionVO");
		fvo.setUserCode(uvo.getUserCode());
		fvo.setUserPayment(fvo.getFieldRentalfee());
		
		gvo.setGameType(fvo.getRvType());
		gvo.setGameMacth(fvo.getFieldType());
		
		System.out.println(gvo.getGameType()+"/"+gvo.getFieldCode()+"/"+gvo.getFieldName()+"/"+gvo.getFieldAddress()+"/"+gvo.getGameMacth()+"/"+gvo.getGameDay()+"/"+gvo.getGameTime());
		
		// 구장 예약테이블에 신청한 정보가 없으면
		System.out.println("fvo 정보 : "+ fvo);
		if(service.rvCheck(fvo) == null) {
			service.insertFieldReservation(fvo);
			service.insertRvInGameList(gvo);
			return "rental/resultField";
		}else {
			System.out.println("이미 신청한 경기 표시하기");
			return "redirect:/rental/rentalPayment";
		}
	}
	
	@GetMapping("/resultTeam")
	public String teamResultMove(FieldReservationVO rvo, HttpSession session) {
		UserVO uvo = (UserVO)session.getAttribute("sessionVO"); 
		rvo.setUserCode(uvo.getUserCode());
		rvo.setUserPayment(rvo.getFieldRentalfee());
		Tservice.insertFieldRVT(rvo);
		return "rental/resultTeam";

	}
		
	
}
