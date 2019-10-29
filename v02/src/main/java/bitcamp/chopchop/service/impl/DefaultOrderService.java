package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.OrderDao;
import bitcamp.chopchop.domain.Order;
import bitcamp.chopchop.service.OrderService;

@Service
public class DefaultOrderService implements OrderService {

  @Resource
  OrderDao orderDao;

  @Override
  public List<Order> list() throws Exception {
    return orderDao.findAll();
  }

  @Override
  public List<Order> searchByMember(int no) throws Exception {
    return orderDao.findByMember(no);
  }

  @Override
  public Order get(int no) throws Exception {
    Order order = orderDao.findBy(no);
    if (order == null) {
      throw new Exception("해당 주문 데이터가 없습니다.");
    }
    return order;
  }

  @Override
  public void insert(Order order) throws Exception {
    orderDao.insert(order);
  }

  @Override
  public void update(Order order) throws Exception {
    orderDao.update(order);
  }

  @Override
  public void delete(int no) throws Exception {
    orderDao.delete(no);
  }

}
