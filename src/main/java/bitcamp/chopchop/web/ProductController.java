package bitcamp.chopchop.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

  @Resource
  private ProductService productService;
  @Resource
  private PhotoFileWriter photoFileWriter;

  @GetMapping("form")
  public void form() {}

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("products", productService.list());
  }

  @PostMapping("add")
  public String add(HttpServletRequest request, Product product, MultipartFile[] filePath)
      throws Exception {

    product.setFiles(photoFileWriter.getPhotoFiles(filePath));

    productService.insert(product);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    productService.delete(no);
    return "redirect:list";
  }

  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    model.addAttribute("product", productService.get(no));
  }

  @PostMapping("update")
  public String update(HttpServletRequest request, Product product, MultipartFile[] filePath)
      throws Exception {
    
    product.setFiles(photoFileWriter.getPhotoFiles(filePath));
    productService.update(product);
    return "redirect:list";
  }
}


