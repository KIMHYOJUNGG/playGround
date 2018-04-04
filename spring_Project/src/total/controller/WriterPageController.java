package total.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import total.domain.BookVO;
import total.service.BookPageService;
import total.service.FollowService;
import total.service.MyPageService;
import total.service.WriterPageService;

@Controller
public class WriterPageController {
	@Autowired
	MyPageService  myPageService;
	@Autowired
	WriterPageService writerPageService;
	@Autowired
	FollowService followService;
	@Autowired
	BookPageService bookPageService;
	@Autowired
	Gson gson;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/@{id}")
	public String writerPageHandle(@PathVariable String id, Map map) {
		Map writerInfo = myPageService.getInfo(id);
		if(writerInfo != null) {
			map.put("writerInfo", writerInfo);
			map.put("contentList", writerPageService.getContentsListById(id));
			map.put("writerFollowing", myPageService.getFollowingInfoById(myPageService.getMyFollowingList(id)));
			map.put("bookList",writerPageService.mergeBookListAndCnt(writerPageService.getBookContentsCntById(id), writerPageService.getBookListById(id)) );
			if( ((List)map.get("bookList")) != null &&  ((List)map.get("bookList")).size() != 0) {
				Map data = new HashMap<>();
				List<String> bnos = new ArrayList<>();
				for ( BookVO b : (List<BookVO>)map.get("bookList")) {
						bnos.add(b.getBno());
						System.out.println(b.getBno());
				}
				if(bnos != null) {
					System.out.println("bnos != null");
					data.put("bno", bnos);
					map.put("vngList", bookPageService.getViewNGoodCnt(data));
				}
			}
			map.put("follower", writerPageService.getFollower(id));
			map.put("body", "writerPage.jsp");
			map.put("title", id+"의 PlayGround");
			return "t_el_title";
		} else {
			return "redirect:/";
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/@{id}/following")
	public String followingPageHandle(@PathVariable String id, Map map) {
		Map writerInfo = myPageService.getInfo(id);
		if(writerInfo != null) {
			map.put("writerInfo", writerInfo);
			map.put("writerFollowing", myPageService.getFollowingInfoById(myPageService.getMyFollowingList(id)));
			List<String> writers = myPageService.getMyFollowingList(id);
			map.put("followingBookList", followService.getFollowingBookList(writers));
			map.put("regList", followService.getWritersRegdate(writers));
			map.put("body", "following.jsp");
			return  "t_el";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(path="/@{id}/moreContents", produces="application/json; charset=utf-8")
	@ResponseBody
	public String contentList(@PathVariable String id) {
		return gson.toJson(writerPageService.getContentsListById(id));
	}
	
}
