package total.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import total.service.MyPageService;
import total.service.WriterPageService;

@Controller
public class WriterPageController {
	@Autowired
	MyPageService  myPageService;
	@Autowired
	WriterPageService writerPageService;
	
	@RequestMapping("/@{id}")
	public String writerPageHandle(@PathVariable String id, Map map) {
		map.put("writerInfo", myPageService.getInfo(id));
		map.put("contentList", writerPageService.getContentsListById(id));
		map.put("bookList", writerPageService.getBookListById(id));
		map.put("body", "writerPage.jsp");
		map.put("title", id+"의 PlayGround");
		return "t_el_title";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/@{id}/following")
	public String followingPageHandle(@PathVariable String id, Map map) {
		System.out.println(id);
//		try {
		map.put("writerInfo", myPageService.getInfo(id));
		String[] following = myPageService.splitFollowing((Map)map.get("writerInfo"));
		map.put("writerFollowing", myPageService.getFollowingInfoById(following));
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		map.put("body", "following.jsp");
		return  "t_el";
	}
}
