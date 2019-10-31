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
import bitcamp.chopchop.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
  
  @Resource
  private OrderService orderService;
  
  @GetMapping("form")
  public void form() {
  }
  
  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("orders", orderService.list());
  }

  @GetMapping("searchbymember")
  public void searchByMember(Model model, HttpSession httpSession) throws Exception {
    Member member = (Member) httpSession.getAttribute("loginUser");
    model.addAttribute("orders", orderService.searchByMember(member.getMemberNo()));
    model.addAttribute("loginMember", member);
  }
  
  @PostMapping("add")
  public String add(Order order, OrderProduct orderProduct) throws Exception {
    orderService.insert(order);
    return "redirect:../product/detail?no=" + orderProduct.getProductNo();
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
  public String update(Order order, OrderProduct orderProduct) throws Exception {
    orderService.update(order);
    return "redirect:../product/detail?no" + orderProduct.getProductNo();
  }
}
