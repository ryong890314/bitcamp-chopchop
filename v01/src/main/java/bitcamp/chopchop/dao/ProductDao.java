package bitcamp.chopchop.dao;

import java.util.List;

import bitcamp.chopchop.domain.Product;

// DAO 사용 규칙을 정의한다.
public interface ProductDao {
  int insert(Product product) throws Exception;
  List<Product> findAll() throws Exception;
  Product findBy(int productNo) throws Exception;
  Product findWithFilesBy(int productNo) throws Exception;
  List<Product> findByKeyword(String searchOption, String keyword) throws Exception; // 검색기능 추가
  int update(Product product) throws Exception;
  int delete(int productNo) throws Exception;
  int increaseViewCount(int productNo) throws Exception;
}

