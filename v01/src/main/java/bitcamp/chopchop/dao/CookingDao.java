package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Cooking;

public interface CookingDao {
  int insert(Cooking cooking) throws Exception;
  List<Cooking> findAll(int recipeNo) throws Exception;
  int delete(int no) throws Exception;
}
