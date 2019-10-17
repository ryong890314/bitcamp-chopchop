package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

  @Resource
  private ProductService productService;

  @GetMapping("form")
  public void form() {
  }
  
  @PostMapping("add")
  public String add(Product product) throws Exception {
    productService.insert(product);
    return "redirect:list";
  }
  
  @GetMapping("delete")
  public String delete(int no) throws Exception {
    productService.delete(no);
    return "redirect:list";
  }
  
  @GetMapping("detail")
  public void detail(Model model, int no) 
      throws Exception {
    Product product = productService.get(no);
    model.addAttribute("product", product);
  }
  
  @GetMapping("list")
  public void list(Model model) 
      throws Exception {
    List<Product> products = productService.list();
    model.addAttribute("products", products);
  }
  
  @PostMapping("update")
  public String update(Product product) 
      throws Exception {
    productService.update(product);
    return "redirect:list";
  }

}
