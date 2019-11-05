package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.RecipeComment;
import bitcamp.chopchop.service.RecipeCommentService;

@Controller
@RequestMapping("/recipecomment")
public class RecipeCommentController {
  @Resource private RecipeCommentService recipeCommentService;
  
  @GetMapping("form")
  public void form() {
  }
  
  @PostMapping("add")
  public String add(RecipeComment recipeComment, int no, HttpSession session) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    recipeComment.setMemberNo(member.getMemberNo());
    recipeComment.setRecipeNo(no);
    
    recipeCommentService.insert(recipeComment);
    return "redirect:/app/recipe/list";
  }
  
  @GetMapping("delete")
  public String delete(int no) throws Exception {
    recipeCommentService.delete(no);
    return "redirect:/app/recipe/list";
  }
  
  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    RecipeComment recipeComment = recipeCommentService.get(no);
    model.addAttribute("recipeComment", recipeComment);
  }
  
  @GetMapping("list")
  public void list(Model model, int no) throws Exception {
    // 해당 레시피의 댓글 목록을 불러온다.
    List<RecipeComment> recipeComments = recipeCommentService.list(no);
    model.addAttribute("recipeComments", recipeComments);
  }
  
  @PostMapping("update")
  public String update(RecipeComment recipeComment) throws Exception {
    recipeCommentService.update(recipeComment);
    return "redirect:/app/recipe/list";
  }
}
