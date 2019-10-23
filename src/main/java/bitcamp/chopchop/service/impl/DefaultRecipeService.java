package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.chopchop.dao.CookingDao;
import bitcamp.chopchop.dao.IngredientDao;
import bitcamp.chopchop.dao.RecipeDao;
import bitcamp.chopchop.dao.RecipeLikeDao;
import bitcamp.chopchop.domain.Cooking;
import bitcamp.chopchop.domain.Ingredient;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.domain.RecipeLike;
import bitcamp.chopchop.service.RecipeService;

@Service
public class DefaultRecipeService implements RecipeService {
  @Resource private RecipeDao recipeDao;
  @Resource private IngredientDao ingredientDao;
  @Resource private CookingDao cookingDao;
  @Resource private RecipeLikeDao recipeLikeDao;

  @Transactional
  @Override
  public void insert(Recipe recipe) throws Exception {
    if (recipe.getIngredients().size() == 0 || recipe.getCookings().size() == 0) {
      throw new Exception("내용을 입력해주세요");
    }
    
    recipeDao.insert(recipe);
    for (Ingredient i : recipe.getIngredients()) {
      i.setRecipeNo(recipe.getRecipeNo());
      ingredientDao.insert(i);
    }
    
    for (Cooking c : recipe.getCookings()) {
      c.setRecipeNo(recipe.getRecipeNo());
      cookingDao.insert(c);
    }
  }
  
  @Override
  public Recipe get(int no) throws Exception {
    Recipe recipe = recipeDao.findTotalBy(no);
    if (recipe == null) {
      throw new Exception("데이터가 없습니다!");
    }
    recipeDao.increaseViewCount(no);
    return recipe;
  }

  @Override
  public List<Recipe> list() throws Exception {
    return recipeDao.findAll();
  }
  
  @Transactional
  @Override
  public void delete(int no) throws Exception {
    if (recipeDao.findBy(no) == null) {
      throw new Exception("데이터가 없습니다.");
    }
    cookingDao.delete(no);
    ingredientDao.delete(no);
    recipeDao.delete(no);
  }
  

  @Override
  public List<Recipe> search(String keyword) throws Exception {
    return recipeDao.findByTag(keyword);
  }

  @Transactional
  @Override
  public void update(Recipe recipe) throws Exception {
    if (recipe.getIngredients().size() == 0) {
      throw new Exception("재료 입력해주세요");
    }
    
    cookingDao.delete(recipe.getRecipeNo());
    ingredientDao.delete(recipe.getRecipeNo());
    recipeDao.update(recipe);
    for (Ingredient i : recipe.getIngredients()) {
      i.setRecipeNo(recipe.getRecipeNo());
      ingredientDao.insert(i);
    }
    for (Cooking c : recipe.getCookings()) {
      c.setRecipeNo(recipe.getRecipeNo());
      cookingDao.insert(c);
    }
    
  }
  
  @Transactional
  @Override
  public void insertRecipeLike(Recipe recipe) throws Exception {
    recipeDao.increaseScrapCount(recipe.getRecipeNo());
    
    for (RecipeLike rl : recipe.getRecipeLikes()) {
      rl.setRecipeNo(recipe.getRecipeNo());
      rl.setMemberNo(recipe.getMemberNo());
      System.out.println("-------------------------------------");
      System.out.println(recipe.getRecipeNo());
      recipeLikeDao.insertRecipeLike(rl);
    }
  }

}
