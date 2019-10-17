package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Member;

public interface MemberDao {

  List<Member> findAll() throws Exception;
  void insert(Member member) throws Exception;

}
