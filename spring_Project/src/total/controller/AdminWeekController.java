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
import org.springframework.web.bind.annotation.ResponseBody;

import total.domain.WebSocketMap;
import total.service.AdminService;
import total.service.adminWeekService;

@Controller
@RequestMapping("/week")
public class AdminWeekController {
	@Autowired
	WebSocketMap sessions;

	@Autowired
	AdminService adminservice;
	
	@Autowired
	adminWeekService weekservice;

	// 주간순위창
	@RequestMapping("/weekendtop")
	public String WeekendTop(Model model, HttpSession session) {
		if(session.getAttribute("admin")!=null) {
			List<Map> list = adminservice.weekend();
			model.addAttribute("wlist",list);
			return "/admin/weekview";
		}
		else {
			return "redirect:/admin";
		}
	}
	
	
	// 날짜비교(같은지를 비교하여 같으면 삽입)
	@RequestMapping(path="/weekendequal",produces="application/json;charset=utf-8")
	@ResponseBody
	public String weekendequal(Model model) {
		boolean rst = weekservice.weekendequal();
		if(rst) {
			// model.addAttribute("wsuccess","이번주 베스트 책경쟁에 참여하였습니다.");
			System.out.println("주간순위등록에 성공");
			return "{\"rst\" : "+rst+"}";
		}
		else {
			System.out.println("주간순위등록에 실패");
			return "{\"rst\" : "+rst+"}";
		}
	}
	
	// 책에 속한 게시글의 좋아요가 늘어날때
	@RequestMapping("/goodincrease")
	public String goodincre(Model model,@RequestParam("bno") String bno) {
		int i = weekservice.goodincre(bno);
		if(i!=0) {
			System.out.println("좋아요수 업데이트 완료");
		}
		else {
			System.out.println("좋아요수 업데이트 실패");
		}
		return "";
	}
	
	//============================ 어드민 ================================
	// 어드민 로그인페이지로 갈시의 날짜 비교
	@RequestMapping("/castadmin")
	public String castadmin(){
		int i = weekservice.castweek();
		// 원래는 7일이지만 시간관계상으로 3, 테스트 할 때면 아무거나
		if(i==3) {
			return "redirect:/week/writersearch";
		}else {
			return "admin/admin_log";
		}
	}

	// 결과값이 3으로 나올 시의 우승자 찾기 
	@RequestMapping("writersearch")
	public String writersearch(Model model) {
		Map map = weekservice.search();
		if(map!=null) {
			String bno = map.get("BNO").toString();
			String writer = map.get("WRITER").toString();
			String btitle = map.get("BTITLE").toString();
			System.out.println("bno = " + bno +" , writer = " + writer + " , btitle = " + btitle);
			// 이메일보내주기
			model.addAttribute("bno",bno);
			model.addAttribute("writer",writer);
			model.addAttribute("btitle",btitle);
		}
		else {
			System.out.println("해당 회원의 정보를 찾지 못함");
		}
		return "redirect:/week/publish";
	}
	// 우승자가 나올시 출간테이블(publish)에 정보저장
	@RequestMapping("publish")
	public String publish(@RequestParam Map param) {
		// publish테이블에 이미 있는 책인가
		boolean rst = weekservice.selectBno(param.get("bno").toString());
		if(rst) {
			boolean rst2 = weekservice.insertPb(param);
			if(rst2) {
				System.out.println("삽입성공");
			}else {
				System.out.println("삽입실패");
			}
			return "redirect:/week/updateWeek";
		}
		else {
			// 어드민이 해당 writer한테 축하메세지를 보내기
			return "admin/admin_log";
		}
	}
	// 주간순위 리셋
	@RequestMapping("updateWeek")
	public String updateWeek() {
		int i = weekservice.updateWeek();
		if(i!=0) {
			weekservice.insertWeek();
			System.out.println("업뎃완료");
		}else {
			System.out.println("업뎃실패");
		}
		return "admin/admin_log";
	}
	
	//============================ 인덱스 ================================
	
	// 인덱스페이지로  갈시의 날짜 비교 --- 이거 상의
	@RequestMapping("/castindex")
	public String castindex(){
		int i = weekservice.castweek();
		// 원래는 7일이지만 시간관계상으로 3, 테스트 할 때면 아무거나
		if(i==3) {
			return "redirect:/week/writersearch2";
		}else {
			return "redirect:/index";
		}
	}
	
	// 결과값이 3으로 나올 시의 우승자 찾기 
		@RequestMapping("writersearch2")
		public String writersearch2(Model model) {
			Map map = weekservice.search();
			if(map!=null) {
				String bno = map.get("BNO").toString();
				String writer = map.get("WRITER").toString();
				String btitle = map.get("BTITLE").toString();
				System.out.println("bno = " + bno +" , writer = " + writer + " , btitle = " + btitle);
				// 이메일보내주기
				model.addAttribute("bno",bno);
				model.addAttribute("writer",writer);
				model.addAttribute("btitle",btitle);
			}
			else {
				System.out.println("해당 회원의 정보를 찾지 못함");
			}
			return "redirect:/week/publish2";
		}
		// 우승자가 나올시 출간테이블(publish)에 정보저장
		@RequestMapping("publish2")
		public String publish2(@RequestParam Map param) {
			// publish테이블에 이미 있는 책인가
			boolean rst = weekservice.selectBno(param.get("bno").toString());
			if(rst) {
				boolean rst2 = weekservice.insertPb(param);
				if(rst2) {
					System.out.println("삽입성공");
				}else {
					System.out.println("삽입실패");
				}
				return "redirect:/week/updateWeek2";
			}
			else {
				// 어드민이 해당 writer한테 축하메세지를 보내기
				return "redirect:/index";
			}
		}
		// 주간순위 리셋
		@RequestMapping("updateWeek2")
		public String updateWeek2() {
			int i = weekservice.updateWeek();
			if(i!=0) {
				weekservice.insertWeek();
				System.out.println("업뎃완료");
			}else {
				System.out.println("업뎃실패");
			}
			return "redirect:/index";
		}
}
