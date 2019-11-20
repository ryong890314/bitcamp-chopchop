package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.ProductService;
import bitcamp.chopchop.service.RecipeService;

@Controller
@RequestMapping("/")
public class MainController {
  
  @Resource 
  RecipeService recipeService;
  
  @Resource
  ProductService productService;
  
  @Resource
  MemberService memberService;
  
  @GetMapping("index")  
  public void form(Model model, HttpSession session) throws Exception {
    if((Member) session.getAttribute("loginUser") !=  null) {
      Member member = memberService.get(((Member) session.getAttribute("loginUser")).getMemberNo());
      model.addAttribute("member", member);
    }
    List<Recipe> recipeList = recipeService.mainTop();
    List<Product> productList = productService.mainTop();
    model.addAttribute("recipeList", recipeList);
    model.addAttribute("productList", productList);
  }
}
