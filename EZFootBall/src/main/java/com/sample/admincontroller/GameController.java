package com.sample.admincontroller;



import java.lang.invoke.StringConcatFactory;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.adminservice.GameService;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GameResultVO;
import com.sample.vo.GlistVO;


@Controller
@RequestMapping("/game")
public class GameController {
	
	private GameService service;
	
		
	public GameController(GameService service) {
		super();
		this.service = service;
	}


	@PostMapping("/alllist")
	@ResponseBody
	public List<GlistVO> alllist(@RequestBody GlistVO vo) {
		List<GlistVO> result = service.all(vo.getGameType());
		return result;
	}
	
	
	@PostMapping("/cnt")
	@ResponseBody
	public int page(@RequestBody GlistVO vo) {
		return service.count(vo.getGameType());
	}
	


	@PostMapping("/list")
	@ResponseBody
	public List<GlistVO> slist(HttpSession session,@RequestBody GlistVO vo) {
		List<GlistVO> result = service.all(vo.getGameType());
		return result;
	}
	
	@PostMapping("/numlist")
	@ResponseBody
	public List<GlistVO> numlist(@RequestBody GlistVO vo){
		vo.setUserCode((vo.getGameCode()-1)*15);
		return service.numlist(vo);
	}
	
	
	@PostMapping("/searchlist")
	@ResponseBody
	public List<GlistVO> searchlist(@RequestBody GlistVO vo){
		return service.searchlist(vo);
	}
	
	
	@PostMapping("/sadd")
	public String sadd(HttpSession session, GlistVO vo) {
		GameFieldInfoVO gvo = service.fieldinfo(vo.getFieldCode());
		vo.setFieldAddress(gvo.getFieldAddress());
		vo.setFieldName(gvo.getFieldName());
		vo.setGameMacth(gvo.getFieldType());
		service.sadd(vo);
		return "adminPage/adminMain";
	}
	
	@PostMapping("/tadd")
	public String tadd(HttpSession session, GlistVO vo) {
		System.out.println("여기 왜 안옴");
		GameFieldInfoVO gvo = service.fieldinfo(vo.getFieldCode());
		vo.setFieldAddress(gvo.getFieldAddress());
		vo.setFieldName(gvo.getFieldName());
		vo.setGameMacth(gvo.getFieldType());
		service.tadd(vo);
		return "adminPage/adminMain";
	}
	
	@GetMapping("/del")
	public String del(@RequestParam("gameCode") int[] gameCode) {
		for(int i=0; i<gameCode.length;i++) {
			service.del(gameCode[i]);
		}
		return "adminPage/adminMain";
	}
	
	
	@PostMapping("/update")
	public String update(GlistVO vo) {
		service.update(vo);
		return "adminPage/adminMain";
	}
	
	@GetMapping("rdel")
	public String rdel(@RequestParam("resultCode")int[] resultCode,HttpSession session) {
		System.out.println("삭제");
		for(int i=0; i< resultCode.length; i++) {
			service.rdel(resultCode[i]);
		}
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
	
	@PostMapping("radd")
	public String radd(GameResultVO vo,HttpSession session) {
		System.out.println("추가");
		if(vo.getTeamCode()==0) {
			vo.setGameType("S");
		}else {
			vo.setGameType("T");
		}
		service.radd(vo);
		System.out.println(vo.getGameCode());
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
	
	
	@PostMapping("rup")
	public String rup(GameResultVO vo,HttpSession session) {
		System.out.println("업데이트");
		if(vo.getTeamCode()==0) {
			vo.setGameType("S");
		}else {
			vo.setGameType("T");
		}
		//service.radd(vo);
		System.out.println(vo.getGameCode());
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
}
