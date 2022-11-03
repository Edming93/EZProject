package com.sample.dao;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.DataVO;

@Mapper
public interface SubDAO {

	public int delete(DataVO vo);
	
	public int rdelete(int rvCode);
	
	public int sdelete(DataVO vo);

	public int tdelete(DataVO vo);

}
