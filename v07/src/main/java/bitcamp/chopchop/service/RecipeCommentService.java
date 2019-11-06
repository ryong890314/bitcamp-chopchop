package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.RecipeComment;

public interface RecipeCommentService {
  List<RecipeComment> list() throws Exception;
  List<RecipeComment> get(int no) throws Exception;
  void insert(RecipeComment recipeComment) throws Exception;
  void update(RecipeComment recipeComment) throws Exception;
  void delete(int no) throws Exception;
}
