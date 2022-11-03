package com.sample.adminservice;


import org.springframework.stereotype.Service;

import com.sample.dao.SubDAO;
import com.sample.vo.DataVO;
@Service
public class SubService {

	private SubDAO dao;

	public SubService(SubDAO dao) {
		super();
		this.dao = dao;
	}
	
	public void delete(DataVO vo) {
		dao.delete(vo);
	}
	public void rdelete(int rvCode) {
		dao.rdelete(rvCode);
	}
	
	public void sdelete(DataVO vo) {
		dao.sdelete(vo);
	}
	
	public void tdelete(DataVO vo) {
		dao.tdelete(vo);
	}

}
