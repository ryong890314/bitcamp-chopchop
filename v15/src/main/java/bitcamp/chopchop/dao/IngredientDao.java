package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Ingredient;

public interface IngredientDao {
  int insert(Ingredient ingredient) throws Exception;
  List<Ingredient> findAll(int recipeNo) throws Exception;
  int delete(int no) throws Exception;
  
}
