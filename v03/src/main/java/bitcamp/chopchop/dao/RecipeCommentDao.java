package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.RecipeComment;

// DAO 사용 규칙을 정의한다.
public interface RecipeCommentDao {
  int insert(RecipeComment recipecomment) throws Exception;
  List<RecipeComment> findAll() throws Exception;
  RecipeComment findBy(int no) throws Exception;
  RecipeComment findWithMemberBy (int no) throws Exception;
  int update(RecipeComment recipecomment) throws Exception;
  int delete(int no) throws Exception;
  int deleteAll(int no) throws Exception;
}








