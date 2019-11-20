package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.ProductReview;
import bitcamp.chopchop.service.ProductReviewService;
import bitcamp.chopchop.service.ProductService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
  
  @Resource
  private ProductReviewService productReviewService;
  
  @Resource
  private ProductService productService;

  @GetMapping("myreview")
  public void myreview(Model model,HttpSession session) throws Exception {
    Member member = (Member)session.getAttribute("loginUser");
    int no = member.getMemberNo();
    List<ProductReview> productReviews = productReviewService.myreview(no);
    model.addAttribute("productReviews", productReviews);
    System.out.println("-----------------------------------------------------------------------------------");
    for (ProductReview a : productReviews) {
      System.out.println(a.toString());
      
    }
  }
  
}
