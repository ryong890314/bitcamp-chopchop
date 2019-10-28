package bitcamp.chopchop.dao;

import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.MyPage;

public interface MyPageDao {

	MyPage detail(String email) throws Exception;

	void update(Member member) throws Exception;

}
