package total.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import total.domain.WebSocketMap;
import total.service.MailService;
import total.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService memberservice;

	@Autowired
	WebSocketMap wsMap;
	
	@Autowired
	MailService mailservice;
	@RequestMapping("/registpage")
	public String memberPage(Map map) {
		map.put("body", "register.jsp");
		return "t_regist";
	}

	// 회원등록
	@RequestMapping(path = "/regist", method = RequestMethod.POST)
	public String memberRegistHandle(Model model, HttpServletRequest req, @RequestParam Map<String, Object> param,
			HttpSession session, Map map) {
		try {
			if (param != null || !param.equals("")) {
				param.put("image", "/image/default.jsp");
				boolean rst = memberservice.registerMember(param);
				if (rst) {
					session.setAttribute("logon", param.get("id"));
					System.out.println("회원등록성공?");
					return "redirect:/index";
				} else {
					return "/registpage";
				}
			}
				throw new Exception();
		} catch (Exception e) {
			System.out.println("여기?");
			model.addAttribute("idmsg", "아이디를 입력해주세요");
			model.addAttribute("passwordmsg", "비밀번호를 입력해주세요");
			model.addAttribute("emailmsg", "이메일을 입력해주세요");
			map.put("body", "register.jsp");
			return "t_regist";
		}
	}

	@RequestMapping("/log")
	public String memberLoginPage(Map map) {
		map.put("body", "login.jsp");
		return "t_log";
	}

	@RequestMapping(path = "/loging", method = RequestMethod.POST)
	public String memberLoginHandle(Model model, @RequestParam Map<String, String> param, HttpSession session) {
		System.out.println(param);
		boolean rst = memberservice.loginMember(param);
		try {
			if (rst) {
				session.setAttribute("logon", param.get("id"));
				List<WebSocketSession> s = wsMap.get(session.getId());
				System.out.println(wsMap);
				System.out.println(s);
				if (s != null) {
					for (WebSocketSession ws : s) {
						ws.sendMessage(new TextMessage("로그인"));
					}
					return "redirect:/index";
				}
			}
			throw new Exception();
		} catch (Exception e) {
			e.printStackTrace();
			return "/fail";
		}
	}
	
	// 아이디 찾기 페이지
	@RequestMapping("/idsearch")
	public String memberIdHandle() {
		return "/idsearch";
	}
	
	// 아이디 찾기
	@RequestMapping(path="idresult")
	public String memberIdResultHandle(Model model, @RequestParam String id) {
		boolean rst = memberservice.idMember(id);
		if(rst) {
			boolean rst2 = mailservice.sendId
		}
		return "/idresult";
	}
	
	// 비밀번호 찾기 페이지
	@RequestMapping("/passwordsearch")
	public String memberPasswordHandle() {
		return "/password";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/passwordresult")
	public String memberPasswordResultHandle() {
		return "/presult";
	}
}
