package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Question;
import bitcamp.chopchop.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {
  
  @Resource
  private QuestionService questionService;
  
  @GetMapping("form")
  public void form() {
  }
  
  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<Question> questions = questionService.list();
    model.addAttribute("questions", questions);
  }
  
  @PostMapping("add")
  public String add(Question question) throws Exception {
    questionService.insert(question);
    return "redirect:list";
  }
  
  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    Question question = questionService.get(no);
    model.addAttribute("question", question);
  }
  
  @PostMapping("update")
  public String update(Question question) throws Exception {
    questionService.update(question);
    return "redirect:list";
  }
  
  @GetMapping("delete")
  public String delete(int no) throws Exception {
    questionService.delete(no);
    return "redirect:list";
  }
}
