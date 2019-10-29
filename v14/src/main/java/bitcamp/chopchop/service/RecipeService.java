package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Recipe;

public interface RecipeService {
  List<Recipe> list() throws Exception;
  Recipe get(int no) throws Exception;
  void insert(Recipe recipe) throws Exception;
  void update(Recipe recipe) throws Exception;
  void delete(int no) throws Exception;
  List<Recipe> search(String keyword) throws Exception;
  
  void insertRecipeLike(Recipe recipe) throws Exception;
  /*
  void insertRecipeLike(RecipeLike recipeLike, Recipe recipe) throws Exception;
  void deleteRecipeLike(RecipeLike recipeLike, Recipe recipe) throws Exception;
  int findRecipeLike(RecipeLike recipeLike) throws Exception;
  */
}

