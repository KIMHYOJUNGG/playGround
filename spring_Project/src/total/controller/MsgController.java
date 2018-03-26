package total.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import total.service.MsgService;
import total.service.MyPageService;

@Controller
public class MsgController {
	@Autowired
	MsgService msgService;
	@Autowired
	MyPageService myPageService;
	
	@RequestMapping("/message")
	public String msgHandle(Map map, HttpSession session) {
		String id = (String)session.getAttribute("logon");
		map.put("info", myPageService.getInfo(id));
		map.put("getMsg", msgService.getMsgById(id));
		map.put("title", "우편함");
		map.put("body", "message.jsp");
		return "t_el_title";
	}
	
	
}
