package bitcamp.chopchop.web;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bitcamp.chopchop.domain.Member;
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
	
	@PostMapping("add")
	  public String add(Member member) throws Exception {
		testService.insert(member);
	    return "redirect:form";
	  }
	
	
}
