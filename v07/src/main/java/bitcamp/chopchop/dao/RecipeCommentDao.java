package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.RecipeComment;

public interface RecipeCommentDao {
  List<RecipeComment> findAll() throws Exception;
  List<RecipeComment> findBy(int no) throws Exception;
  int insert(RecipeComment recipeComment) throws Exception;
  int update(RecipeComment recipeComment) throws Exception;
  int delete(int no) throws Exception;
}
