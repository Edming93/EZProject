package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("BlacklistVO")
public class BlacklistVO {
	private int blacklistCode;
	private String userId;
	private String userName;
	private int userCode;
	private String blacklistTitle;
	private String blacklistContent;
	private String blacklistCreateDate;
	private String blacklistLocal;
	private int isDelete;
	
	public int getBlacklistCode() {
		return blacklistCode;
	}
	public void setBlacklistCode(int blacklistCode) {
		this.blacklistCode = blacklistCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBlacklistTitle() {
		return blacklistTitle;
	}
	public void setBlacklistTitle(String blacklistTitle) {
		this.blacklistTitle = blacklistTitle;
	}
	public String getBlacklistContent() {
		return blacklistContent;
	}
	public void setBlacklistContent(String blacklistContent) {
		this.blacklistContent = blacklistContent;
	}
	public String getBlacklistCreateDate() {
		return blacklistCreateDate;
	}
	public void setBlacklistCreateDate(String blacklistCreateDate) {
		this.blacklistCreateDate = blacklistCreateDate;
	}
	public String getBlacklistLocal() {
		return blacklistLocal;
	}
	public void setBlacklistLocal(String blacklistLocal) {
		this.blacklistLocal = blacklistLocal;
	}
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	

}
