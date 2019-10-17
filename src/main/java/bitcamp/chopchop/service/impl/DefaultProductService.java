package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.ProductDao;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.service.ProductService;

// ProductService 기본 구현체 
//
@Service
public class DefaultProductService implements ProductService {

  @Resource
  private ProductDao productDao;

  @Override
  public void insert(Product product) throws Exception {
    productDao.insert(product);
  }

  @Override
  public void delete(int no) throws Exception {
    if (productDao.delete(no) == 0) {
      throw new Exception("해당 데이터가 없습니다.");
    }
  }

  @Override
  public Product get(int no) throws Exception {
    Product product = productDao.findBy(no);
    if (product == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    } 
    return product;
  }

  @Override
  public List<Product> list() throws Exception {
    return productDao.findAll();
  }

  @Override
  public void update(Product product) throws Exception {
    productDao.update(product);
  }
}
