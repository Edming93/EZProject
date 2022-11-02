package com.sample.adminservice;


import java.util.List;

import org.springframework.stereotype.Service;

import com.sample.dao.AdminDAO;
import com.sample.vo.FieldReservationVO;
import com.sample.vo.GlistVO;
import com.sample.vo.UserVO;
@Service
public class AdminService {

	private AdminDAO dao;

	public AdminService(AdminDAO dao) {
		super();
		this.dao = dao;
	}

	public List<FieldReservationVO> allgame(){
		return dao.allgame();
	}
	
	public List<UserVO> alluser(){
		return dao.alluser();
	}
}
