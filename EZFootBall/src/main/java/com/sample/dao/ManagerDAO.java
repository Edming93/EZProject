package com.sample.dao;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.ManagerVO;

@Mapper
public interface ManagerDAO {

	public ManagerVO isManager(int userCode);

	public void insertManager(ManagerVO vo);
}
