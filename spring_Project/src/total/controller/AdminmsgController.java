package total.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import total.domain.WebSocketMap;
import total.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminmsgController {
	@Autowired
	WebSocketMap sessions;

	@Autowired
	AdminService adminservice;
	
	@RequestMapping("/getmessage")
	public String GetMessage(Model model, HttpSession session) {
		
	}
}
