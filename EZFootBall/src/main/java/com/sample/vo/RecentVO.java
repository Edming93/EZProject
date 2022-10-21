package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("recentVO")
public class RecentVO {
	private int searchNum;
	private String searchData;

	public int getSearchNum() {
		return searchNum;
	}

	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}

	public String getSearchData() {
		return searchData;
	}

	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}

}
