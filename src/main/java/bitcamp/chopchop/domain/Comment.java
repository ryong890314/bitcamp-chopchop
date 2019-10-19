package bitcamp.chopchop.domain;

import java.sql.Date;

public class Comment {

  private int commentNo;
  private int productNo;
  private int memberNo;
  private String title;
  private String content;
  private Date createdDate;

  public int getCommentNo() {
    return commentNo;
  }

  public void setCommentNo(int commentNo) {
    this.commentNo = commentNo;
  }

  public int getProductNo() {
    return productNo;
  }

  public void setProductNo(int productNo) {
    this.productNo = productNo;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }



}
