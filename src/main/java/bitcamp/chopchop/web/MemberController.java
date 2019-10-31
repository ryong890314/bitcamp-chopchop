package bitcamp.chopchop.web;

import java.io.File;
import java.net.PasswordAuthentication;
import java.util.List;
import java.util.Properties;
import java.util.UUID;
import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import org.apache.logging.log4j.message.Message;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Resource
  private MemberService memberService;

  String uploadDir;

  public MemberController(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/member");
  }

  @GetMapping("main")
  public void main() {}
  
  @GetMapping("form")
  public void form() {}

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

  @RequestMapping(value = "signE", method = RequestMethod.GET)
  public @ResponseBody int signEmailCheck(String email) throws Exception {
    return memberService.signEmailCheck(email);
  }

  @RequestMapping(value = "signP", method = RequestMethod.GET)
  public @ResponseBody int signPasswordCheck(String password) throws Exception {
    return memberService.signPasswordCheck(password);
  }

  @RequestMapping("detail")
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

  @PostMapping("chkPw")
  public @ResponseBody int chkPw(String password, int memberNo) throws Exception {
    return memberService.chkPw(password, memberNo);
  }

  @PostMapping("uptPw")
  public @ResponseBody int uptPw(String password, int memberNo) throws Exception {
    return memberService.uptPw(password, memberNo);
  }

  
  
  
  
  
  
  
  
  //  "/member/register2",했었음 이것은 무엇인가.
//  @RequestMapping(path = "/auth/getPassword",
//      method = RequestMethod.POST)
//  public static void gGmailSend() {
//    String user = "bitcamp1234@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
//    String password = "Dmzizi1016!"; // 패스워드
//    
//
//    // SMTP 서버 정보를 설정한다.
//    Properties prop = new Properties();
//    prop.put("mail.smtp.host", "smtp.gmail.com");
//    prop.put("mail.smtp.port", 465);
//    prop.put("mail.smtp.auth", "true");
//    prop.put("mail.smtp.ssl.enable", "true");
//    prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//
//    Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
//      protected PasswordAuthentication getPasswordAuthentication() {
//        return new PasswordAuthentication(user, password);
//      }
//    });
//
//    try {
//      MimeMessage message = new MimeMessage(session);
//      message.setFrom(new InternetAddress(user));
//
//      // 수신자메일주소
//      message.addRecipient(Message.RecipientType.TO, new InternetAddress("ktko@naver.com"));
//
//      // Subject
//      message.setSubject("제목을 입력하세요"); // 메일 제목을 입력
//
//      // Text
//      message.setText("내용을 입력하세요"); // 메일 내용을 입력
//
//      // send the message
//      Transport.send(message); //// 전송
//      System.out.println("message sent successfully...");
//    } catch (AddressException e) {
//      e.printStackTrace();
//    } catch (MessagingException e) {
//      e.printStackTrace();
//    }
//  }
}
