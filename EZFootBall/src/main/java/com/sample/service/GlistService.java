package com.sample.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.GlistDAO;
import com.sample.vo.GlistVO;

@Service
public class GlistService {
	
	private GlistDAO dao;

	public GlistService(GlistDAO dao) {
		super();
		this.dao =dao;
	}
	
	public List<GlistVO> list(Model model,GlistVO vo) {
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
	
	
	
}
