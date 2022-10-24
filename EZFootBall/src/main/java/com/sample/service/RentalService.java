package com.sample.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.sample.dao.RentalDAO;
import com.sample.vo.DataVO;
import com.sample.vo.GlistVO;

@Service
public class RentalService {
	private RentalDAO dao;

	public RentalService(RentalDAO dao) {
		super();
		this.dao = dao;
	}

	public List<GlistVO> rvlistALL(GlistVO vo){
		return dao.rvListAll(vo);
	}
	
	public List<GlistVO> timeList(GlistVO gvo) {
		return dao.selectTime(gvo);
	}
	
}
