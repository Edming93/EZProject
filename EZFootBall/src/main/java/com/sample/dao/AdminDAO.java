package com.sample.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.FieldReservationVO;
import com.sample.vo.GlistVO;
import com.sample.vo.UserVO;


@Mapper
public interface AdminDAO {

	public List<FieldReservationVO> allgame();
	public List<UserVO> alluser();
	
	public List<FieldReservationVO> Tgame();
	
	public List<FieldReservationVO> joinList();
}
