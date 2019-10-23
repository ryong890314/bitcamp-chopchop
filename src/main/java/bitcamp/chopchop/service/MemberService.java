package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Member;

public interface MemberService {
  List<Member> list() throws Exception;
  Member get(String email, String password) throws Exception;
}
