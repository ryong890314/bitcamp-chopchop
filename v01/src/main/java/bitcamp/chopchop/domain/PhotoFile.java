package bitcamp.chopchop.domain;

import java.io.Serializable;

public class PhotoFile implements Serializable {
  private static final long serialVersionUID = 1L;

  private int photoNo;
  private int productNo;
  private String filePath;

  public int getPhotoNo() {
    return photoNo;
  }

  public void setPhotoNo(int photoNo) {
    this.photoNo = photoNo;
  }

  public int getProductNo() {
    return productNo;
  }

  public void setProductNo(int productNo) {
    this.productNo = productNo;
  }

  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

  @Override
  public String toString() {
    return "PhotoFile [photoNo=" + photoNo + ", productNo=" + productNo + ", filePath=" + filePath
        + "]";
  }
  
}
