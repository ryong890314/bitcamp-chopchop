package bitcamp.chopchop.domain;

import java.sql.Date;
import java.util.List;

public class Order {
  private int orderNo;
  private int memberNo;
  private String postNo;
  private String address;
  private String detailAddress;
  private Date paymentDate;
  private String paymentMethod;
  private String shipDate; // (주문 상태)
  private String invoice;
  private List<OrderProduct> orderProducts;
  private List<Member> members;

  @Override
  public String toString() {
    return "Order [orderNo=" + orderNo + ", memberNo=" + memberNo + ", postNo=" + postNo
        + ", address=" + address + ", detailAddress=" + detailAddress + ", paymentDate="
        + paymentDate + ", paymentMethod=" + paymentMethod + ", shipDate=" + shipDate + ", invoice="
        + invoice + ", orderProducts=" + orderProducts + ", members=" + members + "]";
  }

  public int getOrderNo() {
    return orderNo;
  }

  public void setOrderNo(int orderNo) {
    this.orderNo = orderNo;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public String getPostNo() {
    return postNo;
  }

  public void setPostNo(String postNo) {
    this.postNo = postNo;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getDetailAddress() {
    return detailAddress;
  }

  public void setDetailAddress(String detailAddress) {
    this.detailAddress = detailAddress;
  }

  public Date getPaymentDate() {
    return paymentDate;
  }

  public void setPaymentDate(Date paymentDate) {
    this.paymentDate = paymentDate;
  }

  public String getPaymentMethod() {
    return paymentMethod;
  }

  public void setPaymentMethod(String paymentMethod) {
    this.paymentMethod = paymentMethod;
  }

  public String getShipDate() {
    return shipDate;
  }

  public void setShipDate(String shipDate) {
    this.shipDate = shipDate;
  }

  public String getInvoice() {
    return invoice;
  }

  public void setInvoice(String invoice) {
    this.invoice = invoice;
  }

  public List<OrderProduct> getOrderProducts() {
    return orderProducts;
  }

  public void setOrderProducts(List<OrderProduct> orderProducts) {
    this.orderProducts = orderProducts;
  }

  public List<Member> getMembers() {
    return members;
  }

  public void setMembers(List<Member> members) {
    this.members = members;
  }



}
