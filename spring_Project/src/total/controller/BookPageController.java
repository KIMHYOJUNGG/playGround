package total.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import total.domain.BookVO;
import total.service.BookPageService;
import total.service.MyPageService;
import total.service.WriterPageService;

@Controller
@RequestMapping("/bookPage")
public class BookPageController {
	@Autowired
	BookPageService bookPageService;
	@Autowired
	MyPageService myPageService;
	@Autowired
	WriterPageService writerPageService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String bookPageHandle(Map map, HttpSession session) {
		String id = (String)session.getAttribute("logon");
		map.put("writerInfo", myPageService.getInfo(id));
		map.put("contentList", writerPageService.getContentsListById(id));
		String[] following = myPageService.splitFollowing((Map)map.get("writerInfo"));
		map.put("writerFollowing", myPageService.getFollowingInfoById(following));
		map.put("bookList", writerPageService.getBookListById(id));
		map.put("bookContentsList", writerPageService.getBookContentsCntById(id));
		map.put("title", "책 등록");
		map.put("body", "bookPage.jsp");
		return "t_el_title";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String bookPageHandle2(BookVO vo, Map map, HttpSession session) {
		vo.setId((String)session.getAttribute("logon") );
		bookPageService.bookInsert(vo);
		map.put("title", (String)session.getAttribute("logon")+"의 PlayGround");
		map.put("body", "writerPage.jsp");
//		map.put("msg", "등록되었습니다.\r\n글을 등록해 보세요!");
		return "t_el_title";
	}
	
	@RequestMapping("/{bno}")
	public String bookPageHandle3(@PathVariable String bno, Map<String, Object> map) {
		map.put("bookContents", "Y");
		map.put("bookInfo", bookPageService.getBookInfo(bno));
		map.put("contentsList", bookPageService.getBookList(bno)); 
		map.put("boardVOList", bookPageService.getBoardVO(bno));
		map.put("writerInfo", myPageService.getInfo( (String)((Map)((List)map.get("contentsList")).get(0)).get("WRITER")  ));
		String title = (String)((Map)((List)map.get("contentsList")).get(0)).get("BOOKNAME");
		System.out.println(title); 
		map.put("title", title);
		map.put("body", "bookPage.jsp");
		return "t_el_title";
	}
}
