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
import bitcamp.chopchop.domain.RRecipe;
import bitcamp.chopchop.domain.RecipeComment;
import bitcamp.chopchop.service.RRecipeService;
import bitcamp.chopchop.service.RecipeCommentService;

// @RestController
// => request handler의 리턴 값이 응답 데이터임을 선언한다.
// => 리턴 값은 내부에 설정된 HttpMessageConverter에 의해 JSON 문자열로 변환되어 보내진다.
//
@RestController("json.RRecipeController")
@RequestMapping("/json/rrecipe")
public class RRecipeController {

  @Resource private RRecipeService rrecipeService;
  @Resource private RecipeCommentService recipeCommentService;
  
  String uploadDir;
  
  public RRecipeController(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/rrecipe");
  }
  
  @GetMapping("form")
  public void form() {
  }

  @PostMapping("add")
  public JsonResult add(RRecipe rrecipe,  MultipartFile file) throws Exception {
    try {
      rrecipe.setThumbnail(writeFile(file));
      rrecipeService.insert(rrecipe);
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
      rrecipeService.delete(no);
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
      RRecipe rrecipe = rrecipeService.get(no);
      List<RecipeComment> comments = rrecipe.getComments();
      
      return new JsonResult()
          .setState(JsonResult.SUCCESS)
          .setResult(rrecipe);
      
    } catch (Exception e) {
      return new JsonResult()
          .setState(JsonResult.FAILURE)
          .setMessage(e.getMessage());
    }
  }
  
  @GetMapping("list")
  public JsonResult list() throws Exception {
    try {
      List<RRecipe> rrecipes = rrecipeService.list();
      return new JsonResult()
          .setState(JsonResult.SUCCESS)
          .setResult(rrecipes);
      
    } catch (Exception e) {
      return new JsonResult()
          .setState(JsonResult.FAILURE)
          .setMessage(e.getMessage());
    }
  }
  
  @PostMapping("update")
  public JsonResult update(RRecipe rrecipe, MultipartFile file) throws Exception {
    try {
      rrecipe.setThumbnail(writeFile(file));
      rrecipeService.update(rrecipe);
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
