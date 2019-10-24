package bitcamp.chopchop.web;

import java.io.File;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.MyPage;
import bitcamp.chopchop.service.MyPageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
  
  @Resource
  private MyPageService myPageService;
  
  String uploadDir;

  public MypageController(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/member");
  }
  
  @RequestMapping("info")
  public void detail(Model model, int memberNo) throws Exception {
	  MyPage myPage = myPageService.get(memberNo); 
	  model.addAttribute("myPage", myPage);
  }
  
  @PostMapping("update")
  public String update(Member member, MultipartFile file) throws Exception {
    member.setPhoto(writeFile(file));
    myPageService.update(member);
    return "redirect:info";
  }
  
  private String writeFile(MultipartFile file) throws Exception {
    if (file.isEmpty())
      return null;
    
    String filename = UUID.randomUUID().toString();
    file.transferTo(new File(uploadDir + "/" + filename));
    return filename;
  }
  
  @RequestMapping("pwUpdate")
  private void pwUpdate() {
    
  }
}
