package com.sample.service;


import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.BlacklistDAO;
import com.sample.dao.UserDAO;
import com.sample.vo.BlacklistPageVO;
import com.sample.vo.BlacklistVO;



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
	
	public boolean setBlackList(BlacklistVO vo) {
		return (blackDAO.insertBlackList(vo)>0)?true:false;
	}
	
	public boolean editBlackList(BlacklistVO vo) {
		return (blackDAO.updateBlackList(vo)>0)?true:false;
	}
	
	public boolean deleteBlackList(BlacklistVO vo) {
		return (blackDAO.deleteBlackList(vo)>0)?true:false;
	}
}
