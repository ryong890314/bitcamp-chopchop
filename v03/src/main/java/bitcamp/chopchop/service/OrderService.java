package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Order;

public interface OrderService {
  
  List<Order> list() throws Exception;
  List<Order> searchByMember(int no) throws Exception;
  Order get(int no) throws Exception;
  void insert(Order order) throws Exception;
  void update(Order order) throws Exception;
  void delete(int no) throws Exception;
}
