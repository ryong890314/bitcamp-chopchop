package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.service.RecipeService;

@Controller
@RequestMapping("/")
public class CommonController {
  
  @Resource 
  RecipeService RecipeService;
  
  @GetMapping("index")
  public void form(Model model) throws Exception {
    model.addAttribute("recipeList", RecipeService.mainTop());
  }
}
