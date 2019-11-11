package bitcamp.chopchop.web.json;

import javax.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

@RestController("json.AuthController")
@RequestMapping("/json/auth")
public class AuthController {

  @Resource
  private MemberService memberService;

  @GetMapping("getMember")
  public JsonResult findByEmail(String email) throws Exception {
    try {
      Member member = memberService.signEmailCheck(email);

      System.out.println(member.getEmail());
      System.out.println(member.getMemberNo());
      

      return new JsonResult().setState(JsonResult.SUCCESS).setResult(member);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

}
