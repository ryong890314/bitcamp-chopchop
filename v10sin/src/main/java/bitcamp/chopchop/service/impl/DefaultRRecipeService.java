package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.chopchop.dao.RRecipeDao;
import bitcamp.chopchop.dao.RecipeCommentDao;
import bitcamp.chopchop.domain.RRecipe;
import bitcamp.chopchop.service.RRecipeService;

// RRecipeService 기본 구현체 
//
@Service
public class DefaultRRecipeService implements RRecipeService {

  @Resource
  private RRecipeDao rrecipeDao;
  @Resource
  private RecipeCommentDao recipeCommentDao; 

  
  @Override
  public void insert(RRecipe rrecipe) throws Exception {
    rrecipeDao.insert(rrecipe);
  }
  
  @Transactional
  @Override
  public void delete(int no) throws Exception {
    if (rrecipeDao.findBy(no) == null) {
      throw new Exception("해당 데이터가 없습니다.");
    }
    recipeCommentDao.delete(no);
    rrecipeDao.delete(no);
    
    
  }
  

  @Override
  public RRecipe get(int no) throws Exception {
    RRecipe rrecipe = rrecipeDao.findWithCommentBy(no);
    if (rrecipe == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    } 
    rrecipeDao.increaseViewCount(no);
    return rrecipe;
  }

  @Override
  public List<RRecipe> list() throws Exception {
    return rrecipeDao.findAll();
  }

  
  @Override
  public void update(RRecipe rrecipe) throws Exception {
    rrecipeDao.update(rrecipe);
  }
  
}
