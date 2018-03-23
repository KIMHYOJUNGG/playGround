package total.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import total.domain.BookVO;
import total.service.BookPageService;

@Controller
@RequestMapping("/bookPage")
public class BookPageController {
	@Autowired
	BookPageService bookPageService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String bookPageHandle(Map map) {
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
		map.put("book-contents", true);
		map.put("contentsList", bookPageService.getBookList(bno));
		map.put("boardVOList", bookPageService.getBoardVOforImg(bno));
		map.put("title", (((Map)map.get("contentsList")).get("BOOKNAME") ));
		map.put("body", "bookPage.jpg");
		return "t_el_title";
	}
}
