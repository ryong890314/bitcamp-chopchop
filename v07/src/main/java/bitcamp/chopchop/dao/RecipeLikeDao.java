package bitcamp.chopchop.dao;

import bitcamp.chopchop.domain.RecipeLike;

public interface RecipeLikeDao {
  int insertLike(RecipeLike recipeLike) throws Exception;
  int findLike(RecipeLike recipeLike) throws Exception;
  void deleteLike(RecipeLike recipeLike) throws Exception;
  int deleteAll(int recipeNo) throws Exception;
}
