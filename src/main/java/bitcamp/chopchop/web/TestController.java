package bitcamp.chopchop.web;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    
    @RequestMapping("test01")
    public void test01(Model model) throws Exception {
    }
    
    @RequestMapping("test02")
    public void test02(Model model) throws Exception {
    }
    
    @PostMapping("add")
    public String add(Member member) throws Exception {
      testService.insert(member);
      return "redirect:test01";
    }
    
    @RequestMapping(value = "dup", method = RequestMethod.GET)
    public @ResponseBody int dupEmailCheck(String email) throws Exception {
      return testService.dupEmailCheck(email);
    }
    
    
}
