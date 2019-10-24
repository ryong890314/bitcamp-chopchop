package bitcamp.chopchop.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.MyPageDao;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.MyPage;
import bitcamp.chopchop.service.MyPageService;

@Service
public class DefaultMyPageService implements MyPageService {
	
	@Resource
	private MyPageDao myPageDao;
	
	@Override
	public MyPage get(int memberNo) throws Exception {
		MyPage myPage = myPageDao.findBy(memberNo);
		if (myPage == null) {
			throw new Exception("해당 번호의 데이터가 없습니다.");
		}
		return myPage;
	}

	@Override
	public void update(Member member) throws Exception {
		myPageDao.update(member);
	}

}
