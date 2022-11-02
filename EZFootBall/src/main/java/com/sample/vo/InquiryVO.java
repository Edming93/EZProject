package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("inquiryVO")
public class InquiryVO {

	private int inquiryCode;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryState;
	private String createDate;
	private String answerDate;
	private int userCode;

	public int getInquiryCode() {
		return inquiryCode;
	}

	public void setInquiryCode(int inquiryCode) {
		this.inquiryCode = inquiryCode;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getInquiryState() {
		return inquiryState;
	}

	public void setInquiryState(String inquiryState) {
		this.inquiryState = inquiryState;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

}
