package bitcamp.chopchop.domain;

import java.util.List;

public class Product {
  private int productNo;
  private String title;
  private int price;
  private String detail;
  private int stock;
  private int discount;
  
  // 사진 파일 담을 list
  private List<PhotoFile> files;
  
  @Override
  public String toString() {
    return "Product [productNo=" + productNo + ", title=" + title + ", price=" + price + ", detail="
        + detail + ", stock=" + stock + ", discount=" + discount + "]";
  }

  public List<PhotoFile> getFiles() {
    return files;
  }

  public void setFiles(List<PhotoFile> files) {
    this.files = files;
  }

  public int getProductNo() {
    return productNo;
  }

  public void setProductNo(int productNo) {
    this.productNo = productNo;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public String getDetail() {
    return detail;
  }

  public void setDetail(String detail) {
    this.detail = detail;
  }

  public int getStock() {
    return stock;
  }

  public void setStock(int stock) {
    this.stock = stock;
  }

  public int getDiscount() {
    return discount;
  }

  public void setDiscount(int discount) {
    this.discount = discount;
  }



}
