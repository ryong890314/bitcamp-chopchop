package bitcamp.chopchop.web.json;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.domain.RecipeComment;
import bitcamp.chopchop.service.RecipeCommentService;
import bitcamp.chopchop.service.RecipeService;

// @RestController
// => request handler의 리턴 값이 응답 데이터임을 선언한다.
// => 리턴 값은 내부에 설정된 HttpMessageConverter에 의해 JSON 문자열로 변환되어 보내진다.
//
@RestController("json.RecipeController")
@RequestMapping("/json/recipe")
public class RecipeController {

  @Resource private RecipeService recipeService;
  @Resource private RecipeCommentService recipeCommentService;
  
  String uploadDir;
  
  public RecipeController(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/recipe");
  }
  
  @GetMapping("form")
  public void form() {
  }

  @PostMapping("add")
  public JsonResult add(Recipe recipe,  MultipartFile file) throws Exception {
    try {
      recipe.setThumbnail(writeFile(file));
      recipeService.insert(recipe);
      return new JsonResult().setState(JsonResult.SUCCESS);
      
    } catch (Exception e) {
      return new JsonResult()
          .setState(JsonResult.FAILURE)
          .setMessage(e.getMessage());
    }
  }
  
  @GetMapping("delete")
  public JsonResult delete(int no) throws Exception {
    try {
      recipeService.delete(no);
      recipeCommentService.delete(no);
      return new JsonResult().setState(JsonResult.SUCCESS);
      
    } catch (Exception e) {
      return new JsonResult()
          .setState(JsonResult.FAILURE)
          .setMessage(e.getMessage());
    }
  }
  
  @GetMapping("detail")
  public JsonResult detail(int no) throws Exception {
    try {
      Recipe recipe = recipeService.get(no);
      List<RecipeComment> comments = recipe.getComments();
      
      return new JsonResult()
          .setState(JsonResult.SUCCESS)
          .setResult(recipe);
      
    } catch (Exception e) {
      return new JsonResult()
          .setState(JsonResult.FAILURE)
          .setMessage(e.getMessage());
    }
  }
  
  @GetMapping("list")
  public JsonResult list() throws Exception {
    try {
      List<Recipe> recipes = recipeService.list();
      return new JsonResult()
          .setState(JsonResult.SUCCESS)
          .setResult(recipes);
      
    } catch (Exception e) {
      return new JsonResult()
          .setState(JsonResult.FAILURE)
          .setMessage(e.getMessage());
    }
  }
  
  @PostMapping("update")
  public JsonResult update(Recipe recipe, MultipartFile file) throws Exception {
    try {
      recipe.setThumbnail(writeFile(file));
      recipeService.update(recipe);
      return new JsonResult().setState(JsonResult.SUCCESS);
      
    } catch (Exception e) {
      return new JsonResult()
          .setState(JsonResult.FAILURE)
          .setMessage(e.getMessage());
    }
  }
  
  private String writeFile(MultipartFile file) throws Exception {
    if (file.isEmpty())
      return null;
    
    String filename = UUID.randomUUID().toString();
    file.transferTo(new File(uploadDir + "/" + filename));
    return filename;
  }
  

}
