package bitcamp.chopchop.service;

import java.util.List;

import bitcamp.chopchop.domain.Cart;

public interface CartService {
  List<Cart> list() throws Exception;
  List<Cart> search(String keyword) throws Exception;
  Cart get(int no) throws Exception;
  void insert(Cart cart) throws Exception;
  void update(Cart cart) throws Exception;
  void delete(int no) throws Exception;
}
