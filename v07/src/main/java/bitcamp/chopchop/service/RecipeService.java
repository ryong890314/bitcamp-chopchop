package bitcamp.chopchop.service;

import java.util.HashMap;
import java.util.List;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.domain.RecipeLike;

public interface RecipeService {
  List<Recipe> list() throws Exception; // 전체 조회
  List<Recipe> listSort(String column) throws Exception; // 정렬해서 조회
  
  Recipe get(int no) throws Exception;
  void insert(Recipe recipe) throws Exception;
  void update(Recipe recipe) throws Exception;
  void deleteFile(HashMap<String,Object> hashMap) throws Exception;
  void delete(int no) throws Exception;
  List<Recipe> search(String keyword) throws Exception; 
  
  void insertLike(RecipeLike recipeLike) throws Exception; // 좋아요 
  void deleteLike(RecipeLike recipeLike) throws Exception; // 좋아요 취소
  int findLike(RecipeLike recipeLike) throws Exception; // 좋아요 했는지 확인 
}

