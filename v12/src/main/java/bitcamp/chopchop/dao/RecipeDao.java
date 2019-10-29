package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Recipe;

// DAO 사용 규칙을 정의한다.
public interface RecipeDao {
  int insert(Recipe recipe) throws Exception;
  List<Recipe> findAll() throws Exception;
  Recipe findBy(int no) throws Exception;
  Recipe findWithCommentBy (int no) throws Exception;
  int update(Recipe recipe) throws Exception;
  int delete(int no) throws Exception;
  int increaseViewCount(int no) throws Exception;
}








