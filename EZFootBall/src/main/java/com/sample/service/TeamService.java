package com.sample.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.TeamDAO;
import com.sample.vo.DataVO;
import com.sample.vo.GlistVO;
import com.sample.vo.MatchRegVO;
import com.sample.vo.SearchVO;
import com.sample.vo.TeamMemberVO;
import com.sample.vo.TlistVO;
import com.sample.vo.UinVO;

@Service
public class TeamService {
	
	private TeamDAO dao;

	public TeamService(TeamDAO dao) {
		super();
		this.dao =dao;
	}
	
	public List<TlistVO> list(Model model,TlistVO vo) {
		return dao.list(vo);
		//model.addAttribute("list", vo);
	}
	
	public void info(int num,Model model) {
		model.addAttribute("matchinfo", dao.info(num));
	}
	
	public void subgame(int num) {
		dao.subgame(num);
	}
	public void maxgame(int num) {
		dao.maxgame(num);
	}
	public void setslist(DataVO vo) {
		dao.setslist(vo);
	}
	
	public UinVO abil(int usercode, HttpSession session) {
		session.setAttribute("urabil",dao.abile(usercode));
		return dao.abile(usercode);
	}
	
	public List<Integer> teamcode (int gameCode){
		return dao.teamcode(gameCode);
	}
	
	public List<UinVO> joininfo (int teamCode){
		return dao.joininfo(teamCode);
	}
	
	//-----------------정욱 10.24---------------------------------------
	//----------------------posting page--------------------------------------------------
		// 매치정보 insert 하는 메서드
		public boolean matchReg1( MatchRegVO vo) {
			System.out.println("서비ㅅ서비스");
			System.out.println(vo.getmDate());
			System.out.println(vo.getmTime());
			System.out.println(vo.getmFieldName());
			
			return (dao.matchReg(vo)>0?true:false);
		}
		
		// insert 된 리스트를 가져오는 메서드
		public void getMatchList1(Model model) {
			model.addAttribute("matchList", dao.getMatchList());
			System.out.println("여기는왜탐?");
		}
		
		public List<TeamMemberVO> getTeamNameListSer(TeamMemberVO vo){
			return dao.getTeamListWhere(vo);
		}
		
		//-------------------------------registration page-----------------------------------------	
		
		public boolean TeamMemberList(TeamMemberVO vo) {
				System.out.println(vo.getTmember2());
			
			return (dao.insertTeamMember(vo)>0)?true:false;
		}
		// 매치 작성 후 완료버튼시 insert into gamelist
		
		public boolean putTeamMatchGlist(GlistVO vo) {
			
			return (dao.putTeamMatchGlist(vo)>0)?true:false;
		}
		
		// 지도에서 주소값 불러오기
		
		public List<SearchVO> getGameMap(SearchVO vo){
			
			System.out.println("서비스"+vo.getFieldName());
			return dao.getGameMapWhere(vo);
		}
		
		
		public int getTeamMatchGlist() {
			
			return dao.getTeamMatchGlist();
		}
		
		public void gameTJoinList(DataVO vo) {
			dao.gameTJoinList(vo);
		}
		//-----------------------------------------------------
}
