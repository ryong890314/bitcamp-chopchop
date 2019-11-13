package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.chopchop.domain.Cart;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.Order;
import bitcamp.chopchop.domain.OrderProduct;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.service.CartService;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.OrderService;
import bitcamp.chopchop.service.ProductService;

@Controller
@RequestMapping("/order")
@SessionAttributes("loginUser")
public class OrderController {

  @Resource
  private OrderService orderService;
  @Resource
  private ProductService productService;
  @Resource
  private CartService cartService;
  @Resource
  private MemberService memberService;
  
  
  @PostMapping("form")
  public void form(
      int no, Model model, int quantity, HttpSession session, @
      ModelAttribute("loginUser") Member loginUser) 
          throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    Product product = productService.get(no);

    model.addAttribute("loginUser", member);
    model.addAttribute("product", product); // 주문에서 선택한 상품
    model.addAttribute("quantity", quantity);
  }

  @GetMapping("cartorderform")
  public void cartorderform(HttpSession session, Model model) throws Exception {
    @SuppressWarnings("unchecked")
    List<Cart> selectedProduct = (List<Cart>) session.getAttribute("selected");

    for(Cart cart : selectedProduct) {
      cart.setProduct(productService.get(cart.getProductNo()));
    }
    model.addAttribute("selected", selectedProduct);
    session.setAttribute("selectedProduct", selectedProduct);
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("orders", orderService.list());
  }

  @GetMapping("searchbymember")
  public void searchByMember(
      Model model, HttpSession session, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    List<OrderProduct> orderProducts2 = orderService.searchByMember(member.getMemberNo());

    for(OrderProduct op : orderProducts2) {
      op.setProduct(productService.get(op.getProductNo()));
      op.setOrder(orderService.get(op.getOrderNo()));
    }
    model.addAttribute("loginUser", member);
    model.addAttribute("orderProducts2", orderProducts2);
  }

  @PostMapping("add")
  @Transactional
  public String add(
      HttpSession session, Order order, int no, int optionNo, int quantity, int discountPrice) 
          throws Exception {
    System.out.println(order);
    OrderProduct orderProduct = new OrderProduct();

    orderProduct.setProductNo(productService.get(no).getProductNo());
    orderProduct.setOptionNo(optionNo);
    orderProduct.setQuantity(quantity);
    orderProduct.setDiscountPrice(discountPrice);
    orderService.insert(order);
    orderService.insert(orderProduct, order);
    session.setAttribute("order", order);
    session.setAttribute("orderProduct", orderProduct);

    return "redirect:result";
  }

  @PostMapping("addfromcart")
  @Transactional
  public String addFromCart(HttpSession session, Order order, int optionNo) throws Exception {
    OrderProduct orderProduct = new OrderProduct();

    @SuppressWarnings("unchecked")
    List<Cart> selectedProduct = (List<Cart>) session.getAttribute("selectedProduct");
    orderService.insert(order);
    if (selectedProduct != null) {
      for (Cart cart : selectedProduct) {
        
        orderProduct.setProductNo(cart.getProductNo());
        orderProduct.setOptionNo(optionNo);
        orderProduct.setQuantity(cart.getQuantity());
        orderProduct.setDiscountPrice((cart.getProduct().getPrice() * ((100 - cart.getProduct().getDiscount()) * cart.getQuantity()) / 100));
//        System.out.println("총액은2 " + (cart.getProduct().getPrice() * ((100 - cart.getProduct().getDiscount()) * cart.getQuantity()) / 100));
        orderService.insert(orderProduct, order);
        cartService.delete(cart.getCartNo());
      }
    }
    session.setAttribute("order", order);
    return "redirect:../product/list";
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    orderService.delete(no);
    return "redirect:searchbymember";
  }

  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    model.addAttribute("order", orderService.get(no));
  }

  @PostMapping("update")
  public String update(Order order) throws Exception {
    orderService.update(order);
    return "redirect:searchbymember"; // -> 주문 완료 페이지로
  }

  @GetMapping("result")
  public void result(
      HttpSession session, Order order, OrderProduct orderProduct, Model model) throws Exception {
    order = (Order) session.getAttribute("order");
    orderProduct = (OrderProduct) session.getAttribute("orderProduct");
    model.addAttribute("order", order);
    model.addAttribute("orderProduct", orderProduct);
    model.addAttribute("product", productService.get(orderProduct.getProductNo()));
  }

  @GetMapping("updateform")
  public void updateform(int no, Model model) throws Exception {
    model.addAttribute("order", orderService.get(no));
  }
}
