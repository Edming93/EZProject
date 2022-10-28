package com.sample.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.TeamDAO;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
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
	
	public GameFieldInfoVO fieldinfo (int fieldcode) {
		return dao.fieldinfo(fieldcode);
	}
	
	public int cntmebr (int teamCode) {
		return dao.cntmebr(teamCode);
	}
	
	public int selectgen (int teamCode) {
		System.out.println("서비스" + teamCode);
		System.out.println(dao.cntmebr(teamCode));
		return dao.selectgen(teamCode);
	}
	
	//-----------------정욱 10.24---------------------------------------
		//----------------------posting page--------------------------------------------------
			
			
			// insert 된 리스트를 가져오는 메서드
			public void getMatchList1(Model model) {
				model.addAttribute("matchList", dao.getMatchList());
		
			}
			
			public List<TeamMemberVO> getTeamNameListSer(TeamMemberVO vo){
				return dao.getTeamListWhere(vo);
			}
			
			//-------------------------------registration page-----------------------------------------	
			
			public boolean TeamMemberList(TeamMemberVO vo) {
					
				return (dao.insertTeamMember(vo)>0)?true:false;
			}
			
			// 매치 작성 후 완료버튼시 insert into gamelist
			
			public boolean putTeamMatchGlist(GlistVO vo) {
				
				return (dao.putTeamMatchGlist(vo)>0)?true:false;
			}
			
			// 지도에서 주소값 불러오기
			
			public List<SearchVO> getGameMap(SearchVO vo){
				
				return dao.getGameMapWhere(vo);
			}
			
			
			public int getTeamMatchGlist() {
				
				return dao.getTeamMatchGlist();
			}
			
			public void gameTJoinList(DataVO vo) {
				
				dao.gameTJoinList(vo);
			}
			
			public int getTeamNameT(GlistVO vo) {
				
				return dao.getTeamName(vo);
			}
			
			// 매치 등록시 시간 유효성 검사
			public List<GlistVO> timeList(GlistVO gvo) {
				return dao.selectTimeR(gvo);
			}
			
			public List<GlistVO> checkTime(GlistVO gvo) {
				return dao.checkTime(gvo);
			}
			
			// rental payment 이동시
						public void matchInfo(GlistVO vo, Model model) {
							System.out.println("서비서비code : "+vo.getFieldCode());
							System.out.println("서비서비오냐day : "+vo.getGameDay());
							System.out.println("서비서비오냐time : "+vo.getGameTime());
							System.out.println("서비서비오냐type : "+vo.getGameType());
							System.out.println("dao:게임타입 : " + dao.matchInfo(vo).getGameType());
							model.addAttribute("match",dao.matchInfo(vo));
						}
						
						// Reservation table insert
						public void insertFieldRVT(FieldReservationVO rvo) {
							System.out.println("욱컨트롤러Fcode : "+rvo.getFieldCode());
							System.out.println("윽컨트롤러UPay : "+rvo.getUserPayment());
							System.out.println("ㅇ컨트롤러Fname : "+rvo.getFieldName());
							System.out.println("ㅇ컨트롤러FType : "+rvo.getFieldType());
							System.out.println("ㅇ컨트롤러GType : "+rvo.getRvType());
							System.out.println("userPay : "+ rvo.getFieldRentalfee());
							System.out.println("afklajlks :" + rvo.getGameDay());
							System.out.println("alkfjalkf :" + rvo.getGameTime());
							dao.insertFieldRVT(rvo);
						}
			//-----------------------------------------------------
}
