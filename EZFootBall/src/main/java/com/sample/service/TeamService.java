package com.sample.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.TeamDAO;
import com.sample.vo.DataVO;
import com.sample.vo.TlistVO;
import com.sample.vo.UinVO;

@Service
public class TeamService {
	
	private TeamDAO dao;

	public TeamService(TeamDAO dao) {
		super();
		this.dao =dao;
	}
	
	public List<TlistVO> list(Model model,TlistVO vo) {
		return dao.list(vo);
		//model.addAttribute("list", vo);
	}
	
	public void info(int num,Model model) {
		model.addAttribute("matchinfo", dao.info(num));
	}
	
	public void subgame(int num) {
		dao.subgame(num);
	}
	public void maxgame(int num) {
		dao.maxgame(num);
	}
	public void setslist(DataVO vo) {
		dao.setslist(vo);
	}
	
	public UinVO abil(int usercode, HttpSession session) {
		session.setAttribute("urabil",dao.abile(usercode));
		return dao.abile(usercode);
	}
	
	
}
