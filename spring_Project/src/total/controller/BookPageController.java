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
		map.put("writerFollowing", myPageService.getFollowingInfoById(myPageService.getMyFollowingList(id)));
		map.put("bookList", writerPageService.getBookListById(id));
		map.put("bookContentsList", writerPageService.getBookContentsCntById(id));
		map.put("title", "책 등록");
		map.put("body", "bookPage.jsp");
		return "t_el_title";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String bookPageHandle2(BookVO vo, Map map, HttpSession session) {
		String id = (String)session.getAttribute("logon");
		vo.setId(id );
		String bno =  bookPageService.bookInsert(vo);
//		map.put("no", bno);
		return "redirect:board/register";
	}
	
	@RequestMapping("/{bno}")
	public String bookPageHandle3(@PathVariable String bno, Map<String, Object> map) {
		map.put("bookContents", "Y");
		map.put("bookInfo", bookPageService.getBookInfo(bno));
		map.put("contentsList", bookPageService.getBookList(bno)); 
		map.put("boardVOList", bookPageService.getBoardVO(bno));
		BookVO book = bookPageService.getWriterInfoByBno(bno);
		map.put("writerInfo", myPageService.getInfo(book.getWriter()));
		map.put("follower", writerPageService.getFollower(book.getWriter()));
		map.put("title", book.getBookName());
		map.put("body", "bookPage.jsp");
		return "t_el_title";
	}
}
