package com.sample.adminservice;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sample.dao.ReviewCommentDAO;
import com.sample.vo.BlacklistPageVO;
import com.sample.vo.ReviewCommentVO;

@Service
public class ComunityAdminService {

	private ReviewCommentDAO reviewCommentDAO;

	public ComunityAdminService(ReviewCommentDAO reviewCommentDAO) {
		super();
		this.reviewCommentDAO = reviewCommentDAO;
	}

	
	public List<ReviewCommentVO> getCommentList(){
		return reviewCommentDAO.CommentList();
	}
	
	
}
