package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.ManagerVO;
import com.sample.vo.UserVO;

@Mapper
public interface ManagerDAO {

	public ManagerVO isManager(int userCode);

	public void insertManager(ManagerVO vo);

	public List<ManagerVO> managerHistoryList(ManagerVO vo);

	public void managerAdd(int mgrCode);

	public void managerFail(int mgrCode);

	public List<UserVO> getManagerList();
}
