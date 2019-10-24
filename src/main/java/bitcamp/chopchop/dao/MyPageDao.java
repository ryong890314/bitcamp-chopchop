package bitcamp.chopchop.dao;

import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.MyPage;

public interface MyPageDao {
	MyPage findBy(int memberNo) throws Exception;
	void update(Member member) throws Exception;

}
