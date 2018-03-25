package total.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import total.service.FollowService;
import total.service.MyPageService;

@Controller
public class FollowController {
	@Autowired
	MyPageService myPageService;
	@Autowired
	FollowService followService;

	@RequestMapping(path="/follow", produces="application/json;charset=utf-8")
	@ResponseBody
	public String followHandle(@RequestParam String target, HttpSession session) {
		System.out.println("followHandle");
		String id = (String)session.getAttribute("logon");
		Map data = myPageService.getInfo(id);
		boolean rst = followService.addFollowing( ((String)data.get("FOLLOW")), target, id);
		return "{\"result\":"+rst+"}";
	}
}
