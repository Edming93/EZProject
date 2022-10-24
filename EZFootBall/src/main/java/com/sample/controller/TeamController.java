package com.sample.controller;

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

import com.sample.service.TeamService;
import com.sample.vo.DataVO;
import com.sample.vo.MatchRegVO;
import com.sample.vo.TeamMemberVO;
import com.sample.vo.TlistVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

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
	public String info(Model model,@RequestParam("num") String snum,HttpSession session) {
		
		int num = Integer.parseInt(snum);
		
		service.info(num, model);
		
		UserVO lovi = (UserVO)session.getAttribute("sessionVO");
		System.out.println(lovi.getUserCode());
		UinVO abil = service.abil(lovi.getUserCode(),session);
		System.out.println("info오늘 팀코드"+service.abil(lovi.getUserCode(),session).getTeamCode());
	    
	    return "team/matchinfo";
	}
	
	@GetMapping("/tsubgame")
	public String subgame(@RequestParam("num") String snum,HttpSession session,DataVO dvo) {
		int num = Integer.parseInt(snum);		
		
		if(session.getAttribute("sessionVO") != null) {
			System.out.println(session.getAttribute("urabil"));
			UinVO uvo = (UinVO)session.getAttribute("urabil");
			System.out.println(uvo.getTeamCode());
			int team_code = uvo.getTeamCode();
			dvo.setGame_num(num);
			dvo.setGame_code(num);
			dvo.setUser_code(team_code);
			System.out.println(team_code);
			service.setslist(dvo);
			service.subgame(num);
		}else {
			return "loginPage/login";
		}
		
		
		return "team/teamMain";
	}
	
	@GetMapping("/tmaxgame")
	public String maxgame(@RequestParam("num") String snum,HttpSession session,DataVO dvo) {
		int num = Integer.parseInt(snum);
		
		if(session.getAttribute("sessionVO") != null) {
			UinVO uvo = (UinVO)session.getAttribute("urabil");
			int team_code = uvo.getTeamCode();
			System.out.println(team_code);
			dvo.setGame_num(num);
			dvo.setGame_code(num);
			dvo.setTeam_code(team_code);
			System.out.println(dvo.getTeam_code());
			service.setslist(dvo);
			service.maxgame(num);
		}else {
			return "loginPage/login";
		}
		
	
		/* System.out.println(service.maxgame(num)); */
		
		return "team/teamMain";
	}
	
//--------------------정욱 10.24 ----------------------------------	
	// 글쓰기 눌렀을 경우 매치 작성페이지로 이동
	@GetMapping("/posting")
	public String movePostingPage(Model model) {
		
		return "team/posting";
	}
	
	
	// 매치 작성 중 팀 틍록하기 버튼 클릭시
	
	@GetMapping("/register")
	public String register() {
		
		return "team/registeration";
	}
	
	// 매치 작성 후 완료버튼 클릭시
	
	@PostMapping("/postingFinish")
	public String matchreg12( @ModelAttribute("MatchRegVO") MatchRegVO vo, Model model) {
		
		if(service.matchReg1( vo)) {
			
			return "team/main";
		}else {
			
			return "team/posting";
		}
	}
	// 팀 등록시 완료 버튼 눌렀을 경우
	
	@PostMapping("/teamUpdate")
	public String Teamupdate(@ModelAttribute("TeamMemberVO") TeamMemberVO vo) {
		
		if(service.TeamMemberList(vo)) {
			System.out.println(vo.getTmember3());
			System.out.println("---컨트롤러---");
			return "team/posting";
		}else {
			return "team/main";
		}
	}

	// 모달창에서 팀이름 검색시 팀 리스트 출력
	@PostMapping("/getTeam")
	@ResponseBody
	public List<TeamMemberVO> getTeamNameList(@RequestBody TeamMemberVO vo){
		return service.getTeamNameListSer(vo);
	}
	
	//------------------------------------------------------		
}
