package bitcamp.chopchop.sevice.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.MemberDao;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.sevice.MemberService;

@Service
public class DefaultMemberService implements MemberService{
  
  @Resource
  private MemberDao memberDao;

  @Override
  public List<Member> list() throws Exception {
    return memberDao.findAll();
  }

  @Override
  public void insert(Member member) throws Exception {
    memberDao.insert(member);
  } 

}
