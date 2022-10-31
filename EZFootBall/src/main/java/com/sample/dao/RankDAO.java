package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Mapper
public interface RankDAO {
	
	public List<UserVO> rank();
	
	public UinVO selevel(int userCode);
	
}
