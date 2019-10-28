package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.RRecipe;

// DAO 사용 규칙을 정의한다.
public interface RRecipeDao {
  int insert(RRecipe rrecipe) throws Exception;
  List<RRecipe> findAll() throws Exception;
  RRecipe findBy(int no) throws Exception;
  RRecipe findWithCommentBy (int no) throws Exception;
  int update(RRecipe rrecipe) throws Exception;
  int delete(int no) throws Exception;
  int increaseViewCount(int no) throws Exception;
}








