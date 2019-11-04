package bitcamp.chopchop.domain;

public class OrderProduct {

  private int orderNo;
  private int productNo;
  private int quantity;
  private int discountPrice;
  private int optionNo;

  @Override
  public String toString() {
    return "OrderProduct [orderNo=" + orderNo + ", productNo=" + productNo + ", quantity="
        + quantity + ", discountPrice=" + discountPrice + ", optionNo=" + optionNo + "]";
  }

  public int getOrderNo() {
    return orderNo;
  }

  public void setOrderNo(int orderNo) {
    this.orderNo = orderNo;
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

  public int getDiscountPrice() {
    return discountPrice;
  }

  public void setDiscountPrice(int discountPrice) {
    this.discountPrice = discountPrice;
  }

  public int getOptionNo() {
    return optionNo;
  }

  public void setOptionNo(int optionNo) {
    this.optionNo = optionNo;
  }



}
