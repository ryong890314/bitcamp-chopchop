package bitcamp.chopchop.service.impl;

import java.sql.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.StoreOrderDao;
import bitcamp.chopchop.domain.StoreOrder;
import bitcamp.chopchop.service.StoreOrderService;

@Service
public class DefaultStoreOrderService implements StoreOrderService {
  
  @Resource
  StoreOrderDao storeOrderDao;
  
  @Override
  public List<StoreOrder> list() throws Exception {
    return null;
  }

  @Override
  public List<StoreOrder> searchByKeyword(String keyword) throws Exception {
    return null;
  }

  @Override
  public List<StoreOrder> searchByDate(Date orderDate) throws Exception {
    return null;
  }

  @Override
  public StoreOrder get(int no) throws Exception {
    StoreOrder storeOrder = storeOrderDao.findBy(no);
    if (storeOrder == null) {
      throw new Exception("해당 주문 데이터가 없습니다.");
    }
    
    return null;
  }

  @Override
  public void insert(StoreOrder storeOrder) throws Exception {

  }

  @Override
  public void update(StoreOrder storeOrder) throws Exception {

  }

  @Override
  public void delete(StoreOrder storeOrder) throws Exception {

  }

}
