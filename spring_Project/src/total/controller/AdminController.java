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

	@RequestMapping(method = RequestMethod.GET)
	public String AminHandler(HttpSession session) {
		System.out.println("admin");
		if (session.getAttribute("admin") == null) {
			return "admin/admin_log";
		} else {
			return "redirect:/admin/member";
		}
	}

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

	@RequestMapping("/member")
	public String MemberSelect(Model model, HttpSession session) {
		if (session.getAttribute("admin") != null) {
			List<Map> list = adminservice.memberSelect();
			model.addAttribute("list", list);
			System.out.println(list);
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

	// 관리자가 해당 게시글 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(Model model,@RequestParam("no") int no, RedirectAttributes rttr, Map mapp) throws Exception {
		mapp.put("body", "/admin/admin_member_board_id.jsp");
		boolean rst = adminservice.delete(no);
		if(rst==true) {
			rttr.addFlashAttribute("adminmsg", "success");
			Map map = adminservice.searchId(no);
			System.out.println(map.get("WRITER"));
			if(map!=null) {
				String id = (String)map.get("WRITER");
				boolean rst2 =adminservice.updateRedCard(id);
				if(rst2) {
					int count = adminservice.selectRedcard(id);
					if(count==3) {
						boolean rst3 = adminservice.updateRedCard2(id);
						if(rst3) {
							model.addAttribute("remove","해당 유저의 계정을 정지하였습니다.");
							System.out.println("계정삭제");
							return "redirect:/admin/member";
						}
						else {
							model.addAttribute("fail","해당 유저의 REDCARD를 수정하지 못하였습니다.");
							System.out.println("실패");
							return "t_el";
						}
					}
					else {
						model.addAttribute("remove","삭제되었습니다.");
						System.out.println("계정삭제안함");
						return "redirect:/admin/member";
					}
				}
				else {
					model.addAttribute("fail","업데이트에 실패하였습니다.");
					System.out.println("실패2");
					return "t_el";
				}
			}
			else {
				model.addAttribute("fail","아이디를 찾지 못하였습니다.");
				System.out.println("실패3");
				return "t_el";
			}
			
		}
		else {
			model.addAttribute("fail","삭제하지 못하였습니다.");
			System.out.println("실패4");
			return "t_el";
		}
	}
	//+====> service로 
}
