package com.sample.service;


import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.BlacklistDAO;
import com.sample.dao.UserDAO;
import com.sample.vo.BlacklistPageVO;



@Service
public class BlacklistService {
	
	private BlacklistDAO blackDAO;
	private UserDAO userDAO;

	public BlacklistService(BlacklistDAO blackDAO, UserDAO userDAO) {
		super();
		this.blackDAO = blackDAO;
		this.userDAO = userDAO;
	}

	public void getBlackList(Model model) {
		BlacklistPageVO vo = new BlacklistPageVO();
		vo.setStart(0);
		vo.setCntPerPage(15);
		model.addAttribute("list", blackDAO.selectBlackList(vo));
	}
	
	public void getBlackListContent(Model model, String blacklistCode) {
		model.addAttribute("BlacklistVO", blackDAO.selectBlackListdetail(blacklistCode));
	}
	
	

}