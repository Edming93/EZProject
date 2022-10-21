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
import com.sample.vo.DataVO;
import com.sample.vo.GlistVO;

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
	public List<GlistVO> sociallist(@RequestBody DataVO dvo, GlistVO gvo) {
        System.out.println("컨트롤러왓져용");
        
        gvo.setGameDay(dvo.getDay());
        if(dvo.getPlace() == null) {
        	gvo.setGamePlace(null);
        }else {
        	gvo.setGamePlace(dvo.getPlace());
        }
        
        if(dvo.getClose().equals("false")) {
            gvo.setClose(null);
        }else {
        	gvo.setClose(dvo.getClose());
        }
        
       
        if(dvo.getYgender().equals("false")&&dvo.getXgender().equals("false")) {
            gvo.setGameGender(null);
        }else if (dvo.getYgender().equals("true")&&dvo.getXgender().equals("true")) {
            gvo.setGameGender("혼성");
        }else if(dvo.getYgender().equals("false")&&dvo.getXgender().equals("true")) {
            gvo.setGameGender("여");
        }else if(dvo.getYgender().equals("true")&&dvo.getXgender().equals("false")) {
            gvo.setGameGender("남");
        }
        
        return service.sociallist(gvo);
	}
	
	@PostMapping("/listall")
	@ResponseBody
	public List<GlistVO> listall(@RequestBody DataVO dvo,GlistVO gvo,Model model){
		
		System.out.println("컨트롤러2");

		return service.sociallist(gvo);
	}
	
//	
//	@GetMapping("/info")
//	public String info(Model model,@RequestParam("gnum") String gnum,
//	        HttpServletRequest request) {
//		
//	    HttpSession session = request.getSession();
//	    
//	    session.setAttribute("gameNum", gnum);
//	    
//	    return "social/matchinfo";
//	}
}
