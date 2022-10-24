package com.sample.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.GlistService;
import com.sample.vo.DataVO;
import com.sample.vo.GlistVO;
import com.sample.vo.SjoinVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/msocial")
public class SocialController {
	
	private GlistService service;
	
	public SocialController(GlistService service) {
		super();
		this.service = service;
	}

	
	@PostMapping("/slist")
	@ResponseBody
	public List<GlistVO> betest(@RequestBody DataVO dvo,GlistVO gvo,Model model){
		
		System.out.println("컨트롤러");
		
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
	

	@PostMapping("/listall")
	@ResponseBody
	public List<GlistVO> listall(@RequestBody DataVO dvo,GlistVO gvo,Model model){
		 //최초 진입 시 실행
		System.out.println("컨트롤러2");
		
		System.out.println(dvo.getDay());
		
		gvo.setGameDay(dvo.getDay());
		
		
		return service.list(model, gvo);
	}
	
	@GetMapping("/info")
	public String info(Model model,@RequestParam("num") String snum,HttpSession session) {
		
		int num = Integer.parseInt(snum);
		
		service.info(num, model);
		if((UserVO)session.getAttribute("sessionVO") != null) {
			UserVO lovi = (UserVO)session.getAttribute("sessionVO");
			UinVO abil = service.abil(lovi.getUserCode(),session);
		}
		
	    
	    return "social/matchinfo";
	}
	
	@GetMapping("/subgame")
	public String subgame(@RequestParam("num") String snum,HttpSession session,DataVO dvo) {
		int num = Integer.parseInt(snum);
		
		if(session.getAttribute("sessionVO") != null) {
			UserVO lovi = (UserVO)session.getAttribute("sessionVO");
			System.out.println(lovi.getUserId());
			int user_code = lovi.getUserCode();
			dvo.setGame_num(num);
			dvo.setUser_code(user_code);
			service.setslist(dvo);
			service.subgame(num);
		}else {
			return "loginPage/login";
		}
		
		return "index";
	}
	
	@GetMapping("/maxgame")
	public String maxgame(@RequestParam("num") String snum,HttpSession session,DataVO dvo) {
		int num = Integer.parseInt(snum);
		if(session.getAttribute("sessionVO") != null) {
			System.out.println(session.getAttribute("sessionVO"));
			UserVO lovi = (UserVO)session.getAttribute("sessionVO");
			System.out.println(lovi.getUserId());
			int user_code = lovi.getUserCode();
			dvo.setGame_num(num);
			dvo.setUser_code(user_code);
			service.setslist(dvo);
			service.maxgame(num);
		}else {
			return "loginPage/login";
		}
		return "index";
	}
	
	@PostMapping("/joinlist")
	@ResponseBody
	public List<SjoinVO> joinlist (@RequestBody DataVO dvo,HttpSession session){
		System.out.println("joinlist");
		int num = dvo.getGame_num();
		return service.joinlist(num);
	}
	
	@PostMapping("/joininfo")
	@ResponseBody
	public List<UinVO> joininfo (@RequestBody DataVO dvo,HttpSession session){
		System.out.println("joininfo");
		int id = dvo.getUser_code();
		System.out.println(id);
		return service.joininfo(id);
	}
	
	
}
