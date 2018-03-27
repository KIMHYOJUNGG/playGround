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
	
	@RequestMapping("/getmessage")
	public String GetMessage(Model model, HttpSession session, @RequestParam Map param) {
		int gcnt = Integer.parseInt(param.get("gcnt").toString());
		List<Map> list = adminmsgservice.message();
		model.addAttribute("getmessage",list);
		model.addAttribute("gcnt",gcnt);
		return "/admin/admin_message";
	}
	
	@RequestMapping("/getmessageid")
	public String GetMessageId(Model model, HttpSession session, @RequestParam Map param) {
		Map map = adminmsgservice.messageId(param);
		if(!map.containsKey("fail")) {
			model.addAttribute("msgId",map);
			return "/admin/admin_messageId";
		}
		else {
			return "/admin/admin_fail";
		}
	}
}
