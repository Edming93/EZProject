package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.TlistVO;

@Mapper
public interface TeamDAO {
	
	public List<TlistVO> list(TlistVO vo);
	
	public TlistVO info(int num);
	
	public int subgame(int num);
	
	public int maxgame(int num);
	
}
