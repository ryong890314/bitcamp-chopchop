package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.StoreOrder;

public interface StoreOrderDao {
  void insert(StoreOrder storeOrder) throws Exception; // 주문하기 버튼
  List<StoreOrder> findAll() throws Exception; // 전체 주문 조회(관리자용)
  List<StoreOrder> findByMember(int no) throws Exception; // 회원 주문내역조회(회원 번호)
  StoreOrder findBy(int no) throws Exception; // 개별 주문 조회
  void update(StoreOrder storeOrder) throws Exception;
  void delete(int no) throws Exception;
}
