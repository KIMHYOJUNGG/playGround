package total.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import total.domain.BoardVO;
import total.domain.WebSocketMap;
import total.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	WebSocketMap sessions;

	@Autowired
	AdminService adminservice;

	// 로그인창 보내기
	@RequestMapping(method = RequestMethod.GET)
	public String AminHandler(HttpSession session) {
		if (session.getAttribute("admin") == null) {
			return "admin/admin_log";
		} else {
			return "redirect:/admin/member";
		}
	}

	// 로그인 실행
	@RequestMapping(path = "/log", method = RequestMethod.POST)
	public String AdminLogin(Model model, @RequestParam Map<String, String> param, HttpSession session) {
		boolean rst = adminservice.loginMember(param);
		if (rst) {
			session.setAttribute("admin", param.get("id"));
			return "redirect:/admin/member";
		} else {
			return "/admin/admin_fail";
		}
	}

	// 회원목록
	@RequestMapping("/member")
	public String MemberSelect(Model model, HttpSession session, @RequestParam Map param) {
		if (session.getAttribute("admin") != null) {
			List<Map> list = adminservice.memberSelect();
			int cnt = adminservice.getMessageCnt();
			model.addAttribute("gcnt", cnt);
			model.addAttribute("list", list);
			if(param.get("success")!=null) {
				model.addAttribute("success",param.get("success"));
			}
			return "/admin/admin_main";
		} else {
			return "redirect:/admin";
		}
	}

	// 아이디로 게시글목록 보기
	@RequestMapping(path = "/listid", method = RequestMethod.GET)
	public String listId(Model model, @RequestParam String id, HttpSession session) {
		if (session.getAttribute("admin") != null) {
			List<Map> list = adminservice.boardIdSelect(id);
			model.addAttribute("writerid", id);
			model.addAttribute("boardlist", list);
			return "/admin/admin_member_board";
		} else {
			return "redirect:/admin";
		}
	}

	// 신고글 보기
	@RequestMapping(value = "/readRed", method = RequestMethod.GET)
	public String readRed(@RequestParam("no") int no, Model model, HttpSession session) throws Exception {
		if (session.getAttribute("admin") != null) {
			BoardVO vo = adminservice.read(no);
			model.addAttribute("title", vo.getTitle());
			model.addAttribute("reportlist", adminservice.readNo(no));
			return "/admin/admin_member_red";
		} else {
			return "redirect:/admin";
		}
	}

	// 게시글번호로 해당 게시글 보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("no") int no, Model model, HttpSession session, Map map) throws Exception {
		map.put("body", "/admin/admin_member_board_id.jsp");
		if (session.getAttribute("admin") != null) {
			String contents = adminservice.mongoFind(no);
			model.addAttribute("admin", adminservice.read(no));
			model.addAttribute("contents", contents);
			return "t_el";
		} else {
			return "redirect:/admin";
		}
	}

	// =========================================================================================================
	// 게시글 삭제전 report
	@RequestMapping(path = "/remove", method = RequestMethod.POST)
	public String removeHandle(Model model, @RequestParam Map param) throws Exception {
		String id = (String) param.get("id");
		int no = Integer.parseInt((String) param.get("no"));
		boolean rst = adminservice.deletereport(no);
		if (rst) {
			model.addAttribute("id", id);
			model.addAttribute("no", no);
			return "redirect:/admin/removebd";
		} else {
			model.addAttribute("fail", "리포트삭제실패");
			return "/admin/admin_member_board";
		}
	}

	// 관리자가 해당 게시글 삭제
	@RequestMapping(path = "/removebd", method = RequestMethod.GET)
	public String removebdHandle(Model model, @RequestParam Map param) throws Exception {
		String id = (String) param.get("id");
		int no = Integer.parseInt((String) param.get("no"));
		String title = adminservice.title(no);
		if (title != null) {
			model.addAttribute("title", title);
			boolean rst = adminservice.delete(no);
			if (rst) {
				model.addAttribute("id", id);
				model.addAttribute("no", no);
				return "redirect:/admin/redcard";
			} else {
				model.addAttribute("fail", "삭제에 실패하였습니다.");
				return "/admin/admin_member_board";
			}
		} else {
			return "/admin/admin_member_board";
		}
	}

	// 회원의 레드카드 수 변경
	@RequestMapping(path = "redcard", method = RequestMethod.GET)
	public String redcardHandle(Model model, @RequestParam Map param) {
		String id = (String) param.get("id");
		int no = Integer.parseInt(param.get("no").toString());
		int i = adminservice.selectRedcard(id);
		if (i == 2) {
			boolean rst = adminservice.updateRedCard2(id);
			if (rst) {
				model.addAttribute("id", id);
				model.addAttribute("title", param.get("title"));
				return "redirect:/admin/msg";
			} else {
				model.addAttribute("fail", "업데이트 실패(레드카드수3개)");
				return "/admin/admin_member_board";
			}
		} else {
			boolean rst = adminservice.updateRedCard(id);
			if (rst) {
				model.addAttribute("id", id);
				model.addAttribute("title", param.get("title"));
				return "redirect:/admin/msg";
			} else {
				model.addAttribute("fail", "업데이트 실패(레드카드수3개 이하)");
				return "/admin/admin_member_board";
			}
		}
	}

	// 관리자가 해당 게시글의 유저한테 메세지보냄
	@RequestMapping(path = "msg", method = RequestMethod.GET)
	public String msgHandle(Model model, @RequestParam Map param) {
		String id = (String)param.get("id");
		boolean rst = adminservice.msgSend(param);
		boolean rst2= adminservice.updateMemberreport(id);
		if (rst) {
			model.addAttribute("success", param.get("title")+"을 삭제하였습니다.");
			System.out.println("리포트수정됬냐"+rst2);
			adminservice.updateMemberreport(id);
			return "redirect:/admin/member";
		} else {
			model.addAttribute("fail", "메세지를 보내지 못했습니다.");
			return "redirect:/admin/member";
		}
	}
	
	// 해당 게시글에 이상없을 때
	@RequestMapping(path="/modify",method=RequestMethod.POST)
	public String modifyHandle(Model model, @RequestParam Map param) {
		String id = (String)param.get("id");
		boolean rst = adminservice.modify(param);
		if(rst) {
			adminservice.updateMemberreport(id);
			return "redirect:/admin/member";
		}
		else {
			model.addAttribute("fail","실패");
			System.out.println("실패했네 수정");
			return "/admin/admin_main";
		}
	}
}
