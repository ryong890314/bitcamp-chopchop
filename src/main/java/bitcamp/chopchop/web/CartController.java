package bitcamp.chopchop.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
  public String delete(int no, HttpServletRequest request) 
      throws Exception {
    cartService.delete(no);
    return "redirect:search?keyword=1";
  }

// 카트 삭제
// @ResponseBody
// @RequestMapping(value = "chkdelete", method = RequestMethod.GET)
@GetMapping("chkdelete")
public String chkdelete(HttpSession session,
     @RequestParam Map<String, String> paramMap, Cart cart) throws Exception {
 
      String[] arrIdx = paramMap.get("chkbox").toString().split(",");
      for (int i = 0; i < arrIdx.length; i++) {
          cartService.delete(Integer.parseInt(arrIdx[i]));
      }
      
      return "redirect:search?keyword=1";
//  MemberVO member = (MemberVO)session.getAttribute("member");
//  String userId = member.getUserId();
 
//  int result = 0;
//  int cartNum = 0;
 
 
//  if(member != null) {
//   cart.setUserId(userId);
  
//   for(String i : chArr) {   
//    cartNum = Integer.parseInt(i);
//    cart.setCartNum(cartNum);
//    cartService.deleteCart(cart);
//   }   
//   result = 1;
//  }  
//  return result;  
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
  public String update(Cart cart, HttpServletRequest request) 
      throws Exception {
    cartService.update(cart);
    return "redirect:list";
  }

  @GetMapping("updateform")
  public void updateform(Model model, int no) throws Exception {
    model.addAttribute("cart", cartService.get(no));
  }

  // 테스트용
  @GetMapping("test")
  public void test(Model model, String keyword) throws Exception {
    List<Cart> carts = cartService.search(keyword);
    model.addAttribute("carts", carts);
  }
}


