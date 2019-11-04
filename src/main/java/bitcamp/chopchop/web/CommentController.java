package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Comment;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.service.CommentService;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.ProductService;

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
  public String update(Comment comment, HttpServletRequest request, int productNo) 
      throws Exception {
    commentService.update(comment);
    return "redirect:../product/detail?no=" + productNo;
  }

  @GetMapping("updateform")
  public void updateform(Model model, int no) throws Exception {
    model.addAttribute("comment", commentService.get(no));
  }
  
  @GetMapping("productCommentList")
  public void productCommentList(Model model, int no) throws Exception {
    Product product = productService.get(no);
    List<Comment> comments2 = commentService.findByProductWith(product.getProductNo());
//    ArrayList<Member> members2 = new ArrayList<>();
    for(Comment c : comments2) {
      c.setMember(memberService.get(c.getMemberNo()));
//      model.addAttribute("members2", c.getMember());
//      members2.add(memberService.get(c.getMemberNo()));
      System.out.println(c.getMember().getNickname());
    }   
    
    model.addAttribute("product", productService.get(no));
    model.addAttribute("comments2", comments2);
  }
}


