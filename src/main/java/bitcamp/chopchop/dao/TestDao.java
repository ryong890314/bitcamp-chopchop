package bitcamp.chopchop.dao;

import java.util.HashMap;

public interface TestDao {
	//int dupCheck(String nickname, String email, String gbn) throws Exception;
//	int dupCheck2(String nickname) throws Exception;

	int dupCheck(HashMap<String, Object> map) throws Exception;

}
