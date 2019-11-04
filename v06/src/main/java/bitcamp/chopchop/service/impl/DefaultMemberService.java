package bitcamp.chopchop.service.impl;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.MemberDao;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

@Service
public class DefaultMemberService implements MemberService {

  @Resource
  private MemberDao memberDao;

  @Override
  public List<Member> list() throws Exception {
    return memberDao.findAll();
  }

  @Override
  public void insert(Member member) throws Exception {
    memberDao.insert(member);
  }

  @Override
  public int dupEmailCheck(String email) throws Exception {
    return memberDao.dupEmailCheck(email);
  }

  @Override
  public int dupNicknameCheck(String nickname) throws Exception {
    return memberDao.dupNicknameCheck(nickname);
  } 

  @Override
  public Member get(String email, String password) throws Exception {
    HashMap<String,Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);
    Member member = memberDao.findByEmailPassword(params);
    if (member == null) {
    } 
    return member;
  }
  
  @Override
  public int signEmailCheck(String email) throws Exception {
    return memberDao.signEmailCheck(email);
  }
  
  @Override
  public int signPasswordCheck(String password) throws Exception {
    return memberDao.signPasswordCheck(password);
  }

  @Override
  public void sendMail() throws Exception {
//    String host = "smtp.naver.com"; 
//    
//    // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
//    String user = "skybrend@naver.com"; 
//    // 패스워드 
//    String password = "062279pbr";   
//    // SMTP 서버 정보를 설정한다. 
//    Properties props = new Properties(); 
//    props.put("mail.smtp.host", host); 
//    props.put("mail.smtp.port", 587); 
//    props.put("mail.smtp.auth", "true"); 
//    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
//      protected PasswordAuthentication getPasswordAuthentication() {
//        return new PasswordAuthentication(user, password); } }); 
//    
//    try {
//      MimeMessage message = new MimeMessage(session);
//      message.setFrom(new InternetAddress(user));
//      message.addRecipient(Message.RecipientType.TO, new InternetAddress("madridista18@naver.com"));
//      // 메일 제목 
//      message.setSubject("KTKO SMTP TEST1111"); 
//      // 메일 내용 
//      message.setText("KTKO Success!!"); 
//      // send the message 
//      Transport.send(message); 
//      System.out.println("Success Message Send"); } 
//    catch (MessagingException e) {
//      e.printStackTrace(); 
//      }
  }

  @Override
  public Member get(int no) throws Exception {
    Member member = memberDao.findBy(no);
    if (member == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    } 
    return member;
  }

  @Override
  public void update(Member member) throws Exception {
    memberDao.update(member);
  }

  @Override
  public void delete(int no) throws Exception {
    if (memberDao.delete(no) == 0) {
      throw new Exception("해당 데이터가 없습니다.");
    }
  }

  @Override
  public int chkPw(String password, int memberNo) throws Exception {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("password", password);
    map.put("memberNo", memberNo);
    return memberDao.chkPw(map);
  }

  @Override
  public int uptPw(String password, int memberNo) throws Exception {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("password", password);
    map.put("memberNo", memberNo);
    return memberDao.uptPw(map);
  }

}
