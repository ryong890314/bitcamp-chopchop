package bitcamp.chopchop.service;

import org.springframework.stereotype.Service;

import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.MyPage;

@Service
public interface MyPageService {
	
	MyPage detail(String email) throws Exception;

	void update(Member member) throws Exception;

}
