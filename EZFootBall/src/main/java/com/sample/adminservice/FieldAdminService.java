package com.sample.adminservice;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.AdminDAO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;

@Service
public class FieldAdminService {
	
	private AdminDAO dao;

	public FieldAdminService(AdminDAO dao) {
		super();
		this.dao = dao;
	}
	
	// 구장 정보 모두 내보내기
	public List<GameFieldInfoVO> getFieldListAll() {
		return dao.getFieldListAll(); 
	}
	
	// 선택한 구장 정보 내보내기
	public GameFieldInfoVO selectFieldData(String fieldCode,Model model) {
		return dao.selectFieldData(fieldCode);
	}
	
	// 구장 삭제
	public void deleteSeleteField(String fieldCode) {
		dao.deleteSeleteField(fieldCode);
	}
	
	// 이미지 내보내기
	public String selectFieldImage(String fieldCode,Model model) {
		return dao.selectFieldImage(fieldCode) ;
	}
	
	// 구장정보 수정
	public void modifyFieldUpdate(GameFieldInfoVO gfvo) {
		dao.modifyField(gfvo); 
	}
	// 구장정보가 수정될 때 게임신청테이블 같이 수정
	public void modifyGameListUpdate(GlistVO gvo) {
		dao.modifyGamelist(gvo); 
	}
	// 구장정보가 수정될 때 에약테이블 같이 수정
	public void modifyFieldReservationUpdate(FieldReservationVO fvo) {
		dao.modifyReservation(fvo); 
	}
	
	
	// ----------------------- 구장 예약 관리 --------------------
	// 
	public List<FieldReservationVO> GFieldReservationList() {
		return dao.GFieldReservationList();
	}
}
