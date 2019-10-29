package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.OrderDao;
import bitcamp.chopchop.dao.OrderProductDao;
import bitcamp.chopchop.domain.Order;
import bitcamp.chopchop.domain.OrderProduct;
import bitcamp.chopchop.service.OrderService;

@Service
public class DefaultOrderService implements OrderService {

  @Resource
  OrderDao orderDao;
  @Resource
  OrderProductDao orderProductDao;

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
  public void insert(Order order, OrderProduct orderProduct) throws Exception {
    // 주문 정보는 서버에서 처리하고, 회원정보는 로그인 정보 세션에서 가져옴
    orderDao.insert(order);
    orderProductDao.insert(orderProduct);
  }

  @Override
  public void update(Order order, OrderProduct orderProduct) throws Exception {
    orderDao.update(order);
    orderProductDao.update(orderProduct);
  }

  @Override
  public void delete(int no) throws Exception {
    orderProductDao.delete(no);
    orderDao.delete(no);
  }

}
