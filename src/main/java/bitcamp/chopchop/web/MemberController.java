package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Resource private MemberService memberService;

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
  
  @RequestMapping("contact")
  public void contact(Model model) throws Exception {
    System.out.println("타는거 맞냐");
    memberService.sendMail();
    
  }
  
  @RequestMapping(value = "dupE", method = RequestMethod.GET)
  public @ResponseBody int dupEmailCheck(String email) throws Exception {
    return memberService.dupEmailCheck(email);
  }
  
  @RequestMapping(value = "dupN", method = RequestMethod.GET)
  public @ResponseBody int dupNicknameCheck(String nickname) throws Exception {
    return memberService.dupNicknameCheck(nickname);
  }


}
