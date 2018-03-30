package total.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import total.domain.BoardVO;
import total.domain.BookVO;
import total.domain.Criteria;
import total.domain.PageMaker;
import total.domain.ReportVO;
//import total.domain.Criteria;
//import total.domain.PageMaker;
import total.service.BoardService;
import total.service.ReportService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	BoardService service;
	@Autowired
	ReportService rservice;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET(BoardVO board, Model model, Map map, HttpSession session, HttpServletResponse resp,
			HttpServletRequest req) throws Exception {

		String[] type = "세계여행,글쓰기,문화·예술,그림·웹툰,직장인 현실조언,건축·설계,시사·이슈,스타트업 경험담,인문학·철학,IT트렌드,육아이야기,쉽게읽는 역사,사진·촬영,요리·레시피,우리집 반려동물,건강·운동,사랑·이별,디자인 스토리"
				.split(",");
		System.out.println(type);

		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String cp = req.getContextPath();
		System.out.println(cp);
		System.out.println("register get ...........");
		model.addAttribute("body", "register.jsp");
		List<BookVO> book = service.bookName((String) session.getAttribute("logon"));
		if (book.isEmpty()) {
			String id=(String)session.getAttribute("logon");
			if(id!=null){
			out.println("<script>window.alert(\"북네임을 설정해주세요.!\"); location.href=\"" + cp + "/bookPage\";</script>"); // 한글
			out.close();
			// 대부분이 html로 전송한다.
			}else{
				out.println("<script>window.alert(\"사용자세션이 소멸되었습니다.메인페이지로 갑니다.!\"); location.href=\"/\";</script>"); // 한글
				out.close();
			}
			
		}
		model.addAttribute("type", type);
		model.addAttribute("listbook", book);

		// return "board/register";
		return "t_board";

	}

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String reportPOST(ReportVO report, RedirectAttributes rttr, HttpSession session) throws Exception {

		System.out.println("report get ...........");
		rservice.create(report);

		rttr.addFlashAttribute("msg", "success");
		return "redirect:/board/listPage";

	}

	/*
	 * @RequestMapping(value = "/register", method = RequestMethod.POST) public
	 * String registPOST(BoardVO board, Model model) throws Exception {
	 * 
	 * service.create(board);
	 * 
	 * model.addAttribute("result", "success");
	 * 
	 * //return "/board/success"; return "redirect:/board/listAll"; }
	 */

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr, HttpSession session) throws Exception {

		System.out.println("regist post ...........");
		System.out.println(board.toString());
		String[] book = board.getBook().split(",");

		board.setBno(book[0]);
		board.setBookname(book[1]);
		System.out.println(board.toString());
		// String uuid=service.uuid();
		// board.setBno(uuid);
		board.setWriter((String) session.getAttribute("logon"));

		service.create(board, session);

		rttr.addFlashAttribute("msg", "success");
		return "redirect:/board/listPage";

	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String listAll(Model model) throws Exception {

		System.out.println("show all list......................");

		for (BoardVO bv : service.listAll()) {

			System.out.println(bv);

		}
		model.addAttribute("list", service.listAll());
		model.addAttribute("body", "listAll.jsp");

		// return "board/listAll";
		return "t_board";
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("no") int no, Model model,HttpSession session) throws Exception {

		service.increaseViewcnt(no, session);
		String contents = service.mongoFind(no);
		List<Map> comments = service.mongoFindComment(no);
		model.addAttribute(service.read(no));
		model.addAttribute("contents", contents);
		model.addAttribute("body", "readPage.jsp");
		model.addAttribute("comments", comments);

		// return "board/read";
		return "t_board";
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("no") int no, RedirectAttributes rttr) throws Exception {
		service.delete(no);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/board/listAll";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(int no, Model model) throws Exception {

		String content = service.mongoFind(no);
		model.addAttribute(service.read(no));
		model.addAttribute("content", content);
		model.addAttribute("body", "modify.jsp");

		// return "board/modify";
		return "t_board";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		System.out.println("mod post............");
		service.update(board);
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/board/listAll";
	}

	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public String listAll(Criteria cri, Model model) throws Exception {

		System.out.println("show list Page with Criteria......................");

		model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("body", "listCri.jsp");

		// return "board/listCri";
		return "t_board";

	}

	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		String[] type = "세계여행,글쓰기,문화·예술,그림·웹툰,직장인 현실조언,건축·설계,시사·이슈,스타트업 경험담,인문학·철학,IT트렌드,육아이야기,쉽게읽는 역사,사진·촬영,요리·레시피,우리집 반려동물,건강·운동,사랑·이별,디자인 스토리"
				.split(",");
		
		System.out.println(cri.toString());
		List<BoardVO> list=service.listCriteria(cri);
		for(BoardVO b:list) {
			System.out.println(b);
			
			
		}
		model.addAttribute("list", list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		// pageMaker.setTotalCount(131);

		pageMaker.setTotalCount(service.countPaging(cri));

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("body", "listPage.jsp");
		model.addAttribute("type",type);
		return "t_board";
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public String read(@RequestParam("no") int no, @ModelAttribute("cri") Criteria cri, Model model,
			HttpSession session) throws Exception {

		service.increaseViewcnt(no, session);
		String contents = service.mongoFind(no);
		List<Map> comments = service.mongoFindComment(no);
		System.out.println(service.read(no));
		model.addAttribute(service.read(no));
		model.addAttribute("contents", contents);
		model.addAttribute("body", "readPage.jsp");
		model.addAttribute("comments", comments);
		model.addAttribute("logon", session.getAttribute("logon"));
		session.setAttribute("NO", no);
		// return "board/read";
		// return "t_board";

		/*
		 * String contents= service.mongoFind(no); List<Map> comments=
		 * service.mongoFindComment(no); model.addAttribute(service.read(no));
		 * model.addAttribute("contents",contents);
		 * model.addAttribute("body","readPage.jsp");
		 * model.addAttribute("comments",comments);
		 */

		// return "board/read";
		return "t_board";
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("no") int no, Criteria cri, RedirectAttributes rttr) throws Exception {

		service.delete(no);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/board/listPage";
		/*
		 * rttr.addFlashAttribute("msg", "success");
		 * 
		 * return "redirect:/board/listAll";
		 */
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public String modifyPagingGET(@RequestParam("no") int no, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {

		String content = service.mongoFind(no);
		model.addAttribute(service.read(no));
		model.addAttribute("content", content);
		model.addAttribute("body", "modifyPage.jsp");

		// return "board/modify";
		return "t_board";

	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(@RequestParam("no") int no, @ModelAttribute("cri") Criteria cri, Model model,
			BoardVO board, RedirectAttributes rttr) throws Exception {

		System.out.println("mod post............");

		service.update(board);
		rttr.addFlashAttribute("msg", "success");
		rttr.addFlashAttribute("page", cri.getPerPageNum());
		rttr.addFlashAttribute("perPageNum", cri.getPage());

		return "redirect:/board/listPage";
	}

}
/*
 * create table board( bno number(4,0) not null, title varchar2(200) not null,
 * content varchar2(1000), writer varchar2(50) not null, regdate date default
 * sysdate, viewcnt number(4,0) default 0,
 * 
 * constraint board_rule01 primary key(bno)
 * 
 * 
 * );
 * 
 * create sequence board_seq start with 1; drop table board;
 * 
 * insert into board (bno, title, content, writer) values(board_seq.nextval,'글을
 * 등록합니다.','글입니다', 'user01');
 * 
 * select * from board; commit;
 */
