package bitcamp.chopchop.web;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Comment;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.domain.ProductOption;
import bitcamp.chopchop.domain.ProductReview;
import bitcamp.chopchop.service.CommentService;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.ProductOptionService;
import bitcamp.chopchop.service.ProductReviewService;
import bitcamp.chopchop.service.ProductService;

@Controller
@RequestMapping("/product")
@SessionAttributes("loginUser")
public class ProductController {

  @Resource
  private ProductService productService;
  @Resource
  private PhotoFileWriter photoFileWriter;
  @Resource
  private CommentService commentService;
  @Resource
  private MemberService memberService;
  @Resource
  private ProductOptionService productOptionService;
  @Resource
  private ProductReviewService productReviewService;


  @GetMapping("form")
  public void form() {}

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("products", productService.list());
  }

  @PostMapping("add")
  public String add(
      Product product, MultipartFile[] filePath, String[] optionTitle, String[] optionPrice) 
          throws Exception {
    product.setFiles(photoFileWriter.getPhotoFiles(filePath));
    productService.insert(product);
    ProductOption productOption = new ProductOption();
    for (int i=0; i<optionTitle.length; i++) {
      productOption.setProductNo(product.getProductNo());
      productOption.setTitle(optionTitle[i]);
      productOption.setPrice(Integer.parseInt(optionPrice[i]));
      productOptionService.insert(productOption);
    }
    return "redirect:list";
  }

  @PostMapping("delete")
  public String delete(int productNo) throws Exception {
    productService.delete(productNo);
    return "redirect:list";
  }

  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    Product product = productService.get(no);
    List<Comment> comments = commentService.findByProductWith(product.getProductNo());
    List<ProductReview> productReviews = productReviewService.list(product.getProductNo());
    model.addAttribute("product", productService.get(no));
    model.addAttribute("comments", comments);
    model.addAttribute("productReviews", productReviews);
  }

  @GetMapping("search")
  public void search(Model model, String keyword) throws Exception {
    List<Product> products = productService.search(keyword);
    model.addAttribute("products", products);
  }

  @GetMapping("category")
  public void categorySearch(String species, Model model) throws Exception {
    List<Product> products = productService.categorySearch(species);
    model.addAttribute("products", products);
  }

  @PostMapping("update")
  public String update(
      Product product, MultipartFile[] filePath, String[] optionTitle, String[] optionPrice)
          throws Exception {
    ProductOption productOption = new ProductOption();
    List<ProductOption> options = new ArrayList<>();
    product.setFiles(photoFileWriter.getPhotoFiles(filePath));
    if (optionTitle.length == 0 || optionPrice.length == 0) {
      System.out.println("넘어온게 음슴");
      productService.update(product);
    } else {
      System.out.println("넘어온게 있슴");
      productOptionService.deleteAll(product.getProductNo());
      for (int i=0; i<optionTitle.length; i++) {
        productOption.setProductNo(product.getProductNo());
        productOption.setTitle(optionTitle[i]);
        productOption.setPrice(Integer.parseInt(optionPrice[i]));
        options.add(productOption);
        product.setOptions(options);
        productOptionService.insert(productOption);
      }
      System.out.println(product);
      productService.update(product);
    }
    return "redirect:detail?no=" + product.getProductNo();
  }

  @GetMapping("updateform")
  public void updateform(Model model, int no) throws Exception {
    model.addAttribute("product", productService.get(no));
  }
}


