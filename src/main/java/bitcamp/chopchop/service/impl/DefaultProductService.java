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

// ProductService 기본 구현체 
//
@Service
public class DefaultProductService implements ProductService {

  @Resource
  private ProductDao productDao;
  @Resource
  private PhotoFileDao photoFileDao;

  @Transactional
  @Override
  public void insert(Product product) throws Exception {
    if (product.getFiles().size() == 0) {
      throw new Exception("사진 파일 없음!");
    }
    productDao.insert(product);
    for (PhotoFile file : product.getFiles()) {
      // 사진 파일 데이터를 저장하기 전에,
      // 이전에 저장한 사진 게시물 번호를 먼저 설정한다.
      // 사진 파일 데이터를 저장할 때 이 게시물 번호를 사용하기 때문이다.
      file.setProductNo(product.getProductNo()); 
    photoFileDao.insert(file);
  }
  }
  
  @Transactional
  @Override
  public void delete(int productNo) throws Exception {
    if (productDao.findBy(productNo) == null) {
      throw new Exception("해당 데이터가 없습니다.");
    }
    photoFileDao.deleteAll(productNo);
    productDao.delete(productNo);
  }

  @Override
  public Product get(int productNo) throws Exception {
    Product product = productDao.findWithFilesBy(productNo);
    if (product == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    } 
    productDao.increaseViewCount(productNo);
    return product;
  }

  @Override
  public List<Product> list() throws Exception {
    return productDao.findAll();
  }

  @Transactional
  @Override
  public void update(Product product) throws Exception {
    if (product.getFiles().size() == 0) {
      throw new Exception("사진 파일 없음!");
    }

    productDao.update(product);
    photoFileDao.deleteAll(product.getProductNo());
    for (PhotoFile file : product.getFiles()) {
      // 사진 파일 데이터를 저장하기 전에,
      // 이전에 저장한 사진 게시물 번호를 먼저 설정한다.
      // 사진 파일 데이터를 저장할 때 이 게시물 번호를 사용하기 때문이다.
      file.setProductNo(product.getProductNo()); 
      photoFileDao.insert(file);
    }
  }
}
