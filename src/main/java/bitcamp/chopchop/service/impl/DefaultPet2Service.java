package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.Pet2Dao;
import bitcamp.chopchop.domain.Pet2;
import bitcamp.chopchop.service.Pet2Service;

@Service
public class DefaultPet2Service implements Pet2Service {
  
  @Resource
  private Pet2Dao pet2Dao;

  @Override
  public List<Pet2> list() throws Exception {
    return pet2Dao.findAll();
  }

  @Override
  public void insert(Pet2 pet2) throws Exception {
    pet2Dao.insert(pet2);
  }

}
