package com.sample.service;

import org.springframework.stereotype.Service;

import com.sample.dao.InquiryDAO;

@Service
public class InquiryService {

	private InquiryDAO inquiryDAO;

	public InquiryService(InquiryDAO inquiryDAO) {
		super();
		this.inquiryDAO = inquiryDAO;
	}

}
