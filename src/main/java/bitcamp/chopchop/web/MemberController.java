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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Resource private MemberService memberService;
  
  String uploadDir;
  
  public MemberController(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/member");
  }

  @GetMapping("form")
  public void form() {
  }

  @PostMapping("add")
  public String add(Member member) throws Exception {
    memberService.insert(member);
    return "redirect:list";
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<Member> members = memberService.list();
    model.addAttribute("members", members);
  }

  @GetMapping("contact")
  public void contact(Model model) throws Exception {
    System.out.println("타는거 맞냐");
    memberService.sendMail();
  }
  
  @GetMapping("dupE")
  public @ResponseBody int dupEmailCheck(String email) throws Exception {
    return memberService.dupEmailCheck(email);
  }
  
  @GetMapping("dupN")
  public @ResponseBody int dupNicknameCheck(String nickname) throws Exception {
    return memberService.dupNicknameCheck(nickname);
  }
  
  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    Member member = memberService.get(no);
    model.addAttribute("member", member);
  }
  
  @PostMapping("update")
  public String update(Member member, MultipartFile file) throws Exception {
    member.setPhoto(writeFile(file));
    memberService.update(member);
    return "redirect:list";
  }
  
  private String writeFile(MultipartFile file) throws Exception {
    if (file.isEmpty())
      return null;
    
    String filename = UUID.randomUUID().toString();
    file.transferTo(new File(uploadDir + "/" + filename));
    return filename;
  }
  
  @GetMapping("delete")
  public String delete(int no) throws Exception {
    memberService.delete(no);
    return "redirect:list";
  }

}
