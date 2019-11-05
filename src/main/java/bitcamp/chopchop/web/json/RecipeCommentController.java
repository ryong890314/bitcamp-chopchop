package bitcamp.chopchop.web.json;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.RecipeComment;
import bitcamp.chopchop.service.RecipeCommentService;

@RestController("json.RecipeCommentController")
@RequestMapping("/json/recipecomment")
public class RecipeCommentController {
  @Resource private RecipeCommentService recipeCommentService;

  @PostMapping("add")
  public JsonResult add(RecipeComment recipeComment, int no, HttpSession session) throws Exception {
    try {
      Member member = (Member)session.getAttribute("loginUser");
      recipeComment.setMemberNo(member.getMemberNo());
      recipeComment.setRecipeNo(no);
      recipeCommentService.insert(recipeComment);
      
      RecipeComment recipeComment2 = recipeCommentService.get(recipeComment.getCommentNo());
      
      JsonResult jsonResult = new JsonResult();
      HashMap<String,Object> hashMap = new HashMap<>();
      hashMap.put("member", member);
      hashMap.put("recipeComment", recipeComment2);
      jsonResult.setState(JsonResult.SUCCESS).setResult(hashMap);
      return jsonResult;
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("delete")
  public JsonResult delete(int no) throws Exception {
    try {
      recipeCommentService.delete(no);
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("detail")
  public JsonResult detail(int no) throws Exception {
    // 해당 레시피의 댓글 목록을 불러온다.
    try {
      RecipeComment recipeComment = recipeCommentService.get(no);
      return new JsonResult().setState(JsonResult.SUCCESS).setResult(recipeComment);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("list")
  public JsonResult list(int no) throws Exception {
    // 모든 댓글 불러온다.
    try {
      List<RecipeComment> recipeComments = recipeCommentService.list(no);
      return new JsonResult().setState(JsonResult.SUCCESS).setResult(recipeComments);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @PostMapping("update")
  public JsonResult update(RecipeComment recipeComment) throws Exception {
    try {
      recipeCommentService.update(recipeComment);
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

}
