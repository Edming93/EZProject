package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("GlistVO")
public class GlistVO {
    private int gameCode;
    private String gameName;
    private String gameDay;
    private String gameTime;
    private String level;
    private String gameGender;
    private String gamePlace;
    private String close;
    private String gamePnum;
    private String gameMag;
    private String filedName;
    private String filedAddress;
    
	public String getGamePnum() {
        return gamePnum;
    }
    public void setGamePnum(String gamePnum) {
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
    public int getGameCode() {
		return gameCode;
	}
	public void setGameCode(int gameCode) {
		this.gameCode = gameCode;
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
    
	
}
