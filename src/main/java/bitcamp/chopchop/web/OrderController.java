package bitcamp.chopchop.web;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Cart;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.Order;
import bitcamp.chopchop.domain.OrderProduct;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.service.CartService;
import bitcamp.chopchop.service.OrderService;
import bitcamp.chopchop.service.ProductService;

@Controller
@RequestMapping("/order")
public class OrderController {
  
  @Resource
  private OrderService orderService;
  @Resource
  private ProductService productService;
  @Resource
  private CartService cartService;
  
  @PostMapping("form")
  public void form(int no, Model model, int quantity, HttpSession session) throws Exception {
    Product product = productService.get(no);
    
    model.addAttribute("product", product); // 주문에서 선택한 상품
    model.addAttribute("quantity", quantity);
  }
  
  @SuppressWarnings("unchecked")
  @PostMapping("cartorderform")
  public void cartorderform(HttpSession session, Model model) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    List<Cart> carts = cartService.search(member.getMemberNo());
    List<Cart> selectedProduct = (List<Cart>) session.getAttribute("selected");
    List<Product> products = new ArrayList<>();
    
    for(Cart cart : carts) {
      products.add(productService.get(cart.getProductNo()));
    }
    
    if(selectedProduct == null) {
      model.addAttribute("carts", carts);
    } else {
      model.addAttribute("selected", selectedProduct);
    }
    model.addAttribute("products", products); // 장바구니에서 넘어온 상품
  }
  
  
  
  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("orders", orderService.list());
  }

  @GetMapping("searchbymember")
  public void searchByMember(Model model, HttpSession session) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    List<Order> orders = new ArrayList<>();
    List<OrderProduct> orderProducts = new ArrayList<>();
    
    for (Order order : orderService.list()) {
      if(order.getMemberNo() == member.getMemberNo()) {
        orders.add(order);
        orderProducts.add(orderService.getOrderProduct(order.getOrderNo()));
      }
    }
    
    for(OrderProduct op : orderProducts) {
      op.setProduct(productService.get(op.getProductNo()));
      op.setOrder(orderService.get(op.getOrderNo()));
      System.out.println(op.getOrderNo());
      
    }
    model.addAttribute("orders", orders);
    model.addAttribute("orderProducts", orderProducts);
  }
  
  @PostMapping("add")
  public String add(
      HttpSession session, Order order, int no, int optionNo, int quantity, int discountPrice) 
          throws Exception {
    OrderProduct orderProduct = new OrderProduct();
    orderProduct.setOrderNo(order.getOrderNo());
    orderProduct.setProductNo(productService.get(no).getProductNo());
    orderProduct.setOptionNo(optionNo);
    orderProduct.setQuantity(quantity);
    orderProduct.setDiscountPrice(discountPrice);
    orderService.insert(order, orderProduct);
    session.setAttribute("order", order);
    session.setAttribute("orderProduct", orderProduct);
    return "redirect:result"; // -> 주문 완료 페이지로
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
