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

import com.sample.service.LoginService;
import com.sample.service.TeamService;
import com.sample.vo.DataVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;
import com.sample.vo.MatchRegVO;
import com.sample.vo.SearchVO;
import com.sample.vo.TeamMemberVO;
import com.sample.vo.TlistVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/team")
public class TeamController {
	
	private TeamService service;
	private LoginService Lservice;
	
	public TeamController(TeamService service, LoginService lservice) {
		super();
		this.service = service;
		Lservice = lservice;
	}

	@GetMapping("/team")
	public String moveRental() {
		return "team/teamMain";
	}
	
	
	@GetMapping("/login")
	public String getLogin(UserVO vo, HttpSession session,@RequestParam("num") String snum) {
		if (Lservice.isUser(vo, session)) {
		}
		return "team/login";
	}
	
	@PostMapping("/login")
	public String postLogin(UserVO vo, HttpSession session,@RequestParam("num") String snum) {
		System.out.println("로그인~~");
		System.out.println(snum);
		System.out.println(Lservice.isUser(vo, session));
		return (Lservice.isUser(vo, session)) ? "redirect:/team/tinfo?num="+snum : "team/login";
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
		
		if((UserVO)session.getAttribute("sessionVO") != null) {
			UserVO lovi = (UserVO)session.getAttribute("sessionVO");
			UinVO abil = service.abil(lovi.getUserCode(),session);
		}
		
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
			dvo.setGame_code(num);
			dvo.setTeam_code(team_code);
			System.out.println(dvo.getTeam_code());
			service.setslist(dvo);
			service.subgame(num);
		}else {
			return "redirect:/team/login?num="+num;
		}
		
//		"team/teamMain"
		return "redirect:/team/team";
	}
	
	@GetMapping("/tmaxgame")
	public String maxgame(@RequestParam("num") String snum,HttpSession session,DataVO dvo) {
		int num = Integer.parseInt(snum);
		
		if(session.getAttribute("sessionVO") != null) {
			UinVO uvo = (UinVO)session.getAttribute("urabil");
			int team_code = uvo.getTeamCode();
			System.out.println(team_code);
			dvo.setGame_code(num);
			dvo.setTeam_code(team_code);
			System.out.println(dvo.getTeam_code());
			service.setslist(dvo);
			service.maxgame(num);
		}else {
			return "redirect:/team/login?num="+num;
		}
		
		
		return "redirect:/team/team";
	}
	
	@PostMapping("/joinlist")
	@ResponseBody
	public List<Integer> joinlist (@RequestBody DataVO dvo,HttpSession session){
		System.out.println("joinlist");
		System.out.println(dvo.getGameCode());
		int gameCode = dvo.getGameCode();
		System.out.println(gameCode);
		System.out.println(service.teamcode(gameCode).get(0));
		return service.teamcode(gameCode);
	}
	
	@PostMapping("/joininfo")
	@ResponseBody
	public List<UinVO> joininfo (@RequestBody DataVO dvo,HttpSession session){
		System.out.println("joininfo");
		int teamCode = dvo.getTeam_code();
		return service.joininfo(teamCode);
	}
	
	@PostMapping("/fieldinfo")
	@ResponseBody
	public GameFieldInfoVO fieldInfo (@RequestBody GlistVO vo) {
		int fieldcode = vo.getFieldCode();
		return service.fieldinfo(fieldcode);
	}
	
	@PostMapping("/cntmebr")
	@ResponseBody
	public int cntmebr (@RequestBody DataVO vo) {
		int teamCode = vo.getTeamCode();
		return service.cntmebr(teamCode);
	}
	
	@PostMapping("/selectgen")
	@ResponseBody
	public int selectgen (@RequestBody DataVO vo) {
		int teamCode = vo.getTeamCode();
		System.out.println("cntmebr");
		System.out.println(teamCode);
		System.out.println(service.selectgen(teamCode));
		return service.selectgen(teamCode);
	}
	
///--------------------정욱 10.24 ----------------------------------	
	// 글쓰기 눌렀을 경우 매치 작성페이지로 이동
	@GetMapping("/posting")
	public String movePostingPage(Model model) {
		
		return "team/posting";
	}
	


	// 모달창에서 팀이름 검색시 팀 리스트 출력
	@PostMapping("/getTeam")
	@ResponseBody
	public List<TeamMemberVO> getTeamNameList(@RequestBody TeamMemberVO vo){
		System.out.println("getTEam :" + vo.getTeamName());
		System.out.println("getTEam :" + vo.getTeamCode());
		return service.getTeamNameListSer(vo);
	}
	
	
	// 팀 매치 작성 완료 버튼시 이동하는 로직
	@PostMapping("/postingFinish")
	public String putTeamMatchGlist(@ModelAttribute("GlistVO") GlistVO vo, DataVO vo1, Model model) {
		
		if(service.putTeamMatchGlist(vo)) {
			int Gnum =	service.getTeamMatchGlist();
			vo1.setGameCode(Gnum);
			System.out.println("제발제발제발----- :"+vo.getmTeamName());
			System.out.println("오냐오냐오냐 : "+vo.getFieldCode());
			int Tnum = service.getTeamNameT(vo);
			vo1.setTeamCode(Tnum);
			
			System.out.println("컨트롤러---- :" + Gnum);
			System.out.println("컨트롤러---- :" + Tnum);
			
			service.gameTJoinList(vo1);
			System.out.println("오냐오냐오냐code : "+vo.getFieldCode());
			System.out.println("오냐오냐오냐day : "+vo.getGameDay());
			System.out.println("오냐오냐오냐time : "+vo.getGameTime());
			System.out.println("오냐오냐오냐type : "+vo.getGameType());
			service.matchInfo(vo,model);
			return "rental/rentalPayment";
		}else {
			
			return "team/posting";
		}
	}
	
	// 지도에서 주소 입력후 검색 눌렀을때
	@PostMapping("/getMap")
	@ResponseBody
	public List<SearchVO> getMapInfo(@RequestBody SearchVO vo){
		
		System.out.println("맵컨트롤러" + vo.getFieldName());
		System.out.println(service.getGameMap(vo));
		return service.getGameMap(vo); 
	}
	
	// 매치 작성 중 팀 틍록하기 버튼 클릭시
	// 유저정보도 같이 불러오는 것
	
	@GetMapping("/register")
	public String register(HttpSession Session,  Model model) {
		UserVO uvo = (UserVO)Session.getAttribute("sessionVO");
		System.out.println("세션세션 : "+uvo.getUserCode());
		System.out.println("아이디아이디 : "+uvo.getUserId());
		
		service.getUserInfo(uvo.getUserId(), model);
		
		return "team/registeration";
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
	
	@PostMapping("/usercode")
	@ResponseBody
	public List<UinVO> Usercode(@RequestBody UinVO vo) {
		
		return service.getUserList(vo);
	}
	
	
	@PostMapping("/timeListR")
	@ResponseBody
	public List<GlistVO> checkTime(@RequestBody GlistVO gvo){
		
		return service.checkTime(gvo);
	}
	
	//------------------------------------------------------			
}
