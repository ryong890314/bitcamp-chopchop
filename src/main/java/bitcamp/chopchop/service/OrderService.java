package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Order;
import bitcamp.chopchop.domain.OrderProduct;

public interface OrderService {
  
  List<Order> list() throws Exception;
  List<Order> searchByMember(int no) throws Exception;
  Order get(int no) throws Exception;
  void insert(Order order, OrderProduct orderProduct) throws Exception;
  void update(Order order, OrderProduct orderProduct) throws Exception;
  void delete(int no) throws Exception;
}
