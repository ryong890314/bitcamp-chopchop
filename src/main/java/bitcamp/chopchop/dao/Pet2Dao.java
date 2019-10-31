package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Pet2;

public interface Pet2Dao {
  List<Pet2> findAll() throws Exception;
  int insert(Pet2 pet2) throws Exception;

}
