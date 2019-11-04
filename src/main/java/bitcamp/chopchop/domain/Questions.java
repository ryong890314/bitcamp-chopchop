package bitcamp.chopchop.domain;

import java.sql.Date;

public class Questions {
  private int no;
  private String name;
  private String email;
  private String title;
  private String contents;
  private Date enterDate;
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public Date getEnterDate() {
    return enterDate;
  }
  public void setEnterDate(Date enterDate) {
    this.enterDate = enterDate;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
}
