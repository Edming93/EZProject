package com.sample.admincontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.adminservice.AdminService;
import com.sample.adminservice.GameService;
import com.sample.adminservice.RanService;
import com.sample.adminservice.SubService;
import com.sample.vo.DataVO;
import com.sample.vo.GlistVO;
import com.sample.vo.UinVO;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	private AdminService service;
	private SubService subservice;
	private RanService ranservice;
	private GameService gaservice;

    public ManagerController(AdminService service, SubService subservice, RanService ranservice,
            GameService gaservice) {
        super();
        this.service = service;
        this.subservice = subservice;
        this.ranservice = ranservice;
        this.gaservice = gaservice;
    }


    @GetMapping("/manager")
	public String manager(HttpServletRequest request,HttpSession session) {
		// (모든경기)
        session.setAttribute("gamelist", service.allgame());
        // 모든 유저 정보
        session.setAttribute("userlist", service.alluser());
        // st 신청정보
        session.setAttribute("stgamelist", service.stgame());
        // s 신청정보
        session.setAttribute("sgamelist", service.sgame());
        // 취소된 신청
        session.setAttribute("cgamelist", service.cgame());
        // 모든 팀 코드
        session.setAttribute("tcodelist", service.teamcode());
        // 모든 경기장 정보
        session.setAttribute("allfield", service.allfield());
        // 경기결과 정보
        session.setAttribute("result", service.result());
        // 랭킹정보
        session.setAttribute("rankall", service.rankall());

		String page = request.getParameter("page");
		if(page == null) {
			page = "ranking";
		}
		
		if(page.equals("ranking")) {
			request.setAttribute("page","ranking");
		}else if(page.equals("subMain")) {
			request.setAttribute("page", "subMain");
		}else if(page.equals("gameMain")) {
			request.setAttribute("page", "gameMain");
		}
		
		String subPage = request.getParameter("subPage");
		
		if(subPage == null) {
			subPage = "sub1";
		}
		
		if(subPage.equals("sub1")) {
			request.setAttribute("subPage","sub1");
		}else if(subPage.equals("sub2")) {
			request.setAttribute("subPage", "sub2");
		}else if(subPage.equals("sub3")) {
			request.setAttribute("subPage", "sub3");
		}
		
		String gamePage = request.getParameter("gamePage");
		
		if(gamePage == null) {
			gamePage = "game1";
		}
		
		if(gamePage.equals("game1")) {
			request.setAttribute("gamePage","game1");
		}else if(gamePage.equals("game2")) {
			request.setAttribute("gamePage", "game2");
		}else if(gamePage.equals("game3")) {
			request.setAttribute("gamePage", "game3");
		}
		
		String rankPage = request.getParameter("rankPage");
		
		if(rankPage == null) {
			rankPage = "rank1";
		}
		
		if(rankPage.equals("rank1")) {
			request.setAttribute("rankPage","rank1");
		}

		return "managerPage/managerMain";
	}
	

    @GetMapping("tdel")
    public String tdelete(@RequestParam("rvCode") int[] rvCode,@RequestParam("teamCode") int[] teamCode,
                        @RequestParam("gameCode") int[] gameCode,HttpSession session) {
        System.out.println("팀삭제");
        for(int i=0; i<teamCode.length; i++) {
            System.out.println("여긴");
            DataVO vo = new DataVO();
            
            vo.setTeamCode(teamCode[i]);
            vo.setGameCode(gameCode[i]);
            subservice.delete(vo);
            subservice.tdelete(vo);
            subservice.delupdate(gameCode[i]);
        }
        
        return "redirect:/manager/manager";
    }
    
    @GetMapping("sdel")
    public String sdelete(@RequestParam("rvCode") int[] rvCode,@RequestParam("userCode") int[] userCode,
            @RequestParam("gameCode") int[] gameCode,HttpSession session) {
        System.out.println("삭제");
        for(int i=0; i<rvCode.length; i++) {
            System.out.println(rvCode[i]);
            subservice.rdelete(rvCode[i]);
        }
        for(int i=0; i<userCode.length; i++) {
            System.out.println("여긴");
            DataVO vo = new DataVO();
            
            vo.setUserCode(userCode[i]);
            vo.setGameCode(gameCode[i]);
            subservice.sdelete(vo);
            subservice.delupdate(gameCode[i]);
        }
        
        return "redirect:/manager/manager";
    }
    
    @GetMapping("/sadd")
    public String add(HttpSession session,@RequestParam("userCode") int userCode, @RequestParam("gameCode") int gameCode) {
        System.out.println("추가컨트롤러");
        GlistVO vo = new GlistVO();
        vo = subservice.all(gameCode);
        vo.setUserCode(userCode);
        vo.setTeamCode(0);
        subservice.add(vo);
        subservice.slistadd(vo);
        subservice.supdate(gameCode);
        subservice.newresult(vo);
        return "redirect:/manager/manager";
    }
    
    @GetMapping("/tadd")
    public String tadd(HttpSession session,@RequestParam("teamCode") int teamCode, @RequestParam("gameCode") int gameCode) {
        System.out.println("추가컨트롤러");
        List<Integer> ucList = new ArrayList<Integer>();
        ucList = subservice.usercode(teamCode);
        for(int i=0; i<ucList.size(); i++) {
            GlistVO vo = new GlistVO();
            vo = subservice.all(gameCode);
            vo.setTeamCode(teamCode);
            vo.setUserCode(ucList.get(i));
            subservice.tadd(vo);
            subservice.newresult(vo);
        }
        
        GlistVO vo = new GlistVO();
        vo.setGameCode(gameCode);
        vo.setTeamCode(teamCode);
        subservice.tlistadd(vo);
        subservice.tupdate(gameCode);
        return "redirect:/manager/manager";
    }

    @PostMapping("/update")
    public String update (@RequestParam("plus")String plus,@RequestParam("minus")String minus,
                      @RequestParam("userLevel")String userLevel,@RequestParam("ty")String usercode,
                      HttpSession session) {
       UinVO vo = new UinVO();
       int code = Integer.parseInt(usercode);
       vo.setUserCode(code);
       if(plus.equals("0")) {
          int num = Integer.parseInt(minus);
          vo.setUserScore(num);
          ranservice.minus(vo);
       }else if (minus.equals("0")) {
          int num = Integer.parseInt(plus);
          vo.setUserScore(num);
          ranservice.plus(vo);
       }
       vo.setUserLevel(userLevel);
       ranservice.level(vo);
       return "redirect:/manager/manager";
    }
	
	
}
