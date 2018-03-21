package total.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import total.service.myPageService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	@Autowired
	myPageService myPageService;
	
	@SuppressWarnings("unchecked")
	public String myPageHandle(Map map, HttpSession session) {
		String id = (String)session.getAttribute("logon");
		map.put("info", myPageService.getInfo(id));
		String[] following = myPageService.splitFollowing((Map)map.get("info"));
		map.put("article", myPageService.getFollowingOrderByAsc(following) );
		map.put("following", myPageService.getFollowingInfoById(following));
		map.put("title", "My Page");
		map.put("body", "myPage.jsp");
		return "t_el_title";
	}
	
}
