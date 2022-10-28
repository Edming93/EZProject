package com.sample.vo;

public class FieldReservationVO {
	private int rvCode;
	private String rvType;
	private String rvDay;

	private int fieldCode;
	private String fieldName;
	private String fieldAddress;
	private String fieldType;
	private int fieldRentalfee;

	private int userCode;
	private int userPayment;

	private String gameDay;
	private String gameTime;

	// 시간 변환
	private String gameTime1;
	private String gameTime2;

	public String getGameTime1() {
		return gameTime1;
	}

	public void setGameTime1(String gameTime1) {
		this.gameTime1 = gameTime1;
	}

	public String getGameTime2() {
		return gameTime2;
	}

	public void setGameTime2(String gameTime2) {
		this.gameTime2 = gameTime2;
	}

	public int getRvCode() {
		return rvCode;
	}

	public void setRvCode(int rvCode) {
		this.rvCode = rvCode;
	}

	public String getRvType() {
		return rvType;
	}

	public void setRvType(String rvType) {
		this.rvType = rvType;
	}

	public String getRvDay() {
		return rvDay;
	}

	public void setRvDay(String rvDay) {
		this.rvDay = rvDay;
	}

	public int getFieldCode() {
		return fieldCode;
	}

	public void setFieldCode(int fieldCode) {
		this.fieldCode = fieldCode;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFieldAddress() {
		return fieldAddress;
	}

	public void setFieldAddress(String fieldAddress) {
		this.fieldAddress = fieldAddress;
	}

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public int getFieldRentalfee() {
		return fieldRentalfee;
	}

	public void setFieldRentalfee(int fieldRentalfee) {
		this.fieldRentalfee = fieldRentalfee;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getUserPayment() {
		return userPayment;
	}

	public void setUserPayment(int userPayment) {
		this.userPayment = userPayment;
	}

	public String getGameDay() {
		return gameDay;
	}

	public void setGameDay(String gameDay) {
		this.gameDay = gameDay;
	}

	public String getGameTime() {
		return gameTime;
	}

	public void setGameTime(String gameTime) {
		this.gameTime = gameTime;
	}

}
