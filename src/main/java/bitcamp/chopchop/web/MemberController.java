package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.sevice.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
  
  @Resource 
  private MemberService memberService;
  
  @RequestMapping("form")
  public void form() {
    
  }
  
  @RequestMapping("add")
  public String add(Member member) throws Exception {
    memberService.insert(member);
    return "redirect:list";
  }
  
  @RequestMapping("list")
  public void list(Model model) throws Exception {
    List<Member> members = memberService.list();
    model.addAttribute("members", members);
  }

}
