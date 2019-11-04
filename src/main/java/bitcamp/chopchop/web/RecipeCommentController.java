package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
  public String add(RecipeComment recipeComment) throws Exception {
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
    // 해당 레시피의 댓글 목록을 불러온다.
    List<RecipeComment> recipeComments = recipeCommentService.get(no);
    model.addAttribute("recipeComments", recipeComments);
  }
  
  @GetMapping("list")
  public void list(Model model) throws Exception {
    // 모든 댓글 불러온다.
    List<RecipeComment> recipeComment = recipeCommentService.list();
    model.addAttribute("recipeComments", recipeComment);
  }
  
  @PostMapping("update")
  public String update(RecipeComment recipeComment) throws Exception {
    recipeCommentService.update(recipeComment);
    return "redirect:/app/recipe/list";
  }
}
