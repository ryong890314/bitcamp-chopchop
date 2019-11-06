package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.RecipeCommentDao;
import bitcamp.chopchop.domain.RecipeComment;
import bitcamp.chopchop.service.RecipeCommentService;

@Service
public class DefaultRecipeCommentService implements RecipeCommentService {
  @Resource private RecipeCommentDao recipeCommentDao;

  @Override
  public List<RecipeComment> list() throws Exception {
    return recipeCommentDao.findAll();
  }

  @Override
  public List<RecipeComment> get(int no) throws Exception {
    return recipeCommentDao.findBy(no);
  }

  @Override
  public void insert(RecipeComment recipeComment) throws Exception {
    recipeCommentDao.insert(recipeComment);
    
  }

  @Override
  public void update(RecipeComment recipeComment) throws Exception {
    recipeCommentDao.update(recipeComment);
  }

  @Override
  public void delete(int no) throws Exception {
    if (recipeCommentDao.delete(no) == 0) {
     throw new Exception("해당 데이터가 없습니다.");
    }
  }
}
