package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Product;

public interface ProductDao {
  int insert(Product product) throws Exception;
  List<Product> findAll() throws Exception;
  Product findBy(int no) throws Exception;
  Product findWithFilesBy(int no) throws Exception;
  int update(Product product) throws Exception;
  int delete(int no) throws Exception;
}
