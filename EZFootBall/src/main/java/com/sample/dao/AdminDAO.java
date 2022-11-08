package com.sample.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GameResultVO;
import com.sample.vo.GlistVO;
import com.sample.vo.ReviewCommentVO;
import com.sample.vo.UserVO;


@Mapper
public interface AdminDAO {

	//신청관리
	public List<GlistVO> allgame();
	public List<UserVO> alluser();
	public List<FieldReservationVO> stgame();
	public List<FieldReservationVO> sgame();
	public List<FieldReservationVO> cgame();
	public List<Integer> teamcode();
	
	//경기관리
	public List<GameFieldInfoVO> allfield();
	public List<GameResultVO> result();
	
	public List<FieldReservationVO> Tgame();
	
	public List<FieldReservationVO> joinList();
	
	// 팀예약 현황 조건부 리스트 출력
	public List<FieldReservationVO> joinList1(FieldReservationVO vo);
	
	// 팀 예약현황 삭제
	public int TdeleteG(int gameCode);
	public int TdeleteF(FieldReservationVO vo);
	public int TupdateF(int gameCode);
	// 팀 예약취소현황 출력
	public List<FieldReservationVO> joinList2();
	public List<FieldReservationVO> joinList3(FieldReservationVO vo);
	//리뷰
	public List<ReviewCommentVO> reviewCommentList();
	
	//리뷰 검색
	public List<ReviewCommentVO> reviewselect(ReviewCommentVO vo);
	
	// 유저관리 - 유저리스트 출력
	public List<UserVO> UInfoList();
	public List<UserVO> UInfoList1(UserVO vo);
	
	public List<UserVO> UInfoListB();
	public int UUInfoList(int userCode);

}
