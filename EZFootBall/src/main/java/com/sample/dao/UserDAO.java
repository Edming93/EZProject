package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Mapper
public interface UserDAO {
	public UserVO idPwCheck(UserVO vo);

	public String userId(String id);

	public void insertUser(UserVO vo);

	public List<UserVO> userIdList();

	public void insertGameStat(UserVO vo);

	// ID/PW 찾기 사용
	public UserVO searchUser1(UserVO vo);

	public UserVO searchUser2(UserVO vo);

	public void newPassword(UserVO vo);

	// 정욱 팀 등록시 사용
	public List<UserVO> getUserList(UserVO vo);

	// 유저 레벨, 승률 조회 사용
	public UinVO getUserAbil(int userCode);
}
