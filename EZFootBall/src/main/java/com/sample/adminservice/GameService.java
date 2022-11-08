package com.sample.adminservice;


import java.util.List;

import org.springframework.stereotype.Service;

import com.sample.dao.GameDAO;
import com.sample.dao.SubDAO;
import com.sample.vo.DataVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GameResultVO;
import com.sample.vo.GlistVO;
@Service
public class GameService {

	private GameDAO dao;

	public GameService(GameDAO dao) {
		super();
		this.dao = dao;
	}

	public List<GlistVO> all(String gameType) {
		return dao.all(gameType);
	}

	public int count(String gameType) {
		return dao.count(gameType);
	}
	
	public List<GlistVO> numlist(GlistVO vo){
		return dao.numlist(vo);
	}
	
	public List<GlistVO> searchlist(GlistVO vo){
		return dao.searchlist(vo);
	}
	
	public void sadd(GlistVO vo) {
		dao.sadd(vo);
	}
	
	public void tadd(GlistVO vo) {
		dao.tadd(vo);
	}
	
	public GameFieldInfoVO fieldinfo(int fieldCode){
		return dao.fieldinfo(fieldCode);
	}
	
	public void del(int gameCode) {
		dao.del(gameCode);
	}
	
	public void update(GlistVO vo) {
		dao.update(vo);
	}
	
	public void rdel(int resultCode) {
		dao.rdel(resultCode);
	}
	
	public void radd(GameResultVO vo) {
		dao.radd(vo);
	}
	
	public void rup(GameResultVO vo) {
		dao.rup(vo);
	}
	
	public List<Integer> teamlist (int teamCode) {
		return dao.teamlist(teamCode);
	}
}