package bitcamp.chopchop.sevice;

import java.util.List;
import bitcamp.chopchop.domain.Member;

public interface MemberService {

  List<Member> list() throws Exception;
  void insert(Member member) throws Exception;
  int dupEmailCheck(String email) throws Exception;
  int dupNicknameCheck(String nickname) throws Exception;

}
