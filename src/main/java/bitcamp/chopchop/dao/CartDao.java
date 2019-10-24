package bitcamp.chopchop.dao;

import java.util.List;

import bitcamp.chopchop.domain.Cart;

public interface CartDao {
  int insert(Cart cart) throws Exception;
  List<Cart> findAll() throws Exception;
  List<Cart> findByKeyword(String species) throws Exception;
  Cart findBy(int no) throws Exception;
  int update(Cart cart) throws Exception;
  int delete(int no) throws Exception;
  
}
