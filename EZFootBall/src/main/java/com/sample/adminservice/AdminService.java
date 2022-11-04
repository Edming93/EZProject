package com.sample.adminservice;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.AdminDAO;
import com.sample.vo.DataVO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GlistVO;
import com.sample.vo.ReviewCommentVO;
import com.sample.vo.UserVO;
@Service
public class AdminService {

	private AdminDAO dao;

	public AdminService(AdminDAO dao) {
		super();
		this.dao = dao;
	}
	//신청관리
	public List<GlistVO> allgame(){
		return dao.allgame();
	}
	public List<UserVO> alluser(){
		return dao.alluser();
	}
	public List<FieldReservationVO> stgame(){
		return dao.stgame();
	}
	public List<FieldReservationVO> sgame(){
		return dao.sgame();
	}
	public List<FieldReservationVO> cgame(){
		return dao.cgame();
	}
	public List<Integer> teamcode(){
		return dao.teamcode();
	}
	
	
	
	public List<FieldReservationVO> Tgame(){
		return dao.Tgame();
	}
	
	public List<FieldReservationVO> joinList(){
		return dao.joinList();
	}
	
	// 팀 예약현황 조건부 리스트 출력
	public List<FieldReservationVO> joinList1(FieldReservationVO vo){
		
		List<FieldReservationVO> list = dao.joinList1(vo);

		return list;
	}
	
	// 팀 예약현황 삭제 로직
	public void TdeleteG(FieldReservationVO vo) {
		dao.TdeleteG(vo);
	}
	
	public void TdeleteF(FieldReservationVO vo) {
		dao.TdeleteF(vo);
	}
	
	
	public List<ReviewCommentVO> reviewCommentList(){
		return dao.reviewCommentList();
	}
	
	public List<ReviewCommentVO> selectCommentList(ReviewCommentVO vo){
		
		List<ReviewCommentVO> list = dao.reviewselect(vo);

		return list;
	}
}
