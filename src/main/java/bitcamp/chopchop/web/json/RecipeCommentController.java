package bitcamp.chopchop.web.json;

import javax.annotation.Resource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import bitcamp.chopchop.service.RecipeCommentService;

@RestController("json.RecipeCommentController")
@RequestMapping("/json/recipecomment")
public class RecipeCommentController {
  @Resource private RecipeCommentService recipeCommentService;
  
  

}
