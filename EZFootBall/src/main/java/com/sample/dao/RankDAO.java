package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.sample.vo.DataVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;
import com.sample.vo.SjoinVO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Mapper
public interface RankDAO {
	
	public List<UserVO> rank();
	
}