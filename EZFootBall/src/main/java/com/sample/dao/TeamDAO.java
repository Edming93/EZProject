package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.DataVO;
import com.sample.vo.MatchRegVO;
import com.sample.vo.TeamMemberVO;
import com.sample.vo.TlistVO;
import com.sample.vo.UinVO;

@Mapper
public interface TeamDAO {
	
	public List<TlistVO> list(TlistVO vo);
	
	public TlistVO info(int num);
	
	public int subgame(int num);
	
	public int maxgame(int num);
	
	public int setslist(DataVO vo);
	
	public UinVO abile(int usercode);
	
	//----------------------정욱 10.24-------------------------
	//----------------------registeration page--------------------------------------------------
		// 팀 멤버 등록 
		public int insertTeamMember(TeamMemberVO vo);
		
		// 팀 멤버 리스트 불러오기
		public List<TeamMemberVO> getTeamList();
		
	//----------------------posting page--------------------------------------------------	
		// 매치 작성완료 버튼 클릭시 DB에 저장
		public int matchReg(MatchRegVO vo);
		
		// 매치 작성완료 후 매치정보 불러오기
		public List<MatchRegVO> getMatchList();
		
		// 팀 등록 테이블에서 정보 불러오기
		public List<TeamMemberVO> getTeamListWhere(TeamMemberVO vo);
	//-----------------------------------------------
}
