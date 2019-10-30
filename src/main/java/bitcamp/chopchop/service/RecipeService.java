package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.domain.RecipeLike;

public interface RecipeService {
  List<Recipe> list() throws Exception;
  Recipe get(int no) throws Exception;
  void insert(Recipe recipe) throws Exception;
  void update(Recipe recipe) throws Exception;
  void delete(int no) throws Exception;
  List<Recipe> search(String keyword) throws Exception;
  
  void insertLike(RecipeLike recipeLike) throws Exception;
  void deleteLike(RecipeLike recipeLike) throws Exception;
  int findLike(RecipeLike recipeLike) throws Exception;
//  int likeCheck(RecipeLike recipeLike) throws Exception;
}

