package com.sample.admincontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.adminservice.AdminService;
import com.sample.adminservice.SubService;
import com.sample.service.RankService;
import com.sample.service.TeamService;
import com.sample.vo.DataVO;
import com.sample.vo.GlistVO;
import com.sample.vo.MatchRegVO;
import com.sample.vo.SearchVO;
import com.sample.vo.TeamMemberVO;
import com.sample.vo.TlistVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/sub")
public class SubController {
	
	private SubService service;
	private AdminService aservice;
	
	public SubController(SubService service,AdminService aservice){
		super();
		this.service = service;
		this.aservice = aservice;
	}
	/*public SubController(RankService service) {
		super();
		this.service = service;
	}*/
	
	@GetMapping("tdel")
	public String tdelete(@RequestParam("rvCode") int[] rvCode,@RequestParam("teamCode") int[] teamCode,
						@RequestParam("gameCode") int[] gameCode,HttpSession session) {
		System.out.println("삭제");
		for(int i=0; i<teamCode.length; i++) {
			System.out.println("여긴");
			DataVO vo = new DataVO();
			
			vo.setTeamCode(teamCode[i]);
			vo.setGameCode(gameCode[i]);
			service.delete(vo);
			service.tdelete(vo);
		}
		
		//(모든경기)
		session.setAttribute("gamelist", aservice.allgame());
		//모든 유저 정보
		session.setAttribute("userlist", aservice.alluser());
		//st 신청정보
		session.setAttribute("stgamelist", aservice.stgame());
		//s 신청정보
		session.setAttribute("sgamelist", aservice.sgame());
		
		return "redirect:/admin/admin";
	}
	
	@GetMapping("sdel")
	public String sdelete(@RequestParam("rvCode") int[] rvCode,@RequestParam("userCode") int[] userCode,
			@RequestParam("gameCode") int[] gameCode,HttpSession session) {
		System.out.println("삭제");
		for(int i=0; i<rvCode.length; i++) {
			System.out.println(rvCode[i]);
			service.rdelete(rvCode[i]);
		}
		for(int i=0; i<userCode.length; i++) {
			System.out.println("여긴");
			DataVO vo = new DataVO();
			
			vo.setUserCode(userCode[i]);
			vo.setGameCode(gameCode[i]);
			service.sdelete(vo);
		}
		
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
	
	@GetMapping("/sadd")
	public String add(HttpSession session,@RequestParam("userCode") int userCode, @RequestParam("gameCode") int gameCode) {
		System.out.println("추가컨트롤러");
		GlistVO vo = new GlistVO();
		vo = service.all(gameCode);
		vo.setUserCode(userCode);
		service.add(vo);
		service.slistadd(vo);
		service.supdate(gameCode);
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}
	
	
	@GetMapping("/tadd")
	public String tadd(HttpSession session,@RequestParam("teamCode") int teamCode, @RequestParam("gameCode") int gameCode) {
		System.out.println("추가컨트롤러");
		List<Integer> ucList = new ArrayList<Integer>();
		ucList = service.usercode(teamCode);
		for(int i=0; i<ucList.size(); i++) {
			GlistVO vo = new GlistVO();
			vo = service.all(gameCode);
			vo.setTeamCode(teamCode);
			vo.setUserCode(ucList.get(i));
			service.tadd(vo);
		}
		
		GlistVO vo = new GlistVO();
		vo.setGameCode(gameCode);
		vo.setTeamCode(teamCode);
		service.tlistadd(vo);
		service.tupdate(gameCode);
		return "redirect:/admin/select?select="+session.getAttribute("select");
	}

}
