package bitcamp.chopchop.web;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import bitcamp.chopchop.domain.Cart;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.service.CartService;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.ProductService;

@Controller
@RequestMapping("/cart")
public class CartController {

  @Resource
  private CartService cartService;
  @Resource
  private MemberService memberService;
  @Resource
  private ProductService productService;

  @GetMapping("form")
  public void form() {
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("carts", cartService.list());
  }

  @PostMapping("add")
  public String add(Cart cart, Product product, int no, Model model, HttpSession session) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    cart.setMemberNo(member.getMemberNo());
    cart.setProductNo(productService.get(no).getProductNo());
    cartService.insert(cart);

    return "redirect:search";
  }

  // button delete
  @GetMapping("delete")
  public String delete(int no, HttpServletRequest request) 
      throws Exception {
    cartService.delete(no);
    return "redirect:search";
  }

  // checkbox delete controller
  @GetMapping("chkdelete")
  public String chkdelete(HttpSession session,
      @RequestParam Map<String, String> paramMap, Cart cart) throws Exception {

    String[] arrIdx = paramMap.get("chkbox").toString().split(",");
    for (int i = 0; i < arrIdx.length; i++) {
      cartService.delete(Integer.parseInt(arrIdx[i]));
    }
    return "redirect:search";
  }

  @GetMapping("chkoption")
  public String chkoption(
      HttpSession session, @RequestParam Map<String, String> paramMap, Cart cart) throws Exception {
    System.out.println("들어왔나");
    String[] arrIdx = paramMap.get("chkbox").toString().split(",");
    List<Cart> selected = new ArrayList<>();
    for (int i = 0; i < arrIdx.length; i++) {
      selected.add(cartService.get(Integer.parseInt(arrIdx[i])));
    }
    for (Cart tempCart : selected) {
      System.out.println(tempCart.getOptionNo());
      tempCart.setProductOption(cartService.getOption(tempCart.getOptionNo()));
    }
    
    session.setAttribute("selected", selected);
    return "redirect:../order/cartorderform";
  }

  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    model.addAttribute("cart", cartService.get(no));
  }

  @GetMapping("search")
  public void search(Model model, HttpSession session) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    List<Cart> carts = cartService.search(member.getMemberNo());
    model.addAttribute("carts", carts);
  }

  @PostMapping("update")
  public String update(Cart cart, HttpServletRequest request) 
      throws Exception {
    System.out.println("나와라~");
    cartService.update(cart);
    return "redirect:search";
  }

  // 테스트용
  // @PostMapping("update")
  // @ResponseBody
  // public String update(Cart cart, HttpServletRequest request) 
  //     throws Exception {
  //       System.out.println("나와라~");
  //   cartService.update(cart);
  //   return "redirect:search";
  // }

  // 테스트용
  @GetMapping("test")
  public void test(Model model, HttpSession session) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    System.out.println("test" + member.getMemberNo());
    List<Cart> carts = cartService.search(member.getMemberNo());

    // Member member = memberService.get(no);
    model.addAttribute("carts", carts);
  }
}


