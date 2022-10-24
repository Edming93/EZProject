package com.sample.vo;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

@Alias("commentVO")
public class ReviewCommentVO {
  private int id;
  private String userName;
  private String content;
  private String createDate;

  public String getCreateDate() {
    return createDate;
  }

  public void setCreateDate(String createDate) {
    this.createDate = createDate;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

@Override
public String toString() {
	return "ReviewCommentVO [id=" + id + ", userName=" + userName + ", content=" + content + ", createDate="
			+ createDate + "]";
}

  
  

}