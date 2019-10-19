package bitcamp.chopchop.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Comment;
import bitcamp.chopchop.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

  @Resource
  private CommentService commentService;

  @GetMapping("form")
  public void form() {}

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("comments", commentService.list());
  }

  @PostMapping("add")
  public String add(HttpServletRequest request, Comment comment, MultipartFile[] filePath)
      throws Exception {

    commentService.insert(comment);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    commentService.delete(no);
    return "redirect:list";
  }

  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    model.addAttribute("comment", commentService.get(no));
  }

  @PostMapping("update")
  public String update(Comment comment, MultipartFile[] filePath)
      throws Exception {
    
    commentService.update(comment);
    return "redirect:list";
  }
  
  @GetMapping("updateform")
  public void updateform(Model model, int no) throws Exception {
    model.addAttribute("comment", commentService.get(no));
  }
}


