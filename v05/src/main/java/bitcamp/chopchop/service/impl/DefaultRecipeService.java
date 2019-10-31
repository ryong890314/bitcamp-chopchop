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

    int result = recipeDao.insert(recipe);
    System.out.println("=============================");
    System.out.println(result);
    System.out.println("=============================");
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
  
  @Override
  public List<Recipe> listSort(String column) throws Exception {
    return recipeDao.findSort(column);
  }

  @Transactional
  @Override
  public void delete(int no) throws Exception {
    if (recipeDao.findBy(no) == null) {
      throw new Exception("데이터가 없습니다.");
    }
    recipeLikeDao.deleteAll(no);
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
    
    recipeDao.update(recipe);
    
    if (recipe.getIngredients().size() > 0) {
      ingredientDao.delete(recipe.getRecipeNo());
      for (Ingredient i : recipe.getIngredients()) {
        System.out.println("==========================");
        System.out.println(recipe.getRecipeNo());
        System.out.println("==========================");
        i.setRecipeNo(recipe.getRecipeNo());
        ingredientDao.insert(i);
      }
    }
    if (recipe.getCookings().size() > 0) {
      cookingDao.delete(recipe.getRecipeNo());
      for (Cooking c : recipe.getCookings()) {
        c.setRecipeNo(recipe.getRecipeNo());
        cookingDao.insert(c);
      }
    }
  }


  @Transactional
  @Override
  public void insertLike(RecipeLike recipeLike) throws Exception {
    recipeDao.increaseScrapCount(recipeLike.getRecipeNo());
    recipeLikeDao.insertLike(recipeLike);
  }

  @Override
  public void deleteLike(RecipeLike recipeLike) throws Exception {
    recipeDao.decreaseScrapCount(recipeLike.getRecipeNo());
    recipeLikeDao.deleteLike(recipeLike);
  }

  @Override
  public int findLike(RecipeLike recipeLike) throws Exception {
    return recipeLikeDao.findLike(recipeLike);
  }

}
