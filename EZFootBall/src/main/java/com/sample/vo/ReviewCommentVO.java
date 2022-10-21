package com.sample.vo;

import org.apache.ibatis.type.Alias;

@Alias("commentVO")
public class ReviewCommentVO {
  private int id;
  private String owner;
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

  public String getOwner() {
    return owner;
  }

  public void setOwner(String owner) {
    this.owner = owner;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

@Override
public String toString() {
	return "CommentVO [id=" + id + ", owner=" + owner + ", content=" + content + ", createDate=" + createDate + "]";
}
  
  

}