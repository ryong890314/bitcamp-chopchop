package bitcamp.chopchop.domain;

import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Gallery implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int galleryNo;
  private int memberNo;
  private String content;
  private int viewCount;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date createdDate;

  @Override
  public String toString() {
    return "Gallery [galleryNo=" + galleryNo + ", memberNo=" + memberNo + ", content=" + content
        + ", viewCount=" + viewCount + ", createdDate=" + createdDate + "]";
  }

  public int getGalleryNo() {
    return galleryNo;
  }

  public void setGalleryNo(int galleryNo) {
    this.galleryNo = galleryNo;
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

  public int getViewCount() {
    return viewCount;
  }

  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }
  
}
