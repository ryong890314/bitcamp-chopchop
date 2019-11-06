package bitcamp.chopchop.dao;

import java.util.HashMap;
import java.util.List;
import bitcamp.chopchop.domain.Cooking;

public interface CookingDao {
  int insert(Cooking cooking) throws Exception;
  List<Cooking> findAll(int recipeNo) throws Exception;
  int deleteAll(int no) throws Exception;
  int delete(HashMap<String,Object> hashMap) throws Exception;
  int update(Cooking cooking) throws Exception;
}
