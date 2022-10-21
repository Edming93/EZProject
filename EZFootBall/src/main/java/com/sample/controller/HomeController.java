package com.sample.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.GlistService;
import com.sample.vo.DataVO;
import com.sample.vo.GlistVO;



@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	      System.out.println("home1111");

	      return "index";
	}

	@GetMapping("/home")
	public String firstHome() {
		System.out.println("여기좀 와주세요 ㅠ..");
		
		System.out.println("살려주세요");
		System.out.println("여기 사람있어요");
		return "index";
	}
	
	

}

