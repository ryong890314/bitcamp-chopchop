package bitcamp.chopchop.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Pet implements Serializable {
  private static final long serialVersionUID = 1L;

  private int petNo;
  private String name;
  private Date createdDate;
  private int registerNo;
  private int gender;
  private int age;
  private String photo;

  private List<Breed> breeds;
  
  public int getPetNo() {
    return petNo;
  }

  public void setPetNo(int petNo) {
    this.petNo = petNo;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }

  public int getRegisterNo() {
    return registerNo;
  }

  public void setRegisterNo(int registerNo) {
    this.registerNo = registerNo;
  }

  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }

  public int getGender() {
    return gender;
  }

  public void setGender(int gender) {
    this.gender = gender;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }

  public List<Breed> getBreeds() {
    return breeds;
  }

  public void setBreeds(List<Breed> breeds) {
    this.breeds = breeds;
  }
}
