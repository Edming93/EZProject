package com.sample.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.RentalDAO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GlistVO;

@Service
public class RentalService {
	private RentalDAO dao;

	public RentalService(RentalDAO dao) {
		super();
		this.dao = dao;
	}

	public List<GlistVO> rvlistALL(GlistVO vo) {
		return dao.rvListAll(vo);
	}

	public List<GlistVO> timeList(GlistVO gvo) {
		return dao.selectTime(gvo);
	}

	public void fieldInfo(int fieldCode, Model model) {
		model.addAttribute("field", dao.fieldInfo(fieldCode));
	}

	public void matchInfo(int fieldCode, Model model) {
		model.addAttribute("match", dao.matchInfo(fieldCode));
	}

	public void insertFieldReservation(FieldReservationVO vo) {
		dao.insertFieldReservation(vo);
	}
	

	public List<GlistVO> rvListSelect(GlistVO vo) {
		return dao.rvListSelect(vo);
	}	

	// 마이페이지 구장예약 정보 불러오기
	public List<FieldReservationVO> getFieldReservationVO(int userCode) {
		List<FieldReservationVO> list = dao.getFieldReservation(userCode);
		return list;
	}
	
	// 예약테이블 등록시 유효성검사
	public FieldReservationVO rvCheck(FieldReservationVO vo) {
		return dao.rvCheck(vo); 
	}
	
	public void insertRvInGameList(GlistVO gvo) {
		dao.insertRvInGameList(gvo);
	}
	
}
