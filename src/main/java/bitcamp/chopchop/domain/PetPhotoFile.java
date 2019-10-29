package bitcamp.chopchop.domain;

import java.sql.Date;

public class PetPhotoFile {

  private int photoNo;
  private String filePat;
  private Date createdDate;
  
  @Override
  public String toString() {
    return "PetPhotoFile [photoNo=" + photoNo + ", filePat=" + filePat + ", createdDate="
        + createdDate + "]";
  }
  public int getPhotoNo() {
    return photoNo;
  }
  public void setPhotoNo(int photoNo) {
    this.photoNo = photoNo;
  }
  public String getFilePat() {
    return filePat;
  }
  public void setFilePat(String filePat) {
    this.filePat = filePat;
  }
  public Date getCreatedDate() {
    return createdDate;
  }
  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }
}
