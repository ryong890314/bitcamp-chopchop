package bitcamp.chopchop.web;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Member;

@Controller
@RequestMapping("/questions")
public class QuestionsController {
  
//  @Resource
//  private QuestionsService questionsService;
  
  @GetMapping("form")
  public void form(Model model, HttpSession session) {
    Member member = (Member) session.getAttribute("loginUser");
    model.addAttribute("member", member);
  }
}
