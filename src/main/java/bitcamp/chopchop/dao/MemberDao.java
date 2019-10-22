package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Member;

public interface MemberDao {

  List<Member> findAll() throws Exception;
  int insert(Member member) throws Exception;
  int dupEmailCheck(String email) throws Exception;
  int dupNicknameCheck(String nickname) throws Exception;
  
}
