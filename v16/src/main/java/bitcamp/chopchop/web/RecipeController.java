package bitcamp.chopchop.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Ingredient;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.domain.RecipeComment;
import bitcamp.chopchop.domain.RecipeLike;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.RecipeCommentService;
import bitcamp.chopchop.service.RecipeService;

@Controller
@RequestMapping("/recipe")
public class RecipeController {
  @Resource private RecipeService recipeService;
  @Resource private CookingFileWriter cookingFileWriter;
  @Resource private MemberService memberService;
  @Resource private RecipeCommentService recipeCommentService;
  

  String uploadDir;

  public RecipeController(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/recipe");
  }

  @GetMapping("form")
  public void form() {
    
  }

  @PostMapping("add")
  public String add(HttpSession session, Recipe recipe, /*int memberNo,*/ MultipartFile filePath, MultipartFile[] filePath2, String[] ingredientNames, String[] quantity, String[] cookingContent, 
      int[] processNo) throws Exception {
    Member member = (Member)session.getAttribute("loginUser");
    recipe.setMemberNo(member.getMemberNo());
    
    String filename = UUID.randomUUID().toString();
    recipe.setThumbnail(filename);
    filePath.transferTo(new File(uploadDir + "/" + filename));
                                 
    List<Ingredient> ingredients = new ArrayList<>();
    for (int i = 0; i < ingredientNames.length; i++) {
      Ingredient temp = new Ingredient();
      temp.setName(ingredientNames[i]);
      temp.setQuantity(quantity[i]);
      ingredients.add(temp);
      System.out.println(i +"번재료입니다ㅏㅏㅏㅏ" + ingredientNames[i]);
    }

    recipe.setCookings(cookingFileWriter.getCookings(filePath2, processNo, cookingContent));
    recipe.setIngredients(ingredients);
    recipeService.insert(recipe);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    recipeService.delete(no);
    return "redirect:list";
  }

  @GetMapping("detail")
  public void detail(Model model, int no, HttpSession session) throws Exception {
    Recipe recipe = recipeService.get(no);
    Member member = memberService.get(recipe.getMemberNo());
    List<RecipeComment> comments = recipe.getComments();
    RecipeComment recipeComment = recipeCommentService.get(no);
    
    //List<RecipeComment> comments = recipe.getComments();
    //RecipeComment recipeComment = recipeCommentService.get(no);
    //model.addAttribute("recipeComment", recipeComment);
    
    model.addAttribute("recipe", recipe);
    model.addAttribute("member", member);
    model.addAttribute("recipeComment", recipeComment);
    
  }

  @GetMapping("updateform")
  public void updateform(Model model, int no) throws Exception {
    Recipe recipe = recipeService.get(no);
    model.addAttribute("recipe", recipe);
  }

  @PostMapping("update")
  public String update(HttpSession session, Recipe recipe, int memberNo, MultipartFile filePath, MultipartFile[] filePath2, String[] ingredientNames, String[] quantity, String[] cookingContent, 
      int[] processNo) throws Exception {
    String filename = UUID.randomUUID().toString();
    recipe.setThumbnail(filename);

    filePath.transferTo(new File(uploadDir + "/" + filename));

    List<Ingredient> ingredients = new ArrayList<>();
    for (int i = 0; i < ingredientNames.length; i++) {
      Ingredient temp = new Ingredient();
      temp.setName(ingredientNames[i]);
      temp.setQuantity(quantity[i]);
      ingredients.add(temp);
    }

    recipe.setCookings(cookingFileWriter.getCookings(filePath2, processNo, cookingContent));
    recipe.setIngredients(ingredients);
    recipeService.update(recipe);
    return "redirect:list";
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<Recipe> recipes = recipeService.list();
    model.addAttribute("recipes", recipes);
  }

  @GetMapping("search")
  public void search(Model model, String keyword) throws Exception {
    List<Recipe> recipes = recipeService.search(keyword);
    model.addAttribute("recipes", recipes);
  }

  @PostMapping("like")
  public String like(int no, int memberNo) throws Exception {
    Recipe recipe = recipeService.get(no);
    List<RecipeLike> recipeLikes = new ArrayList<>();
    RecipeLike temp = new RecipeLike();
    temp.setMemberNo(memberNo);
    temp.setRecipeNo(no);
    recipeLikes.add(temp);
    
    recipe.setRecipeLikes(recipeLikes);
    recipeService.update(recipe);
    
    recipeService.insertRecipeLike(recipe);
    return "redirect:list";
  }
}
