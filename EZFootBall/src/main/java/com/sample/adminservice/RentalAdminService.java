package com.sample.adminservice;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.RentalDAO;
import com.sample.vo.GameFieldInfoVO;

@Service
public class RentalAdminService {
	
	private RentalDAO dao;

	public RentalAdminService(RentalDAO dao) {
		super();
		this.dao = dao;
	}
	
	public List<GameFieldInfoVO> getFieldListAll() {
		return dao.getFieldListAll(); 
	}
	
}
