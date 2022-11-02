package com.sample.adminservice;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
	
	public List<FieldReservationVO> Tgame(){
		return dao.Tgame();
	}
	
	public List<FieldReservationVO> joinList(){
		return dao.joinList();
	}

	public void joinList1(FieldReservationVO vo,Model model) {
		
		model.addAttribute("team", dao.joinList1(vo));
	}
}
