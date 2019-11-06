package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Order;

public interface OrderDao {
  void insert(Order storeOrder) throws Exception; // 주문하기 버튼
  List<Order> findAll() throws Exception; // 전체 주문 조회(관리자용)
  List<Order> findByMember(int no) throws Exception; // 회원 주문내역조회(회원 번호)
  Order findBy(int no) throws Exception; // 개별 주문 조회, 동적 sql로 기간 키워드 조회하기
  void update(Order storeOrder) throws Exception;
  void delete(int no) throws Exception; // 주문 취소
}
