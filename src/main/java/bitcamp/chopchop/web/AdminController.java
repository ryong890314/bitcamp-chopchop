package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.Pet;
import bitcamp.chopchop.domain.ProductReview;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.OrderService;
import bitcamp.chopchop.service.PetService;
import bitcamp.chopchop.service.ProductReviewService;
import bitcamp.chopchop.service.ProductService;
import bitcamp.chopchop.service.RecipeCommentService;
import bitcamp.chopchop.service.RecipeService;

@Controller
@RequestMapping("/admin")
@SessionAttributes("loginUser")
public class AdminController {
  
  @Resource private RecipeService recipeService;
  @Resource private MemberService memberService;
  @Resource private PetService petService;
  @Resource private ProductService productService;
  @Resource private ProductReviewService productReviewService;
  @Resource private OrderService orderService;
  @Resource private RecipeCommentService recipeCommentService;
  
  @GetMapping("member_list")
  public void memberTotalList(Model model, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    List<Member> members = memberService.list();
    List<Pet> pets = petService.list();
    model.addAttribute("member", member);
    model.addAttribute("members", members);
    model.addAttribute("pets", pets);
  }
  
  @GetMapping("recipe_list")
  public void recipeTotalList(HttpSession session, Model model,
      @RequestParam(defaultValue = "1") int pageNo,
      @RequestParam(defaultValue = "4") int pageSize) throws Exception {
    if (session.getAttribute("loginUser") != null) {
      Member member = memberService.get(((Member)session.getAttribute("loginUser")).getMemberNo());
      model.addAttribute("member", member);
    }
    List<Recipe> recipes = recipeService.list(pageNo, pageSize);
    model.addAttribute("recipes", recipes);
  }
  
  @GetMapping("order_list")
  public void orderTotalList(Model model, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    model.addAttribute("member", member);
    model.addAttribute("orders", orderService.list());
  }
  
  @GetMapping("product_list")
  public void productTotalList(Model model, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    model.addAttribute("member", member);
    model.addAttribute("products", productService.list());
  }
  
  @GetMapping("storeReview_list")
  public void storeReviewTotalList(Model model, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    List<ProductReview> storeReviews = productReviewService.storeReview(loginUser.getMemberNo());
    model.addAttribute("member", member);
    model.addAttribute("storeReviews", storeReviews);
    
  }
  
  @GetMapping("recipeComment_list")
  public void recipeComment_list(Model model, @ModelAttribute("loginUser")Member loginUser) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
//    List<RecipeComment> recipeComments = recipeCommentService.
  }
}
