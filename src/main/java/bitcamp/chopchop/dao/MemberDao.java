package bitcamp.chopchop.dao;

import java.util.List;
import java.util.Map;
import bitcamp.chopchop.domain.Member;

public interface MemberDao {

  List<Member> findAll() throws Exception;
  Member findByEmailPassword(Map<String,Object> params) throws Exception;
}
