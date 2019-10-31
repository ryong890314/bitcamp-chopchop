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
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Pet2;
import bitcamp.chopchop.service.Pet2Service;

@Controller
@RequestMapping("/pet2")
public class Pet2Controller {

  @Resource
  private Pet2Service pet2Service;

  String uploadDir;

  public Pet2Controller(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/pet");
  }

  @GetMapping("form")
  public void form() {
  }
  
  @PostMapping("add")
  public String add(Pet2 pet2, MultipartFile file) throws Exception {
    pet2.setFilePath(writeFile(file));
    pet2Service.insert(pet2);
    return "redirect:list";
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<Pet2> pets = pet2Service.list();
    model.addAttribute("pets", pets);
  }
  
  private String writeFile(MultipartFile file) throws Exception {
    if (file.isEmpty())
      return null;
    
    String filename = UUID.randomUUID().toString();
    file.transferTo(new File(uploadDir + "/" + filename));
    return filename;
  }

}
