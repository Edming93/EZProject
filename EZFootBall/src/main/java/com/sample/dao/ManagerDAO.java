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

	public List<ManagerVO> managerHistoryList2(ManagerVO vo);

	public void managerAdd(int mgrCode);

	public void managerFail(int mgrCode);

	public List<UserVO> getManagerList();

	public void managerAdd2(UserVO vo);

	public void managerDelete(int userCode);

	public void isManagerHistory(int userCode);
}
