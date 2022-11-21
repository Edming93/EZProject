package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sample.vo.BlacklistPageVO;
import com.sample.vo.Criteria;
import com.sample.vo.ReviewCommentVO;
import com.sample.vo.ReviewPageVO;

@Mapper
public interface ReviewCommentDAO {
	public List<ReviewCommentVO> selectCommentList();
	
	public List<ReviewCommentVO> CommentList();
	
	public List<ReviewCommentVO> getCommentList(Criteria cri);
	
	public int getCommentListTotal(int reviewCode);	
	
	public int insertComment(ReviewCommentVO vo);
	
	public int updateComment(ReviewCommentVO vo);

	public int deleteComment(ReviewCommentVO vo);

	public ReviewCommentVO selectComment(ReviewCommentVO vo);
}
