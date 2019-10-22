package bitcamp.chopchop.domain;

public class Cooking {
  
  private int no;
  private int recipeNo;
  private int processNo;
  private String filePath;
  private String content;
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getRecipeNo() {
    return recipeNo;
  }
  public void setRecipeNo(int recipeNo) {
    this.recipeNo = recipeNo;
  }
  public int getProcessNo() {
    return processNo;
  }
  public void setProcessNo(int processNo) {
    this.processNo = processNo;
  }
  public String getFilePath() {
    return filePath;
  }
  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  
}