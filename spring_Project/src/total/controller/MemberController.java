
package total.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	// 회원등록 페이지
	@RequestMapping("/registpage")
	public String memberPage(Map map) {
		map.put("body", "register.jsp");
		return "t_el";
	}

	// 회원등록
	@RequestMapping(path = "/regist", method = RequestMethod.POST)
	public String memberRegistHandle(Model model, HttpServletRequest req, @RequestParam Map<String, Object> param,
			HttpSession session, Map map) {
		try {
			if (param.get("checkemail") != null) {
				boolean rst = memberservice.registerMember(param);
				if (rst) {
					model.addAttribute("id", param.get("id"));
					model.addAttribute("email", param.get("email"));
					return "redirect:/member/confirmpage";
				} else {
					return "/registpage";
				}
			} else {
				if (param != null) {
					System.out.println("param" + param);
					boolean rst = memberservice.registerMember(param);

					if (rst) {
						session.setAttribute("logon", param.get("id"));
						return "redirect:/index";
					} else {
						return "/registpage";
					}
				}
				throw new Exception();
			}
		} catch (Exception e) {
			/*
			 * if (param.get("password") != null && param.get("email") != null) {
			 * System.out.println("작동안하냐?"); model.addAttribute("idmsg", "아이디를 입력해주세요"); }
			 * else if (param.get("id") != null && param.get("email") != null) {
			 * System.out.println("이건왜하냐?"); model.addAttribute("passwordmsg",
			 * "비밀번호를 입력해주세요"); } else if (param.get("id") != null && param.get("password")
			 * != null) { System.out.println("이건뭐야?"); model.addAttribute("emailmsg",
			 * "이메일을 입력해주세요"); }
			 */
			e.printStackTrace();
			map.put("body", "register.jsp");
			return "t_el";
		}
	}

	// 아이디 체크
	@RequestMapping(path = "checkid", method = RequestMethod.GET)
	@ResponseBody
	public boolean memberCheckid(Model model, @RequestParam String id, Map map, HttpServletRequest req) {
		Map map2 = memberservice.selectId(id);
		map.put("body", "register.jsp");
		boolean rst = true;
		if (map2 == null) {
			rst = false;
		}
		System.out.println(req.getPathInfo());
		return rst;
	}

	// 이메일인증 번호 보내주기
	@RequestMapping("/confirmpage")
	public String emailConfirm(Model model, HttpSession session, HttpServletRequest req, @RequestParam Map param,
			Map map) {
		System.out.println("여기로 왔니??????? confirm");
		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");
		String num = uuids[0];
		map.put("body", "confirmpage.jsp");
		boolean rst = mailservice.confirm((String) param.get("email"), num);
		if (rst) {
			System.out.println("이메일 인증번호 갔니?");
			session.setAttribute("num", num);
			model.addAttribute("email", param.get("email"));
			model.addAttribute("id", param.get("id"));
			return "t_el";
		} else {
			model.addAttribute("emailfail", "가입실패");
			return "redirect:/registpage";
		}
	}

	// 이메일 인증으로 인한 레벨 증가
	@RequestMapping("confirm")
	public String confirm(@RequestParam Map param, HttpSession session, Model model, Map map) {
		map.put("body", "confirmpage.jsp");
		if ((session.getAttribute("num").toString()).equals(param.get("num2").toString())) {
			int i = memberservice.updateLv((String) param.get("id"));
			if (i != 0) {
				session.setAttribute("logon", param.get("id"));
				String uri = (String) session.getAttribute("uri");
				if (uri != null) {
					return uri;
				} else {
					return "redirect:/index";
				}
			} else {
				model.addAttribute("emailfail", "일치하지 않습니다. 재전송바랍니다.");
				return "t_el";
			}
		} else {
			model.addAttribute("emailfail", "일치하지 않습니다. 재전송바랍니다.");
			return "t_el";
		}
	}

	// 로그인
	@RequestMapping(path = "/log", method = RequestMethod.GET)
	public String memberLoginPage(Model model, Map map) {
		map.put("body", "login.jsp");
		return "t_el";
	}

	// 권한이 제한되었을 때의 페이지이동
	@RequestMapping(path = "/lvup", method = RequestMethod.GET)
	public String lvup(Model model, @RequestParam Map<String, String> param, Map map) {
		map.put("body", "lvpage.jsp");
		return "t_el";
	}

	// 로그인시 lv업(0일시 1로)
	@RequestMapping(path = "/lvup2")
	public String lvup2(Model model, HttpSession session) {
		String id = (String) session.getAttribute("logon");
		String email = (String) session.getAttribute("email");
		System.out.println("아이디" + id);
		System.out.println("이메일" + email);
		// Map map = memberservice.emailMember(id);
		model.addAttribute("email", email);
		model.addAttribute("id", id);
		return "redirect:/member/confirmpage";
	}

	// 로그인 실행
	@RequestMapping(path = "/loging", method = RequestMethod.POST)
	public String memberLoginHandle(Model model, @RequestParam Map<String, String> param, HttpSession session,
			Map mapp) {
		String id = (String) param.get("id");
		String uri = (String) session.getAttribute("uri");
		Map map2 = memberservice.loginMember(param);
		try {
			if (map2 != null) {
				session.setAttribute("logon", param.get("id"));
				int lv = Integer.parseInt(map2.get("LV").toString());
				session.setAttribute("lv", lv);
				System.out.println(session.getAttribute("lv"));
				String email = map2.get("EMAIL").toString();
				session.setAttribute("email", email);
				List<WebSocketSession> s = wsMap.get(session.getId());
				if (s != null) {
					for (WebSocketSession ws : s) {
						ws.sendMessage(new TextMessage("로그인"));
					}
					if (uri != null) {
						return uri;
					} else {
						return "redirect:/index";
					}
				} else {
					if (uri != null) {
						return uri;
					} else {
						return "redirect:/index";
					}
				}
			}
			throw new Exception();
		} catch (Exception e) {
			e.printStackTrace();
			mapp.put("body", "login.jsp");
			Map map = memberservice.selectId(param.get("id"));
			if (map != null) {
				model.addAttribute("passn", "아이디와 비밀번호가 일치하지 않습니다.");
				return "t_el";
			} else {
				model.addAttribute("idn", "해당 아이디가 없습니다.");
				return "t_el";
			}
		}
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logoutHandle(Model model, HttpSession session) {
		try {
			session.removeAttribute("logon");
			List<WebSocketSession> s = wsMap.get(session.getId());
			if (s != null) {
				for (WebSocketSession ws : s) {
					ws.sendMessage(new TextMessage("로그아웃"));
				}
				return "redirect:/index";

			} else {
				return "redirect:/index";
			}
		} catch (Exception e) {
			return "redirect:/";
		}
	}

	// 아이디 찾기 페이지
	@RequestMapping("/idsearch")
	public String memberIdHandle(Map map) {
		map.put("body", "idsearch.jsp");
		return "t_el";
	}

	// 아이디 찾기
	@RequestMapping(path = "idresult", method = RequestMethod.POST)
	public String memberIdResultHandle(Model model, HttpServletRequest req, @RequestParam String email, Map map2) {
		map2.put("body", "login.jsp");
		String addr = req.getLocalAddr();
		Map map = memberservice.idMember(email);
		if (map != null) {
			String id2 = (String) map.get("ID");
			boolean rst2 = mailservice.searchId(email, id2, addr);
			model.addAttribute("idsearch", "이메일을 확인해보세요");
			return "t_el";
		} else {
			model.addAttribute("idwarn", "해당 이메일이 없습니다.");
			return "t_el";
		}
	}

	// 비밀번호 찾기 페이지
	@RequestMapping("/passwordsearch")
	public String memberPasswordHandle(Map map) {
		map.put("body", "password.jsp");
		return "t_el";
	}

	// 비밀번호 찾기
	@RequestMapping(path = "/passwordresult", method = RequestMethod.POST)
	public String memberPasswordResultHandle(Model model, HttpServletRequest req,
			@RequestParam Map<String, String> param, Map map2) {
		map2.put("body", "login.jsp");
		String addr = req.getLocalAddr();
		Map map = memberservice.passwordMember(param);
		if (map != null) {
			String password = (String) map.get("PASSWORD");
			String email = param.get("email");
			boolean rst2 = mailservice.searchPassword(email, password, addr);
			model.addAttribute("idsearch", "이메일을 확인해보세요");
			return "t_el";
		} else {
			model.addAttribute("passwordwarn", "아이디와 이메일이 일치하지 않습니다. 아이디를 재확인 해주세요");
			return "t_el";
		}
	}
}
