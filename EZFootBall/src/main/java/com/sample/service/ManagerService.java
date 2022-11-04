package com.sample.service;

import org.springframework.stereotype.Service;

import com.sample.dao.ManagerDAO;
import com.sample.vo.ManagerVO;

@Service
public class ManagerService {

	private ManagerDAO managerDAO;

	public ManagerService(ManagerDAO managerDAO) {
		super();
		this.managerDAO = managerDAO;
	}

	public ManagerVO isManager(int UserCode) {
		return managerDAO.isManager(UserCode);
	}

	public void insertManager(ManagerVO managerVO) {
		managerDAO.insertManager(managerVO);
	}
}
