package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.UserVO;

@Mapper
public interface UserDAO {
	public UserVO idPwCheck(UserVO vo);
	
	public String userId(String id);
	
	public void insertUser(UserVO vo);
	
	public List<UserVO> userIdList();
}
