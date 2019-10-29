package bitcamp.chopchop.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.Order;
import bitcamp.chopchop.domain.OrderProduct;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.service.OrderService;
import bitcamp.chopchop.service.ProductService;

@Controller
@RequestMapping("/order")
public class OrderController {
  
  @Resource
  private OrderService orderService;
  @Resource
  private ProductService productService;
  
  @PostMapping("form")
  public void form(int no, int price, Model model, HttpSession session) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    Product product = productService.get(no);
    model.addAttribute("product", product);
    model.addAttribute("loginMember", member);
    System.out.println("-----------------------------------------------------------------");
    System.out.println(member.getMemberNo());
    System.out.println(member.getPostNo());
    System.out.println(member.getBaseAddress());
    System.out.println(member.getDetailAddress());
    System.out.println("-----------------------------------------------------------------");
  }
  
  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("orders", orderService.list());
  }

  @GetMapping("searchbymember")
  public void searchByMember(Model model, HttpSession session) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    model.addAttribute("orders", orderService.searchByMember(member.getMemberNo()));
    model.addAttribute("loginMember", member);
  }
  
  @PostMapping("add")
  public String add(Order order, int no, int price) throws Exception {
    OrderProduct orderProduct = new OrderProduct();
    orderProduct.setOrderNo(order.getOrderNo());
    orderProduct.setProductNo(productService.get(no).getProductNo());
    orderService.insert(order, orderProduct);
    return "redirect:../product/detail?no=" + orderProduct.getProductNo(); // -> 주문 완료 페이지로
  }
  
  @GetMapping("delete")
  public String delete(int no) throws Exception {
    orderService.delete(no);
    return "redirect:list";
  }
  
  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    model.addAttribute("order", orderService.get(no));
  }
  
  @PostMapping("update")
  public String update(Order order) throws Exception {
    OrderProduct orderProduct = new OrderProduct();
    orderProduct.setOrderNo(order.getOrderNo());
    orderService.update(order, orderProduct);
    return "redirect:../product/detail?no=" + orderProduct.getProductNo(); // -> 주문 완료 페이지로
  }
}
