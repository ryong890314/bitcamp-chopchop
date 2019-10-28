package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.RRecipe;

public interface RRecipeService {
  List<RRecipe> list() throws Exception;
  RRecipe get(int no) throws Exception;
  void insert(RRecipe rrecipe) throws Exception;
  void update(RRecipe rrecipe) throws Exception;
  void delete(int no) throws Exception;
}










