package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.RecentVO;
import com.sample.vo.SearchVO;

@Mapper
public interface SearchDAO {
	public List<SearchVO> selectAll();

	public SearchVO selectNum(int id);

	public SearchVO selectScout(SearchVO vo);

	public List<RecentVO> selectRecentList();

	public int insertRecent(RecentVO vo);

	public int deleteRecent(RecentVO vo);
}
