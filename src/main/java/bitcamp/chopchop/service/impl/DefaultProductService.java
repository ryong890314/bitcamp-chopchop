package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.chopchop.dao.PhotoFileDao;
import bitcamp.chopchop.dao.ProductDao;
import bitcamp.chopchop.domain.PhotoFile;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.service.ProductService;

@Service
public class DefaultProductService implements ProductService {
  
  @Resource
  private ProductDao productDao;
  @Resource
  private PhotoFileDao photoFileDao;
  
  @Transactional
  @Override
  public void insert(Product product) throws Exception {
    
    if(product.getFiles().size() == 0) {
      throw new Exception("사진 파일이 없습니다.");
    }
    
    productDao.insert(product);
    for (PhotoFile file : product.getFiles()) {
      file.setProductNo(product.getProductNo());
      photoFileDao.insert(file);
    }
  }

  @Transactional
  @Override
  public void delete(int no) throws Exception {
    if (productDao.findBy(no) == null) {
      throw new Exception("해당 데이터가 없습니다.");
    }
    
    photoFileDao.deleteAll(no);
    productDao.delete(no);
  }

  @Override
  public Product get(int no) throws Exception {
    Product product = productDao.findWithFilesBy(no);
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
    
    if(product.getFiles().size() == 0) {
      throw new Exception("사진 파일이 없습니다.");
    }
    
    photoFileDao.deleteAll(product.getProductNo());
    productDao.update(product);
    for (PhotoFile file : product.getFiles()) {
      file.setProductNo(product.getProductNo());
      photoFileDao.insert(file);
    }
  }
}












