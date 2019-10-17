package bitcamp.chopchop.domain;

public class Product {
  
 int no;
 String title;
 int price;
 String detail;
 int stock;
 int discount;
  
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

  @Override
  public String toString() {
    return "Product [detail=" + detail + ", discount=" + discount + ", no=" + no + ", price=" + price + ", stock="
        + stock + ", title=" + title + "]";
  }
  
}
