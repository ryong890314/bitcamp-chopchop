package bitcamp.chopchop.domain;

import java.io.Serializable;
import java.sql.Date;

//레시피 댓글
public class RecipeComment implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int commentNo;
  private int recipeNo;
  private int memberNo;
  private String content;
  private Date createdDate;
  
  public int getCommentNo() {
    return commentNo;
  }
  public void setCommentNo(int commentNo) {
    this.commentNo = commentNo;
  }
  public int getRecipeNo() {
    return recipeNo;
  }
  public void setRecipeNo(int recipeNo) {
    this.recipeNo = recipeNo;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
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

