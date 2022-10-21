package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sample.vo.GlistVO;

@Mapper
public interface GlistDAO {
	
	public List<GlistVO> list();
	public List<GlistVO> sociallisttrue(GlistVO vo);
	
	public List<GlistVO> sociallist(GlistVO vo);
	
}
