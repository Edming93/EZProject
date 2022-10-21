package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("UserVO")
public class UserVO {
	private int userCode;
	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private String userBirth;
	private String userGender;
	private String userLocal;
	private String userDistrict;
	private String userAddress;
	private String userEmail1;
	private String userEmail2;
	
	private String userBirthYear;
	private String userBirthMonth;
	private String userBirthDay;
	
	private String userAddress1;
	private String userAddress2;

	public static final long serialKey = 1231254653L;
	
	
	
	
	
	public String getUserAddress1() {
		return userAddress1;
	}


	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}


	public String getUserAddress2() {
		return userAddress2;
	}


	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}


	public String getUserAddress() {
		return userAddress;
	}


	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}


	public static long getSerialkey() {
		return serialKey;
	}


	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getUserPw() {
		return userPw;
	}



	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserPhone() {
		return userPhone;
	}



	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}



	public String getUserBirth() {
		return userBirth;
	}



	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}



	public String getUserGender() {
		return userGender;
	}



	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}



	public String getUserBirthYear() {
		return userBirthYear;
	}



	public void setUserBirthYear(String userBirthYear) {
		this.userBirthYear = userBirthYear;
	}



	public String getUserBirthMonth() {
		return userBirthMonth;
	}



	public void setUserBirthMonth(String userBirthMonth) {
		this.userBirthMonth = userBirthMonth;
	}



	public String getUserBirthDay() {
		return userBirthDay;
	}



	public void setUserBirthDay(String userBirthDay) {
		this.userBirthDay = userBirthDay;
	}


	public String getUserLocal() {
		return userLocal;
	}


	public void setUserLocal(String userLocal) {
		this.userLocal = userLocal;
	}


	public String getUserDistrict() {
		return userDistrict;
	}


	public void setUserDistrict(String userDistrict) {
		this.userDistrict = userDistrict;
	}


	public String getUserEmail1() {
		return userEmail1;
	}


	public void setUserEmail1(String userEmail1) {
		this.userEmail1 = userEmail1;
	}


	public String getUserEmail2() {
		return userEmail2;
	}


	public void setUserEmail2(String userEmail2) {
		this.userEmail2 = userEmail2;
	}






	
	
	
	
}
