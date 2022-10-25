package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;

@Mapper
public interface RentalDAO {

	public List<GlistVO> rvListAll(GlistVO vo);
	public List<GlistVO> selectTime(GlistVO vo);
	public GameFieldInfoVO fieldInfo(String fieldCode);
}
