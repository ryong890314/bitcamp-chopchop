package bitcamp.chopchop.web;

import java.util.Properties;
import java.util.UUID;
import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  @Resource
  private MemberService memberService;

  @GetMapping("signin")
  public void signin() {}

  @GetMapping("findPassword")
  public void findPassword() {}

  @PostMapping("login")
  public String login(HttpServletResponse response, HttpSession session, String email,
      String password) throws Exception {

    // 응답할 때 클라이언트가 입력한 이메일을 쿠키로 보낸다.
    Cookie cookie = new Cookie("email", email);
    cookie.setMaxAge(60 * 60 * 24 * 15);
    response.addCookie(cookie);

    Member member = memberService.get(email, password);

    session.setAttribute("loginUser", member);
    return "redirect:../member/list";
  }

  @GetMapping("logout")
  public String logout(HttpSession session) throws Exception {
    session.invalidate();
    return "redirect:signin";
  }

  @RequestMapping(path = "getPassword", method = RequestMethod.GET)
  public void gGmailSend(String email) throws Exception {
    try {
      
      String user = "bitcamp1234@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
      String password = "Dmzizi1016!"; // 패스워드

      Member member = memberService.signEmailCheck(email);

      System.out.println("들어옴  email" + email);
      
      System.out.println("맴버임:" + member ); 
      if (member != null) {

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
          protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(user, password);
          }
        });

        String uuid = UUID.randomUUID().toString(); // -를 제거해 주었다.
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));

        // 수신자메일주소
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

        for (int i = 0; i < 1; i++) {
          uuid = uuid.substring(0, 10); // uuid를 앞에서부터 10자리 잘라줌.
        }

        String userMessage = "<html><body>비밀번호 찾기 임시 비밀번호: " + uuid + " 변경된 비밀번호로 로그인 해주세요."
            + "<a href='http://localhost:8888/app/auth/signin'>" + "login 하기"+ "</a></html></body>";
        // Subject
        message.setSubject("[ChopChop] - Temporary Password"); // 메일 제목을 입력

        // Text
        message.setText(userMessage, "utf-8", "html");


        // email로 member를 찾는다.
        // 그 멤버 update (password=uuid)
        member.setPassword(uuid);
        memberService.update(member);

        // send the message
        Transport.send(message); //// 전송
        System.out.println("message sent successfully...");
      } else {
        
      }
    } catch (AddressException e) {
      e.printStackTrace();
    } catch (MessagingException e) {
      e.printStackTrace();
    }
  }

}
