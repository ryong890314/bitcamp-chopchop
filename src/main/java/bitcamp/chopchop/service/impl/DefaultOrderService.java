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
  OrderDao storeOrderDao;
  
  @Override
  public List<Order> list() throws Exception {
    return storeOrderDao.findAll();
  }

  @Override
  public List<Order> searchByMember(int no) throws Exception {
    return storeOrderDao.findByMember(no);
  }

  @Override
  public Order get(int no) throws Exception {
    Order storeOrder = storeOrderDao.findBy(no);
    if (storeOrder == null) {
      throw new Exception("해당 주문 데이터가 없습니다.");
    }
    return storeOrder;
  }

  @Override
  public void insert(Order storeOrder) throws Exception {
    storeOrderDao.insert(storeOrder);
  }

  @Override
  public void update(Order storeOrder) throws Exception {
    storeOrderDao.update(storeOrder);
  }

  @Override
  public void delete(int no) throws Exception {
    storeOrderDao.delete(no);
  }

}
