package bitcamp.chopchop.web.json;

import java.io.File;
import java.util.ArrayList;
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
      return new JsonResult().setState(JsonResult.SUCCESS).setResult(recipe);
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

  @GetMapping("search")
  public JsonResult search(String keyword) throws Exception {
    try {
      List<Recipe> recipes = recipeService.search(keyword);
      return new JsonResult().setState(JsonResult.SUCCESS).setResult(recipes);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @PostMapping("like")
  public JsonResult like(int no, int memberNo) throws Exception {
    try {
      Recipe recipe = recipeService.get(no);
      List<RecipeLike> recipeLikes = new ArrayList<>();
      RecipeLike temp = new RecipeLike();
      temp.setMemberNo(memberNo);
      temp.setRecipeNo(no);
      recipeLikes.add(temp);

      recipe.setRecipeLikes(recipeLikes);
      recipeService.update(recipe);
      recipeService.insertRecipeLike(recipe);
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }
}
