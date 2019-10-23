package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Member;

// 역할:
// => 회원 관리 업무를 수행
// => 트랜잭션 제어
// => 여러 페이지 컨트롤러가 사용한다.
//
public interface MemberService {
  List<Member> list() throws Exception;
  Member get(String email, String password) throws Exception;
}










