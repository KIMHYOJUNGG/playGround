package total.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import total.domain.WebSocketMap;
import total.service.AdminService;
@Controller
@RequestMapping("/admin" )
public class AdminController {
	@Autowired
	WebSocketMap sessions;
	
	@Autowired
	AdminService adminservice;
	
	@RequestMapping(method=RequestMethod.GET)
	public String AminHandler() {
		System.out.println("admin");
		return "admin/admin_log";
	}
	@RequestMapping(path= "/log",method=RequestMethod.POST)
	public String AdminLogin(Model model, @RequestParam Map<String, String> param, HttpSession session) {
		boolean rst = adminservice.loginMember(param);
		if(rst) {
			session.setAttribute("admin", param.get("id"));
			return "redirect:/admin/member";
		}
		else {
			return "/admin/admin_fail";
		}
	}
	@RequestMapping("/member")
	public String MemberSelect(Model model) {
		System.out.println("리스트가 안뽑히니?");
		List<Map> list = adminservice.memberSelect();
		model.addAttribute("list",list);
		return "/admin/admin_main";
	}
}
