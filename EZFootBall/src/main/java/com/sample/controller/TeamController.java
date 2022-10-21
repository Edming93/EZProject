package com.sample.controller;

import java.util.List;

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

import com.sample.service.TeamService;
import com.sample.vo.DataVO;
import com.sample.vo.TlistVO;

@Controller
@RequestMapping("/team")
public class TeamController {
	
	private TeamService service;
	
	public TeamController(TeamService service) {
		super();
		this.service = service;
	}
	
	@GetMapping("/team")
	public String moveRental() {
		return "team/teamMain";
	}
	
	
	@PostMapping("/tlist")
	@ResponseBody
	public List<TlistVO> tlist(@RequestBody DataVO dvo,TlistVO gvo,Model model){
		
		System.out.println("t컨트롤러");
		
		//날짜 설정
		gvo.setGameDay(dvo.getDay());
		
		//지역 설정
		if(dvo.getPlace()==null) {
			gvo.setGamePlace(null);
		}else if(dvo.getPlace().equals("null")) {
			gvo.setGamePlace("%%");
		}
		else {
			gvo.setGamePlace("%"+dvo.getPlace()+"%");
		}
		
		
		
		//마감 설정
		if(dvo.getClose().equals("false")) {
			gvo.setClose(null);
		}else {
			gvo.setClose(dvo.getClose());
		}
		
		
		//성별 설정
		 if(dvo.getYgender().equals("false")&&dvo.getXgender().equals("false")) {
	            gvo.setGameGender(null);
	        }else if (dvo.getYgender().equals("true")&&dvo.getXgender().equals("true")) {
	        	gvo.setGameGender("혼성");
	        }else if(dvo.getYgender().equals("false")&&dvo.getXgender().equals("true")) {
	        	gvo.setGameGender("여");
	        }else if(dvo.getYgender().equals("true")&&dvo.getXgender().equals("false")) {
	        	gvo.setGameGender("남");
	        }
		
	
		//레벨설정
		 if(dvo.getLevel().equals("null")) {
			 gvo.setLevel("%%");
		 }else if(dvo.getLevel() == null) {
			 gvo.setLevel(null);
		 }
		 else {
			 gvo.setLevel("%"+dvo.getLevel()+"%");
		 }
		 
		//매치설정
		 if(dvo.getMver().equals("null")) {
			 gvo.setGameMacth("%%");
		 }else if(dvo.getMver() == null) {
			 gvo.setGameMacth(null);
		 }
		 else {
			 gvo.setGameMacth("%"+dvo.getMver()+"%");
		 }
		 
		
		return service.list(model, gvo);
	}
	

	@PostMapping("/tlistall")
	@ResponseBody
	public List<TlistVO> listall(@RequestBody DataVO dvo,TlistVO gvo,Model model){
		 //최초 진입 시 실행
		System.out.println("t컨트롤러2");
		
		System.out.println(dvo.getDay());
		
		gvo.setGameDay(dvo.getDay());
		
		
		return service.list(model, gvo);
	}
	
	@GetMapping("/tinfo")
	public String info(Model model,@RequestParam("num") String snum,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.setAttribute("gamenum", snum);
		int num = Integer.parseInt(snum);
		
		service.info(num, model);
		System.out.println(num);
	    
	    return "team/matchinfo";
	}
	
	@GetMapping("/tsubgame")
	public String subgame(@RequestParam("num") String snum) {
		int num = Integer.parseInt(snum);
		System.out.println("team");
		service.subgame(num);
		
		return "team/teamMain";
	}
	
	@GetMapping("/tmaxgame")
	public String maxgame(@RequestParam("num") String snum) {
		int num = Integer.parseInt(snum);
		System.out.println("마감");
		
		service.maxgame(num);
		/* System.out.println(service.maxgame(num)); */
		
		return "team/teamMain";
	}
}
