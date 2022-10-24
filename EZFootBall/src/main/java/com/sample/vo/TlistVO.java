package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("TlistVO")
public class TlistVO {
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
    private String filedName;
    private String filedAddress;
    
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
	public String getFiledName() {
		return filedName;
	}
	public void setFiledName(String filedName) {
		this.filedName = filedName;
	}
	public String getFiledAddress() {
		return filedAddress;
	}
	public void setFiledAddress(String filedAddress) {
		this.filedAddress = filedAddress;
	}
    
	
	
}
