package bitcamp.chopchop.web.json;

import java.util.ArrayList;
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
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.RecipeCommentService;

@RestController("json.RecipeCommentController")
@RequestMapping("/json/recipecomment")
public class RecipeCommentController {
  @Resource private RecipeCommentService recipeCommentService;
  @Resource private MemberService memberService;

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
    try {
      List<RecipeComment> originRecipeComments = recipeCommentService.list(no);// 모든 댓글리스트
      List<HashMap<String,Object>> recipeComments = new ArrayList<>(); // 댓글 + 작성자를 담을 리스트
      for (int i = 0; i < originRecipeComments.size(); i++) {
        HashMap<String,Object> hashMap = new HashMap<>();
        Member member = memberService.get(originRecipeComments.get(i).getMemberNo());
        hashMap.put("nickname", member.getNickname());
        hashMap.put("recipeComment", originRecipeComments.get(i));
        
        recipeComments.add(hashMap);
      }
      
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
