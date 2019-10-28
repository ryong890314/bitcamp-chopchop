package bitcamp.chopchop.web;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  @Resource
  private MemberService memberService;

  @GetMapping("signin")
  public void signin() {
  }
  
  @GetMapping("findPassword")
  public void findPassword() {
  }
  @PostMapping("getPassword")
  public void getPassword() {
  }
  
  @PostMapping("login")
  public String login(
      HttpServletResponse response,
      HttpSession session,
      String email,
      String password) 
      throws Exception {

    // 응답할 때 클라이언트가 입력한 이메일을 쿠키로 보낸다.
    Cookie cookie = new Cookie("email", email);
    cookie.setMaxAge(60 * 60 * 24 * 15);
    response.addCookie(cookie);

    Member member = memberService.get(email, password);

    session.setAttribute("loginUser", member);
    return "redirect:../member/list";
  }
  
  @GetMapping("logout")
  public String logout(HttpSession session) 
      throws Exception {
    session.invalidate();
    return "redirect:signin";
  }
}
