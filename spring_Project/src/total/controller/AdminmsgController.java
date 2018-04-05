package total.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import total.domain.WebSocketMap;
import total.service.AdminMsgService;
import total.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminmsgController {
	@Autowired
	WebSocketMap sessions;

	@Autowired
	AdminService adminservice;

	@Autowired
	AdminMsgService adminmsgservice;

	// 받은 메세지함 보기
	@RequestMapping("/getmessage")
	public String GetMessage(Model model, HttpSession session, @RequestParam Map param) {
		int scnt = adminservice.sendMessageCnt();
		int gcnt = Integer.parseInt(param.get("gcnt").toString());
		List<Map> list = adminmsgservice.getmessage();
		model.addAttribute("getmessage", list);
		model.addAttribute("gcnt2", gcnt);
		model.addAttribute("scnt", scnt);
		return "/admin/admin_getmessage";
	}

	// 보낸 메세지함 보기
	@RequestMapping("/sendmessage")
	public String SendMessage(Model model, HttpSession session, @RequestParam Map param) {
		int scnt = Integer.parseInt(param.get("gcnt").toString());
		int gcnt = adminservice.getMessageCnt();
		List<Map> list = adminmsgservice.sendmessage();
		model.addAttribute("getmessage", list);
		model.addAttribute("gcnt", gcnt);
		model.addAttribute("scnt2", scnt);
		return "/admin/admin_sendmessage";
	}

	/*// 받은 메세지함에서 본메일 체크
	@RequestMapping("/getmessageCheck")
	public String GetMessageId(Model model, HttpSession session, @RequestParam Map param) {
		Map map = adminmsgservice.getmessageId(param);
		model.addAttribute("msgId", map);
		return "/admin/admin_messageId";
	}*/
	
	// 받은 메세지함에서 본메일 체크
	@RequestMapping("/getmessageCheck")
	public String GetMessageId(Model model, HttpSession session, @RequestParam int no) {
		Map map = adminmsgservice.getmessageId(no);
		model.addAttribute("msgId", map);
		System.out.println(map);
		return "/admin/admin_messageId";
	}
}
