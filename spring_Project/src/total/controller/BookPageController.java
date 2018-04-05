package total.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import total.domain.BookVO;
import total.service.BookPageService;
import total.service.MyPageService;
import total.service.WriterPageService;
import total.service.adminWeekService;

@Controller
@RequestMapping("/bookPage")
public class BookPageController {
	@Autowired
	BookPageService bookPageService;
	@Autowired
	MyPageService myPageService;
	@Autowired
	WriterPageService writerPageService;
	@Autowired
	Gson gson;
	@Autowired
	adminWeekService weekservice;
	
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
		
		// okt
		int i = weekservice.insertWeek();
		System.out.println("책등록이 됨?");
		
//		map.put("no", bno);
		return "redirect:board/register";
	}
	
	@RequestMapping("/{bno}")
	public String bookPageHandle3(@PathVariable String bno, Map<String, Object> map) {
		BookVO book = bookPageService.getBookInfo(bno);
		if(book != null) {
			map.put("bookContents", "Y");
			map.put("bookInfo", bookPageService.getBookInfo(bno));
			List<String> li = new ArrayList<>();
				li.add(bno);
			Map data = new HashMap<>();
				data.put("bno", li);
			map.put("viewNgood", bookPageService.getViewNGoodCnt(data));
			map.put("contentsList", bookPageService.getBookList(bno)); 
			map.put("boardVOList", bookPageService.getBoardVO(bno));
			map.put("writerInfo", myPageService.getInfo(book.getWriter()));
			map.put("follower", writerPageService.getFollower(book.getWriter()));
			map.put("title", book.getBookName());
			map.put("body", "bookPage.jsp");
			
			return "t_el_title";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(path="/{bno}/modify", method=RequestMethod.GET)
	public String bookModifyHandle(@PathVariable String bno, Map map, HttpSession session) {
		if( (Integer)session.getAttribute("lv") == 1) {
			System.out.println("bookModifyHandle");
			map.put("bookInfo", bookPageService.getBookInfo(bno));
			map.put("contentsList", bookPageService.getBookList(bno));
			map.put("title", "책 정보 수정");
			map.put("body", "bookModify.jsp");
			return "t_el_title";
		} else {
			return "redirect:/member/lvup";
		}
	}
	
	@RequestMapping(path="/{bno}/modify", method=RequestMethod.POST)
	public String bookModifyHandle2(@PathVariable String bno, BookVO book) {
		System.out.println("bookModifyHandle2");
		bookPageService.ModifyBookInfoByBno(book);
		return "redirect:/bookPage/"+bno;
	}
	
	@RequestMapping(path="/{bno}/del", produces="application/json; charset=utf-8")
	@ResponseBody
	public String delBookHandle(@PathVariable String bno, HttpSession session) {
		if( (Integer)session.getAttribute("lv") == 1) {
			System.out.println("delBookHandle");
			boolean rst = bookPageService.delBookByBno(bno);
			
			// okt
			boolean rst2 = weekservice.deletePublish(bno);
			System.out.println("성공?");
			
			return "{\"rst\":"+rst+"}";
		} else {
			return "redirect:/member/lvup";
		}
	}
	
	@RequestMapping(path="/delContents", produces="application/json; charset=utf-8")
	@ResponseBody
	public String delContentsHandle(@RequestParam("no[]") int[] no) {
		boolean rst = false;
		if(no != null) {
			rst = bookPageService.delContentsFromBoard(no);
		}
		return "{\"rst\":"+rst+"}";
	}
	
	@RequestMapping(path="/orderBy", produces="application/json; charset=utf-8")
	@ResponseBody
	public String contentsOrderHandle(@RequestParam Map<String, String> params, Map map) {
		map.put("contentsList", bookPageService.getBookList(params)); 
		map.put("boardVOList", bookPageService.getBoardVO(params.get("bno")));
		return gson.toJson(map);
	}
	
}
