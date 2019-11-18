package bitcamp.chopchop.domain;

import java.sql.Date;
import java.util.List;

public class Cart {
  private int cartNo;
  private int memberNo;
  private int productNo;
  private int optionNo;
  private int quantity;
  private Product product;
  public Product getProduct() {
    return product;
  }

  public void setProduct(Product product) {
    this.product = product;
  }

  private Date createdDate;
  
  private List<PhotoFile> files;
  private List<CartProduct> cartProducts;

  public int getCartNo() {
    return cartNo;
  }

  public int getOptionNo() {
    return optionNo;
  }

  public void setOptionNo(int optionNo) {
    this.optionNo = optionNo;
  }

  public void setCartNo(int cartNo) {
    this.cartNo = cartNo;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public int getProductNo() {
    return productNo;
  }

  public void setProductNo(int productNo) {
    this.productNo = productNo;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }
  
  public List<PhotoFile> getFiles() {
    return files;
  }
  
  public void setFiles(List<PhotoFile> files) {
    this.files = files;
  }

  public List<CartProduct> getCartProducts() {
    return cartProducts;
  }

  public void setCartProducts(List<CartProduct> cartProducts) {
    this.cartProducts = cartProducts;
  }

  @Override
  public String toString() {
    return "Cart [cartNo=" + cartNo + ", memberNo=" + memberNo + ", productNo=" + productNo
        + ", optionNo=" + optionNo + ", quantity=" + quantity + ", createdDate=" + createdDate
        + ", files=" + files + ", cartProducts=" + cartProducts + "]";
  }
}
