package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.BlacklistVO;
import com.sample.vo.BlacklistPageVO;

@Mapper
public interface BlacklistDAO {
	
	public int selectBBSCount();
	
	//페이지 VIEW
	public List<BlacklistVO> selectBlackList(BlacklistPageVO vo);
	
	//상세 페이지 view
	public BlacklistVO selectBlackListdetail(String blacklistCode);
	
	//게시판 insert
	public int insertBlackList(BlacklistVO vo);
	
	//게시판 update
	public int updateBlackList(BlacklistVO vo);
	
	//게시판 delete
	public int deleteBlackList(BlacklistVO vo);
}
