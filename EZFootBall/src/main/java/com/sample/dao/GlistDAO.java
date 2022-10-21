package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.GlistVO;

@Mapper
public interface GlistDAO {
	
	public List<GlistVO> list(GlistVO vo);
	
	public GlistVO info(int num);
	
	public int subgame(int num);
	
	public int maxgame(int num);
	
}
