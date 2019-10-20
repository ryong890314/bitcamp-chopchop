package bitcamp.chopchop.web;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bitcamp.chopchop.sevice.TestService;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Resource
	private TestService testService;

	@RequestMapping("/form")
	private void form() {
	}
	
	@RequestMapping(value = "/dup", method = RequestMethod.GET)
	public @ResponseBody int dupCheck(String nickname, String email, String gbn) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("nickname", nickname);
		map.put("email", email);
		map.put("gbn", gbn);
		
		return testService.dupCheck(map);
	}
	
//	@RequestMapping(value = "/dup2", method = RequestMethod.GET)
//	public @ResponseBody int dupCheck2(String nickname) throws Exception {
//		return testService.dupCheck2(nickname);
//	}
	
}
