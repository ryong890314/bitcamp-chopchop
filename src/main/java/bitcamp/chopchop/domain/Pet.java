package bitcamp.chopchop.domain;

import java.io.Serializable;
import java.sql.Date;

public class Pet implements Serializable {
  private static final long serialVersionUID = 1L;

  private int petNo;
  private String name;
  private Date createdDate;
  private int registerNo;
  private String photo;
  private int gender;
  private int age;

  private int breedNo;
  private String breed;
  
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

  public int getBreedNo() {
    return breedNo;
  }

  public void setBreedNo(int breedNo) {
    this.breedNo = breedNo;
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

  public String getBreed() {
    return breed;
  }

  public void setBreed(String breed) {
    this.breed = breed;
  }
}
