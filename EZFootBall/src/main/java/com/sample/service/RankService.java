package com.sample.service;



import java.util.List;

import org.springframework.stereotype.Service;
import com.sample.dao.RankDAO;
import com.sample.vo.UinVO;
import com.sample.vo.UserVO;

@Service
public class RankService {
	
	private RankDAO dao;

	public RankService(RankDAO dao) {
		super();
		this.dao =dao;
	}
	
	public List<UserVO> rank(){
		return dao.rank();
	}
	
	public UinVO selevel(int userCode) {
		return dao.selevel(userCode);
	}
	
}
