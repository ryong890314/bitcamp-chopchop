package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Recipe;

public interface RecipeDao {
  int insert(Recipe recipe) throws Exception;
  List<Recipe> findAll() throws Exception;
  Recipe findBy(int no) throws Exception;
  Recipe findWithIngredientBy(int no) throws Exception;
  Recipe findTotalBy(int no) throws Exception;
  int update(Recipe recipe) throws Exception;
  int delete(int no) throws Exception;
  int increaseViewCount(int no) throws Exception;
  List<Recipe> findByTag(String keyword) throws Exception;
  
  int increaseScrapCount(int no) throws Exception;
//  int updateRecipeLike(Recipe recipe) throws Exception;
}
