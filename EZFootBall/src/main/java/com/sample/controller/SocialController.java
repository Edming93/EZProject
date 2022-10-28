package com.sample.controller;


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

import com.sample.service.GlistService;
import com.sample.service.LoginService;
import com.sample.vo.DataVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;
import com.sample.vo.SjoinVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/msocial")
public class SocialController {
	
	private GlistService service;
	private LoginService lservice;
	
	public SocialController(GlistService service,LoginService lservice) {
		super();
		this.service = service;
		this.lservice = lservice;
	}
	
	@GetMapping("/login")
	public String getLogin(UserVO vo, HttpSession session,@RequestParam("num") String snum) {
		if (lservice.isUser(vo, session)) {
		}
		return "social/login";
	}
	
	@PostMapping("/login")
	public String postLogin(UserVO vo, HttpSession session,@RequestParam("num") String snum) {
		System.out.println("로그인~~");
		System.out.println(snum);
		System.out.println(lservice.isUser(vo, session));
		return (lservice.isUser(vo, session)) ? "redirect:/msocial/info?num="+snum : "social/login";
	}

	
	@PostMapping("/slist")
	@ResponseBody
	public List<GlistVO> betest(@RequestBody DataVO dvo,GlistVO gvo,Model model){
		
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
	        	gvo.setGameGender("여성");
	        }else if(dvo.getYgender().equals("true")&&dvo.getXgender().equals("false")) {
	        	gvo.setGameGender("남성");
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
		System.out.println("/subgame");
		if(session.getAttribute("sessionVO") != null) {
			UserVO lovi = (UserVO)session.getAttribute("sessionVO");
			int user_code = lovi.getUserCode();
			dvo.setGame_code(num);
			dvo.setUser_code(user_code);
			service.setslist(dvo);
			service.subgame(num);
		}else {
			return "redirect:/msocial/login?num="+num;
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/maxgame")
	public String maxgame(@RequestParam("num") String snum,HttpSession session,DataVO dvo) {
		int num = Integer.parseInt(snum);
		System.out.println("/maxgame");
		if(session.getAttribute("sessionVO") != null) {
			UserVO lovi = (UserVO)session.getAttribute("sessionVO");
			int user_code = lovi.getUserCode();
			dvo.setGame_code(num);
			dvo.setUser_code(user_code);
			service.setslist(dvo);
			service.maxgame(num);
		}else {
			return "redirect:/msocial/login?num="+num;
		}
		/* return "index"; */
		return "redirect:/";
	}
	
	@PostMapping("/joinlist")
	@ResponseBody
	public List<SjoinVO> joinlist (@RequestBody DataVO dvo,HttpSession session){
		System.out.println("joinlist");
		int num = dvo.getGame_code();
		return service.joinlist(num);
	}
	
	@PostMapping("/joininfo")
	@ResponseBody
	public List<UinVO> joininfo (@RequestBody DataVO dvo,HttpSession session){
		System.out.println("joininfo");
		int id = dvo.getUser_code();
		return service.joininfo(id);
	}
	
	@PostMapping("/fieldinfo")
	@ResponseBody
	public GameFieldInfoVO fieldInfo (@RequestBody GlistVO vo) {
		int fieldcode = vo.getFieldCode();
		System.out.println("fieldinfo");
		System.out.println(service.fieldinfo(fieldcode).getFieldImg1());
		return service.fieldinfo(fieldcode);
	}
	
	
}
