package total.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import total.service.MsgService;
import total.service.MyPageService;

@Controller
public class MyPageController {
	@Autowired
	MyPageService myPageService;
	@Autowired
	MsgService msgService;
	
	@RequestMapping("/myPage")
	@SuppressWarnings("unchecked")
	public String myPageHandle(Map map, HttpSession session) {
		String id = (String)session.getAttribute("logon");
		map.put("info", myPageService.getInfo(id));
		List<String> following = myPageService.getMyFollowingList(id);
		map.put("article", myPageService.getFollowingOrderByDesc(following) );
		map.put("following", myPageService.getFollowingInfoById(following));
		map.put("getMsg", msgService.getMsgById(id));
		map.put("title", "My Page");
		map.put("body", "myPage.jsp");
		return "t_el_title";
	}
	
}
