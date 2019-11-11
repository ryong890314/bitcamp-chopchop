package bitcamp.chopchop.web.json;

import java.util.Properties;
import java.util.UUID;
import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

@RestController("json.AuthController")
@RequestMapping("/json/auth")
public class AuthController {

  @Resource
  private MemberService memberService;

  @RequestMapping(path = "getPassword", method = RequestMethod.POST)
  public JsonResult gGmailSend(String email) throws Exception {
    String user = "bitcamp1234@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
    String password = "kim1016!"; // 패스워드

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
    try {
      Member member = memberService.signEmailCheck(email);


      String uuid = UUID.randomUUID().toString(); // -를 제거해 주었다.
      MimeMessage message = new MimeMessage(session);
      message.setFrom(new InternetAddress(user));

      // 수신자메일주소
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

      for (int i = 0; i < 1; i++) {
        uuid = uuid.substring(0, 10); // uuid를 앞에서부터 10자리 잘라줌.
      }

      // Subject
      message.setSubject("[ChopChop] - Temporary Password"); // 메일 제목을 입력

      // Text
      message.setText("비밀번호 찾기 임시 비밀번호: " + uuid + "변경  하시려면 링크를 클릭해 주세요."); // 메일 내용을 입력


      // email로 member를 찾는다.
      // 그 멤버 update (password=uuid)
      member.setPassword(uuid);
      memberService.update(member);


      // send the message
      Transport.send(message); //// 전송
      System.out.println("message sent successfully...");

      return new JsonResult().setState(JsonResult.SUCCESS).setResult(member);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

}
