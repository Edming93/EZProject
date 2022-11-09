package com.sample.admincontroller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.adminservice.RanService;
import com.sample.vo.UinVO;



@Controller
@RequestMapping("/ran")
public class RanController {
	
	private RanService service;
	
	
	
	public RanController(RanService service) {
		super();
		this.service = service;
	}



	@PostMapping("/update")
	public String update (@RequestParam("plus")String plus,@RequestParam("minus")String minus,
							@RequestParam("userLevel")String userLevel,@RequestParam("ty")String usercode,
							HttpSession session) {
		System.out.println("랭크");
		System.out.println(plus);
		System.out.println(minus);
		System.out.println(usercode);
		UinVO vo = new UinVO();
		int code = Integer.parseInt(usercode);
		vo.setUserCode(code);
		System.out.println("그전에");
		if(plus.equals("0")) {
			int num = Integer.parseInt(minus);
			vo.setUserScore(num);
			
			service.minus(vo);
			System.out.println("마");
		}else if (minus.equals("0")) {
			int num = Integer.parseInt(plus);
			vo.setUserScore(num);
			service.plus(vo);
			
			System.out.println("플");
		}
		vo.setUserLevel(userLevel);
		service.level(vo);
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
}
