package bitcamp.chopchop.dao;

import bitcamp.chopchop.domain.OrderProduct;

public interface OrderProductDao {
  void insertOrderProduct(OrderProduct orderProduct) throws Exception;
  void updateOrderProduct(OrderProduct orderProduct) throws Exception;
  void deleteOrderProduct(int no) throws Exception;
}
