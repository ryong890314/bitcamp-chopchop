package bitcamp.chopchop.web.json;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import bitcamp.chopchop.domain.RecipeComment;
import bitcamp.chopchop.service.RecipeCommentService;

// @RestController
// => request handler의 리턴 값이 응답 데이터임을 선언한다.
// => 리턴 값은 내부에 설정된 HttpMessageConverter에 의해 JSON 문자열로 변환되어 보내진다.
//
@RestController("json.RecipeCommentController")
@RequestMapping("/json/recipecomment")
public class RecipeCommentController {

  @Resource
  private RecipeCommentService recipeCommentService;

  @PostMapping("add")
  public JsonResult add(RecipeComment recipeComment) 
      throws Exception {
    try {
      recipeCommentService.insert(recipeComment);
      return new JsonResult().setState(JsonResult.SUCCESS);
      
    } catch (Exception e) {
      return new JsonResult()
          .setState(JsonResult.FAILURE)
          .setMessage(e.getMessage());
    }
  }
  
  @GetMapping("delete")
  public JsonResult delete(int no) 
      throws Exception {
    try {
      recipeCommentService.delete(no);
      return new JsonResult().setState(JsonResult.SUCCESS);
      
    } catch (Exception e) {
      return new JsonResult()
          .setState(JsonResult.FAILURE)
          .setMessage(e.getMessage());
    }
  }
  
  @GetMapping("detail")
  public JsonResult detail(int no) 
      throws Exception {
    try {
      RecipeComment recipeComment = recipeCommentService.get(no);
      return new JsonResult()
          .setState(JsonResult.SUCCESS)
          .setResult(recipeComment);
      
    } catch (Exception e) {
      return new JsonResult()
          .setState(JsonResult.FAILURE)
          .setMessage(e.getMessage());
    }
  }
  
  @GetMapping("list")
  public JsonResult list() 
      throws Exception {
    try {
      List<RecipeComment> recipeComments = recipeCommentService.list();
      return new JsonResult()
          .setState(JsonResult.SUCCESS)
          .setResult(recipeComments);
      
    } catch (Exception e) {
      return new JsonResult()
          .setState(JsonResult.FAILURE)
          .setMessage(e.getMessage());
    }
  }
  
  @PostMapping("update")
  public JsonResult update(RecipeComment recipeComment) 
      throws Exception {
    try {
      recipeCommentService.update(recipeComment);
      return new JsonResult().setState(JsonResult.SUCCESS);
      
    } catch (Exception e) {
      return new JsonResult()
          .setState(JsonResult.FAILURE)
          .setMessage(e.getMessage());
    }
  }

}
