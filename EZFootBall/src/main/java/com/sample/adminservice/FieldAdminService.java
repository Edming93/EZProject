package com.sample.adminservice;

import java.util.List;

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
	
	public void deleteSeleteField(String fieldCode) {
		dao.deleteSeleteField(fieldCode);
	}
	
}
