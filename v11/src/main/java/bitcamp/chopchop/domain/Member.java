package bitcamp.chopchop.domain;

import java.io.Serializable;
import java.util.List;

public class Member implements Serializable {
  private static final long serialVersionUID = 1L;

  private int memberNo;
  private String nickname;
  private String email;
  private String password;
  private String tel;
  private String photo;
  private String postNo;
  private String baseAddress;
  private String detailAddress;
  private int grade;
  private List<Member> members;
  
  
  
  public List<Member> getMembers() {
    return members;
  }
  public void setMembers(List<Member> members) {
    this.members = members;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public String getPhoto() {
    return photo;
  }
  public void setPhoto(String photo) {
    this.photo = photo;
  }
  public String getPostNo() {
    return postNo;
  }
  public void setPostNo(String postNo) {
    this.postNo = postNo;
  }
  public String getBaseAddress() {
    return baseAddress;
  }
  public void setBaseAddress(String baseAddress) {
    this.baseAddress = baseAddress;
  }
  public String getDetailAddress() {
    return detailAddress;
  }
  public void setDetailAddress(String detailAddress) {
    this.detailAddress = detailAddress;
  }
  public int getGrade() {
    return grade;
  }
  public void setGrade(int grade) {
    this.grade = grade;
  }
  
  
}
