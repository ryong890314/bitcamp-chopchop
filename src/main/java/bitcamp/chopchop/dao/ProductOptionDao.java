package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.ProductOption;;

public interface ProductOptionDao {
  int insert(ProductOption productOption) throws Exception;
  List<ProductOption> findAll(ProductOption productOption) throws Exception;
  int deleteAll(int optionNo) throws Exception;
  ProductOption findBy(int no) throws Exception;
}
