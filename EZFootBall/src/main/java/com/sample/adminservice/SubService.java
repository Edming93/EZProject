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
	
	public void sdelete(DataVO vo) {
		dao.sdelete(vo);
	}
	
	public void tdelete(DataVO vo) {
		System.out.println("서비스");
		System.out.println(vo.getGameCode());
		System.out.println(vo.getTeamCode());
		dao.tdelete(vo);
	}

}
