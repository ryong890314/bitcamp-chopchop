package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
  
  @RequestMapping(value = "check",  method = RequestMethod.POST)
  public String check(Member member) throws Exception {
    List<Member> members = memberService.list(); 
    return "redirect:/";
  }

}
