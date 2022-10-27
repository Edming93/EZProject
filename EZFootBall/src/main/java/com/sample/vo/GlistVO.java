package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("GlistVO")
public class GlistVO {
	private int gameCode;
	private String gameType;
    private String gameName;
    private String gameDay;
    private String gameTime;
    private String level;
    private String gameMacth;
    private String gameGender;
    private String gamePlace;
    private String close;
    private int gameMinp;
    private int gameMaxp;
    private int gamePnum;
    private String gameMag;
    private String fieldName;
    private String fieldAddress;
    
    private int fieldCode;
    private String mTeamName;
    
    private int gamePay;
    
	
  	public int getGamePay() {
		return gamePay;
	}
	public void setGamePay(int gamePay) {
		this.gamePay = gamePay;
	}
	public String getmTeamName() {
  		return mTeamName;
  	}
  	public void setmTeamName(String mTeamName) {
  		this.mTeamName = mTeamName;
  	}
	public int getFieldCode() {
		return fieldCode;
	}
	public void setFieldCode(int fieldCode) {
		this.fieldCode = fieldCode;
	}
	public int getGameCode() {
		return gameCode;
	}
	public void setGameCode(int gameCode) {
		this.gameCode = gameCode;
	}
	public String getGameType() {
		return gameType;
	}
	public void setGameType(String gameType) {
		this.gameType = gameType;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
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
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getGameMacth() {
		return gameMacth;
	}
	public void setGameMacth(String gameMacth) {
		this.gameMacth = gameMacth;
	}
	public String getGameGender() {
		return gameGender;
	}
	public void setGameGender(String gameGender) {
		this.gameGender = gameGender;
	}
	public String getGamePlace() {
		return gamePlace;
	}
	public void setGamePlace(String gamePlace) {
		this.gamePlace = gamePlace;
	}
	public String getClose() {
		return close;
	}
	public void setClose(String close) {
		this.close = close;
	}
	public int getGameMinp() {
		return gameMinp;
	}
	public void setGameMinp(int gameMinp) {
		this.gameMinp = gameMinp;
	}
	public int getGameMaxp() {
		return gameMaxp;
	}
	public void setGameMaxp(int gameMaxp) {
		this.gameMaxp = gameMaxp;
	}
	public int getGamePnum() {
		return gamePnum;
	}
	public void setGamePnum(int gamePnum) {
		this.gamePnum = gamePnum;
	}
	public String getGameMag() {
		return gameMag;
	}
	public void setGameMag(String gameMag) {
		this.gameMag = gameMag;
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

    
	
	
}
