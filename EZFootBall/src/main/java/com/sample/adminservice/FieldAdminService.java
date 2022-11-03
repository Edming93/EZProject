package com.sample.adminservice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.RentalDAO;
import com.sample.vo.GameFieldInfoVO;

@Service
public class FieldAdminService {
	
	private RentalDAO dao;

	public FieldAdminService(RentalDAO dao) {
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
	
	// 이미지 출력
	public String selectFieldImage(String fieldCode,Model model) {
		return dao.selectFieldImage(fieldCode) ;
	}
	
}
