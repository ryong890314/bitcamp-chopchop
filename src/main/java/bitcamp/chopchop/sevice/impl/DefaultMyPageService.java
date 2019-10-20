package bitcamp.chopchop.sevice.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bitcamp.chopchop.dao.MyPageDao;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.MyPage;
import bitcamp.chopchop.sevice.MyPageService;

@Service
public class DefaultMyPageService implements MyPageService {
	
	@Resource
	private MyPageDao myPageDao;
	
	@Override
	public MyPage detail(String email) throws Exception {
		return myPageDao.detail(email);
	}

	@Override
	public void update(Member member) throws Exception {
		myPageDao.update(member);
	}

}
