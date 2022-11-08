package com.sample.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.DataVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GameResultVO;
import com.sample.vo.GlistVO;

@Mapper
public interface GameDAO {

	public List<GlistVO> all(String gameType);
	
	public int count(String gameType);
	
	public List<GlistVO> numlist(GlistVO vo);
	
	public List<GlistVO> searchlist(GlistVO vo);
	
	public int sadd(GlistVO vo);

	public int tadd(GlistVO vo);
	
	public GameFieldInfoVO fieldinfo(int fieldCode);
	
	public int del(int gameCode);
	
	public int update(GlistVO vo);
	
	public int rdel (int resultCode);
	
	public int rup (GameResultVO vo);
	
	public int radd(GameResultVO vo);
	
	public List<Integer>teamlist(int teamCode);

}
