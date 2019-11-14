package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.service.ProductService;
import bitcamp.chopchop.service.RecipeService;

@Controller
@RequestMapping("/")
public class CommonController {
  
  @Resource 
  RecipeService recipeService;
  
  @Resource
  ProductService productService;
  
  @GetMapping("index")
  public void form(Model model) throws Exception {
//    List<Recipe> recipeList = recipeService.mainTop();
//    List<Product> productList = productService.mainTop();
    model.addAttribute("recipeList", recipeService.mainTop());
    model.addAttribute("productList", productService.mainTop());
  }
}
