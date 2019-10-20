package bitcamp.chopchop.sevice;

import java.util.HashMap;

import org.springframework.stereotype.Service;

@Service
public interface TestService {
	//int dupCheck(String nickname, String email, String gbn) throws Exception;
//	int dupCheck2(String nickname) throws Exception;

	int dupCheck(HashMap<String, Object> map) throws Exception;

}
