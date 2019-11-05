package bitcamp.chopchop.web.json;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Ingredient;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.domain.RecipeLike;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.RecipeService;
import bitcamp.chopchop.web.CookingFileWriter;

@RestController("json.RecipeController")
@RequestMapping("/json/recipe")
public class RecipeController {
  @Resource private RecipeService recipeService;
  @Resource private CookingFileWriter cookingFileWriter;
  @Resource private MemberService memberService;

  String uploadDir;

  public RecipeController(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/recipe");
  }

  @PostMapping("add")
  public JsonResult add(Recipe recipe, int memberNo, MultipartFile filePath, MultipartFile[] filePath2, String[] ingredientNames, String[] quantity, String[] cookingContent, 
      int[] processNo) throws Exception {

    try {
      String filename = UUID.randomUUID().toString();
      recipe.setThumbnail(filename);
      filePath.transferTo(new File(uploadDir + "/" + filename));

      List<Ingredient> ingredients = new ArrayList<>();
      for (int i = 0; i < ingredientNames.length; i++) {
        Ingredient temp = new Ingredient();
        temp.setName(ingredientNames[i]);
        temp.setQuantity(quantity[i]);
        ingredients.add(temp);
        System.out.println(i +"번재료입니다ㅏㅏㅏㅏ" + ingredientNames[i]);
      }

      recipe.setCookings(cookingFileWriter.getCookings(filePath2, processNo, cookingContent));
      recipe.setIngredients(ingredients);
      recipeService.insert(recipe);
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("delete")
  public JsonResult delete(int no) throws Exception {
    try {
      recipeService.delete(no);
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("detail")
  public JsonResult detail(int no, HttpSession session) throws Exception {
    //    session.setAttribute("no", 1);
    try {
      Recipe recipe = recipeService.get(no);
      Member member = memberService.get(recipe.getMemberNo());
      Member viewer = (Member) session.getAttribute("loginUser");
      
      RecipeLike recipeLike = new RecipeLike();
      recipeLike.setMemberNo(viewer.getMemberNo());
      recipeLike.setRecipeNo(recipe.getRecipeNo());
      int check = recipeService.findLike(recipeLike);
      boolean likeCheck = false;
      if (check == 1) { // 좋아요햇음
        likeCheck = true;
      } else if (check == 0){ // 좋아요 안했음
        likeCheck = false;
      }

      JsonResult jsonResult = new JsonResult();
      HashMap<String,Object> hashMap = new HashMap<>();
      hashMap.put("member", member);
      hashMap.put("recipe", recipe);
      hashMap.put("isCheck", likeCheck);
      hashMap.put("viewer", viewer);
      jsonResult.setState(JsonResult.SUCCESS).setResult(hashMap);
      return jsonResult;
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("updateform")
  public JsonResult updateform(int no) throws Exception {
    try {
      Recipe recipe = recipeService.get(no);
      return new JsonResult().setState(JsonResult.SUCCESS).setResult(recipe);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @PostMapping("update")
  public JsonResult update(Recipe recipe, int memberNo, MultipartFile filePath, MultipartFile[] filePath2, String[] ingredientNames, String[] quantity, String[] cookingContent, 
      int[] processNo) throws Exception {
    try {
      String filename = UUID.randomUUID().toString();
      recipe.setThumbnail(filename);

      filePath.transferTo(new File(uploadDir + "/" + filename));

      List<Ingredient> ingredients = new ArrayList<>();
      for (int i = 0; i < ingredientNames.length; i++) {
        Ingredient temp = new Ingredient();
        temp.setName(ingredientNames[i]);
        temp.setQuantity(quantity[i]);
        ingredients.add(temp);
      }

      recipe.setCookings(cookingFileWriter.getCookings(filePath2, processNo, cookingContent));
      recipe.setIngredients(ingredients);
      recipeService.update(recipe);
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("list")
  public JsonResult list() throws Exception {
    try {
      List<Recipe> recipes = recipeService.list();
      return new JsonResult().setState(JsonResult.SUCCESS).setResult(recipes);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }
  
  @GetMapping("listSort")
  public JsonResult listSort(String column) throws Exception {
    try {
      System.out.println("들어온 컬럼????????" + column);
      List<Recipe> recipes = recipeService.listSort(column);
      for (int i =0; i <recipes.size(); i++) {
        System.out.println("=========================");
        System.out.println(recipes.get(0).getTitle());
        
      }
      return new JsonResult().setState(JsonResult.SUCCESS).setResult(recipes);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("search")
  public JsonResult search(String keyword) throws Exception {
    try {
      List<Recipe> recipes = recipeService.search(keyword);
      return new JsonResult().setState(JsonResult.SUCCESS).setResult(recipes);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("like")
  public JsonResult like(int no, HttpSession session) throws Exception {
    try {
      Member member = (Member)session.getAttribute("loginUser");
      Recipe recipe = recipeService.get(no);

      RecipeLike recipeLike = new RecipeLike();
      recipeLike.setMemberNo(member.getMemberNo());
      recipeLike.setRecipeNo(recipe.getRecipeNo());

      JsonResult jsonResult = new JsonResult();
      HashMap<String,Object> hashMap = new HashMap<>();
      
      recipe = recipeService.get(no);
      System.out.println("findLike  " + recipeService.findLike(recipeLike));
      
      if (recipeService.findLike(recipeLike) == 1) { // 좋아요 취소해야함
        recipeService.deleteLike(recipeLike);
        hashMap.put("recipeNo", recipe.getRecipeNo());
        hashMap.put("member", member);
        hashMap.put("isLike", false);
        hashMap.put("scrap", recipeService.get(no).getScrap());
        System.out.println("좋아요취소 ===> 스크랩수" + recipeService.get(no).getScrap());
        jsonResult.setState(JsonResult.SUCCESS).setResult(hashMap);
        return jsonResult;

      } else { // 좋아요 를 눌렀음
        recipeService.insertLike(recipeLike);
        
        hashMap.put("recipeNo", recipe.getRecipeNo());
        hashMap.put("member", member);
        hashMap.put("isLike", true);
        hashMap.put("scrap", recipeService.get(no).getScrap());
        System.out.println("조아요====> 스크랩수" + recipeService.get(no).getScrap());
        jsonResult.setState(JsonResult.SUCCESS).setResult(hashMap);
        return jsonResult;
      }
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }
}
