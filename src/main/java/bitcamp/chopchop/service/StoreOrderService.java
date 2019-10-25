package bitcamp.chopchop.service;

import java.sql.Date;
import java.util.List;
import bitcamp.chopchop.domain.StoreOrder;

public interface StoreOrderService {
  
  List<StoreOrder> list() throws Exception;
  List<StoreOrder> searchByKeyword(String keyword) throws Exception;
  List<StoreOrder> searchByDate(Date orderDate) throws Exception;
  StoreOrder get(int no) throws Exception;
  void insert(StoreOrder storeOrder) throws Exception;
  void update(StoreOrder storeOrder) throws Exception;
  void delete(StoreOrder storeOrder) throws Exception;
}
