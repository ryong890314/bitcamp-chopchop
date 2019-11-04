package bitcamp.chopchop.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Comment;
import bitcamp.chopchop.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

  @Resource
  private CommentService commentService;

  @GetMapping("form")
  public void form() {
  }

  @PostMapping("add")
  public String add(Comment comment, Model model) throws Exception {
    commentService.insert(comment);
    model.addAttribute("comment", comment);
    return "redirect:../product/detail?no=" + comment.getProductNo();
  }

  @GetMapping("commentDelete")
  public String commentDelete(int no, HttpServletRequest request, int productNo) 
      throws Exception {
    commentService.commentDelete(no);
    return "redirect:../product/detail?no="+ productNo;
  }

  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    model.addAttribute("comment", commentService.get(no));
  }

  @PostMapping("update")
  public String update(Comment comment, HttpServletRequest request, int productNo) 
      throws Exception {
    commentService.update(comment);
    return "redirect:../product/detail?no=" + productNo;
  }

  @GetMapping("updateform")
  public void updateform(Model model, int no) throws Exception {
    model.addAttribute("comment", commentService.get(no));
  }
}


