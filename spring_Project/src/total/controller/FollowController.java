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
@RequestMapping("/follow")
public class FollowController {
	@Autowired
	MyPageService myPageService;
	@Autowired
	FollowService followService;

	@RequestMapping(produces="application/json;charset=utf-8")
	@ResponseBody
	public String followHandle(@RequestParam String target, HttpSession session) {
		System.out.println("followHandle");
		String id = (String)session.getAttribute("logon");
		Map data = new HashMap<>();
			data.put("reader", id);
			data.put("target", target);
		boolean rst = followService.addFollowing(data);
		return "{\"result\":"+rst+"}";
	}
	
	@RequestMapping(path="/cancle", produces="application/json;charset=utf-8")
	@ResponseBody
	public String cancleHandle(@RequestParam String target, HttpSession session) {
		System.out.println("cancleHandle");
		String id = (String)session.getAttribute("logon");
		Map data = new HashMap<>();
			data.put("reader", id);
			data.put("target", target);
		boolean rst = followService.dropFollowing(data);
		return "{\"result\":"+rst+"}";
	}
	
}
