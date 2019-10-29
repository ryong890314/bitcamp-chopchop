package bitcamp.chopchop.web;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.domain.RecipeComment;
import bitcamp.chopchop.service.RecipeCommentService;
import bitcamp.chopchop.service.RecipeService;

@Controller
@RequestMapping("/recipe")
public class RecipeController {

  
  
  @Resource  private RecipeService recipeService;
  @Resource private RecipeCommentService recipeCommentService;
  
  String uploadDir;
  
  public RecipeController(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/recipe");
  }
  
  @GetMapping("form")
  public void form() {
  }
  
  @PostMapping("add")
  public String add(Recipe recipe, MultipartFile file) throws Exception {
    
    recipe.setThumbnail(writeFile(file));
    recipeService.insert(recipe);
    return "redirect:list";
  }
  
  @GetMapping("delete")
  public String delete(int no) throws Exception {
    recipeService.delete(no);
    return "redirect:list";
  }
  
  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    Recipe recipe = recipeService.get(no);
    model.addAttribute("recipe", recipe);
    List<RecipeComment> comments = recipe.getComments();
    RecipeComment recipeComment = recipeCommentService.get(no);
    model.addAttribute("recipeComment", recipeComment);
  }
  
  @GetMapping("list")
  public void list(Model model)  throws Exception {
    List<Recipe> recipes = recipeService.list();
    model.addAttribute("recipes", recipes);
    
 // 뷰 URL을 리턴하지 않으면, 프론트 컨트롤러는 
    // 요청 핸들러의 URL을 뷰 URL로 사용한다.
    // 즉 list() 메서드는 다음의 URL을 리턴한 것과 같다.
    // return "board/list";
  }
  
  @PostMapping("update")
  public String update(Recipe recipe, MultipartFile file) throws Exception {
    recipe.setThumbnail(writeFile(file));
    recipeService.update(recipe);
    return "redirect:list";
    
  }
  
  private String writeFile(MultipartFile file) throws Exception {
    if (file.isEmpty())
      return null;
    
    String filename = UUID.randomUUID().toString();
    file.transferTo(new File(uploadDir + "/" + filename));
    return filename;
  }
  
  
  
}
