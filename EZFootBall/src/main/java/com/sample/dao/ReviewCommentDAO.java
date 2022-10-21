package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.ReviewCommentVO;


@Mapper
public interface ReviewCommentDAO {
	public List<ReviewCommentVO> selectCommentList();
	
	public int insertComment(ReviewCommentVO vo);
	
	public int updateComment(ReviewCommentVO vo);

	public int deleteComment(ReviewCommentVO vo);

	public ReviewCommentVO selectComment(ReviewCommentVO vo);
}
