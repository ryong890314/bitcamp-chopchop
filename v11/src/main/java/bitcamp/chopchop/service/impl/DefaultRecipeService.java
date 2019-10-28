package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.chopchop.dao.RecipeCommentDao;
import bitcamp.chopchop.dao.RecipeDao;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.service.RecipeService;

// RecipeService 기본 구현체 
//
@Service
public class DefaultRecipeService implements RecipeService {

  @Resource
  private RecipeDao recipeDao;
  @Resource
  private RecipeCommentDao recipeCommentDao; 

  
  @Override
  public void insert(Recipe recipe) throws Exception {
    recipeDao.insert(recipe);
  }
  
  @Transactional
  @Override
  public void delete(int no) throws Exception {
    if (recipeDao.findBy(no) == null) {
      throw new Exception("해당 데이터가 없습니다.");
    }
    recipeCommentDao.delete(no);
    recipeDao.delete(no);
    
    
  }
  

  @Override
  public Recipe get(int no) throws Exception {
    Recipe recipe = recipeDao.findWithCommentBy(no);
    if (recipe == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    } 
    recipeDao.increaseViewCount(no);
    return recipe;
  }

  @Override
  public List<Recipe> list() throws Exception {
    return recipeDao.findAll();
  }

  
  @Override
  public void update(Recipe recipe) throws Exception {
    recipeDao.update(recipe);
  }
  
}
