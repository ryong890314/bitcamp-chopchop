package bitcamp.chopchop.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Comment;
import bitcamp.chopchop.service.CommentService;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.ProductService;
import bitcamp.chopchop.web.json.JsonResult;

@Controller
@RequestMapping("/comment")
public class CommentController {

  @Resource
  private CommentService commentService;
  @Resource
  private MemberService memberService;
  @Resource
  private ProductService productService;

  @GetMapping("form")
  public void form() {
  }

  @PostMapping("add")
  public String add(Comment comment) throws Exception {
    commentService.insert(comment);
    return "redirect:../product/detail?no=" + comment.getProductNo();
  }

  @GetMapping("commentDelete")
  public String commentDelete(int no, int productNo) 
      throws Exception {
    commentService.commentDelete(no);
    return "redirect:../product/detail?no="+ productNo;
  }

  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    model.addAttribute("comment", commentService.get(no));
  }
  
  @PostMapping("update")
  public JsonResult update(@RequestBody Comment comment, HttpServletRequest request, int productNo)
      throws Exception {
    System.out.println(comment);
    commentService.update(comment);
    return new JsonResult().setState(JsonResult.SUCCESS);
  }

  @GetMapping("updateform")
  public void updateform(Model model, int no) throws Exception {
    model.addAttribute("comment", commentService.get(no));
  }
  
  @GetMapping("productCommentList")
  public void productCommentList(Model model, int no) throws Exception {
  }
}


