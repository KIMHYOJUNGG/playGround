package total.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

//import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import total.domain.BoardVO;
//import total.domain.Criteria;
//import total.domain.PageMaker;
import total.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {


  @Autowired
   BoardService service;

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public String registerGET(BoardVO board, Model model) throws Exception {

    System.out.println("register get ...........");
    return "board/register";
  }

/*   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public String registPOST(BoardVO board, Model model) throws Exception {
  
   service.create(board);
  
   model.addAttribute("result", "success");
  
   //return "/board/success";
   return "redirect:/board/listAll";
   }*/
 

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registPOST(BoardVO board, RedirectAttributes rttr, HttpSession session) throws Exception {

	  System.out.println("regist post ...........");
	  System.out.println(board.toString());
	 
	  String uuid=service.uuid();
	  board.setBno(uuid);
	  board.setWriter((String)session.getAttribute("logon"));

	  service.create(board);

    rttr.addFlashAttribute("msg", "success");
    return "redirect:/board/listAll";
  }
  @RequestMapping(value = "/listAll", method = RequestMethod.GET)
  public String listAll(Model model) throws Exception {

	  System.out.println("show all list......................");
    model.addAttribute("list", service.listAll());
    return "board/listAll";
  }

  @RequestMapping(value = "/read", method = RequestMethod.GET)
  public String read(@RequestParam("no") int no, Model model) throws Exception {

	 String contents= service.mongoFind(no);
    model.addAttribute(service.read(no));
    model.addAttribute("contents",contents);
    
    return "board/read";
  }
  @RequestMapping(value = "/remove", method = RequestMethod.POST)
  public String remove(@RequestParam("no") int no, RedirectAttributes rttr) throws Exception {

    service.delete(no);

    rttr.addFlashAttribute("msg", "success");

    return "redirect:/board/listAll";
  }
  @RequestMapping(value = "/modify", method = RequestMethod.GET)
  public String modifyGET(int no, Model model) throws Exception {

    String content= service.mongoFind(no);
    model.addAttribute(service.read(no));
    model.addAttribute("content",content);
    
    return "board/modify";
  }
  @RequestMapping(value = "/modify", method = RequestMethod.POST)
  public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception {

	  System.out.println("mod post............");

    service.update(board);
    rttr.addFlashAttribute("msg", "success");

    return "redirect:/board/listAll";
  }
}
/*create table board(
bno number(4,0) not null,
title varchar2(200) not null,
content varchar2(1000),
writer varchar2(50) not null,
regdate date default sysdate,
viewcnt number(4,0) default 0,

constraint board_rule01 primary key(bno)


);

create sequence board_seq start with 1;
drop table board;

 insert into board (bno, title, content, writer) 
 values(board_seq.nextval,'글을 등록합니다.','글입니다', 'user01');
 
 select * from board;
 commit;*/
