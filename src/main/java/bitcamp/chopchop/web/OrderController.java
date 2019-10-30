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
  public void form(int no, Model model) throws Exception {
    Product product = productService.get(no);
    model.addAttribute("product", product);
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
  public String add(Order order, int no, Model model) throws Exception {
    OrderProduct orderProduct = new OrderProduct();
    orderProduct.setOrderNo(order.getOrderNo());
    orderProduct.setProductNo(productService.get(no).getProductNo());
    orderService.insert(order, orderProduct);
    model.addAttribute("order", order);
    model.addAttribute("orderProduct", orderProduct);
    return "redirect:result"; // -> 주문 완료 페이지로
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
  
  @GetMapping("result")
  public void result(Order order, Model model) throws Exception {
    System.out.println("-----------------번호는 " + order + "--------------------");
    model.addAttribute("order", order);
  }
}
