package total.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import total.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService memberservice;
	@RequestMapping("/registpage")
	public String memberPage(Map map) {
		map.put("body", "register.jsp");
		return "t_regist";
	}
	@RequestMapping(path="/regist", method=RequestMethod.POST)
	public String memberRegistHandle(Model model, @RequestParam Map<String,Object> param, HttpSession session) {
		boolean rst = memberservice.registerMember(param);
		session.setAttribute("logon", param.get("id"));
		if(rst) {
			return "redirect:/index";
		}
		else {
			return "/registpage";
		}
	}
	@RequestMapping("/log")
	public String memberLoginPage(Map map) {
		map.put("body", "login.jsp");
		return "t_log";
	}
	@RequestMapping(path="/loging" , method=RequestMethod.POST)
	public String memberLoginHandle(Model model, @RequestParam Map<String,String> param, HttpSession session) {
		System.out.println(param);
		boolean rst = memberservice.loginMember(param);
		if(rst) {
			session.setAttribute("logon", param.get("id"));
			return "redirect:/index";
		}else {
			return "/fail";
		}
	}
	
}
