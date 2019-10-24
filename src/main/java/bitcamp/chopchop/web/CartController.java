package bitcamp.chopchop.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import bitcamp.chopchop.domain.Cart;
import bitcamp.chopchop.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

  @Resource
  private CartService cartService;

  @GetMapping("form")
  public void form() {
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("carts", cartService.list());
  }

  @PostMapping("add")
  public String add(Cart cart, Model model) throws Exception {

    cartService.insert(cart);
    model.addAttribute("cart", cart);
    return "redirect:../cart/detail?no=" + cart.getCartNo();
  }

  @GetMapping("delete")
  public String delete(int no, HttpServletRequest request, int cartNo) 
      throws Exception {
    cartService.delete(no);
    return "redirect:../cart/detail?no="+ cartNo;
  }

  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    model.addAttribute("cart", cartService.get(no));
  }

  @GetMapping("search")
  public void search(Model model, String keyword) throws Exception {
    List<Cart> carts = cartService.search(keyword);
    model.addAttribute("carts", carts);
  }

  @PostMapping("update")
  public String update(Cart cart, HttpServletRequest request, int cartNo) 
      throws Exception {
    cartService.update(cart);
    return "redirect:../cart/detail?no=" + cartNo;
  }

  @GetMapping("updateform")
  public void updateform(Model model, int no) throws Exception {
    model.addAttribute("cart", cartService.get(no));
  }
}


