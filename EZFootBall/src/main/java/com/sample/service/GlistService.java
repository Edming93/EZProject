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
		this.dao = dao;
	}
	
	public void list(Model model) {
		model.addAttribute("list",dao.list());
	}
	
	public void sociallisttrue(Model model,GlistVO vo) {
	    model.addAttribute("list", dao.sociallisttrue(vo));
	}
	
	public List<GlistVO> sociallist(GlistVO vo) {
	    return dao.sociallist(vo);
	}
	
	
	
	
}
