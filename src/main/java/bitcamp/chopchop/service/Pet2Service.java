package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Pet2;

public interface Pet2Service {
  List<Pet2> list() throws Exception;
  void insert(Pet2 pet2) throws Exception;

}
