package bitcamp.chopchop.service.impl;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.MemberDao;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

// MemberService 기본 구현체 
//
@Service
public class DefaultMemberService implements MemberService {

  @Resource
  private MemberDao memberDao;

  @Override
  public Member get(String email, String password) throws Exception {
    HashMap<String,Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);
    Member member = memberDao.findByEmailPassword(params);
    if (member == null) {
      throw new Exception(email  + "====" +  password + "해당 번호의 데이터가 없습니다!");
    } 
    return member;
  }

  @Override
  public List<Member> list() throws Exception {
    return memberDao.findAll();
  }
}
