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
import com.sample.service.TeamService;
import com.sample.vo.DataVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;
import com.sample.vo.SjoinVO;
import com.sample.vo.TlistVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/msocial")
public class SocialController {
	
	private GlistService service;
	private LoginService lservice;
	private TeamService tservice;
	
	public SocialController(GlistService service,LoginService lservice,TeamService tservice) {
		super();
		this.service = service;
		this.lservice = lservice;
		this.tservice = tservice;
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
		System.out.println("info");
		int num = Integer.parseInt(snum);
		session.setAttribute("snum", snum);
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
		return (lservice.isUser((UserVO)session.getAttribute("sessionVO"), session)) ? "redirect:/msocial/socialpayment" : "loginPage/login";
	}
	
	@GetMapping("/socialpayment")
	public String spayString (HttpSession session,Model model) {
		System.out.println("지나갑니당");
		int num =0;
		if(session.getAttribute("snum") != null) {
			System.out.println("소셜매치");
			num = Integer.parseInt((String)session.getAttribute("snum"));
			service.info(num, model);
		}else {
			System.out.println("팀매치");
			num = Integer.parseInt((String)session.getAttribute("tnum"));
			tservice.info(num, model);
		}
		System.out.println(model.getAttribute("matchinfo"));
		return "social/socialpay";
	}
	
	
	@GetMapping("paying")
	public String paying(HttpSession session,DataVO dvo,Model model) {
		
		UserVO lovi = (UserVO)session.getAttribute("sessionVO");
		int user_code = lovi.getUserCode();
		
		dvo.setUser_code(user_code);
		if(session.getAttribute("snum") != null) {
			int num = Integer.parseInt((String)session.getAttribute("snum"));
			dvo.setGame_code(num);
			service.info(num, model);
			GlistVO vo = (GlistVO)model.getAttribute("matchinfo");
			vo.setUserCode(user_code);
			if(vo.getGameMaxp() - vo.getGamePnum() == 1) {
				service.setslist(dvo);
				service.maxgame(num);
				service.newreser(vo);
			}else {
				service.setslist(dvo);
				service.subgame(num);
				service.newreser(vo);
			}
		}else {
			System.out.println("팀신청");
			int num = Integer.parseInt((String)session.getAttribute("tnum"));
			UinVO uvo = (UinVO)session.getAttribute("urabil");
			int team_code = uvo.getTeamCode();
			dvo.setGame_code(num);
			dvo.setTeam_code(team_code);
			tservice.info(num, model);
			TlistVO vo = (TlistVO)model.getAttribute("matchinfo");
			List<UinVO> tvo = tservice.joininfo(team_code);
			if(vo.getGameMaxp() - vo.getGamePnum() == 1) {
				tservice.setslist(dvo);
				tservice.maxgame(num);
				System.out.println("여긴오고");
				for(int i=0; i<tvo.size(); i++) {
					System.out.println("팀 업뎃해야지");
					System.out.println(tvo.get(i).getUserCode());
					tservice.info(num,model);
					TlistVO vo1 = (TlistVO)model.getAttribute("matchinfo");
					vo1.setUserCode(tvo.get(i).getUserCode());
					tservice.newreser(vo1);
				}
			}else {
				tservice.setslist(dvo);
				tservice.subgame(num);
				for(int i=0; i<tvo.size(); i++) {
					System.out.println("팀 업뎃해야지");
					System.out.println(tvo.get(i).getUserCode());
					tservice.info(num,model);
					TlistVO vo1 = (TlistVO)model.getAttribute("matchinfo");
					vo1.setUserCode(tvo.get(i).getUserCode());
					tservice.newreser(vo1);
				}
			}
		}
		
		session.removeAttribute("snum");
		session.removeAttribute("tnum");
		session.removeAttribute("urabil");
		return "/index";
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
