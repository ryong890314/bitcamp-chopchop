package bitcamp.chopchop.dao;

import bitcamp.chopchop.domain.RecipeLike;

public interface RecipeLikeDao {
  int insertRecipeLike(RecipeLike recipeLike) throws Exception;
  void deleteRecipeLike(RecipeLike recipeLike) throws Exception;
  int findRecipeLike(RecipeLike recipeLike) throws Exception;
}
