package bitcamp.chopchop.web;

import java.util.List;

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
  public void form() {
  }
  
  @PostMapping("add")
  public String add(HttpServletRequest request, Product product, MultipartFile[] filePath) throws Exception {
    product.setFiles(photoFileWriter.getPhotoFiles(filePath));
    productService.insert(product);
    return "redirect:list";
  }
  
  @GetMapping("delete")
  public String delete(int productNo) throws Exception {
    productService.delete(productNo);
    return "redirect:list";
  }
  
  @GetMapping("detail")
  public void detail(Model model, int productNo) 
      throws Exception {
    Product product = productService.get(productNo);
    model.addAttribute("product", product);
  }
  
  @GetMapping("list")
  public void list(Model model) 
      throws Exception {
    List<Product> products = productService.list();
    model.addAttribute("products", products);
  }

  // 검색기능 추가
   @GetMapping("search")
  public void search(Model model, String keyword) throws Exception {
    List<Product> products = productService.search(keyword);
    model.addAttribute("products", products);
  }
  
  @PostMapping("update")
  public String update(HttpServletRequest request, Product product, MultipartFile[] filePath) 
      throws Exception {

        product.setFiles(photoFileWriter.getPhotoFiles(filePath));
    productService.update(product);
    return "redirect:list";
  }

}
