package total.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import total.service.BoardService;

@Controller
public class AddCommentsController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping(path="/addComments", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public String addCommentsHandle(@RequestParam String id , @RequestParam String text , @RequestParam int boardNo, @RequestParam String preco) {
		//session.setAttribute("boardNo",boardNo);
		//session.setAttribute("boardNo",preco);
		boardService.addcomments(boardNo,id,text,preco);
		System.out.println("id : "+id +"text : "+ text + "boardNo : "+boardNo+"preco :"+preco);
		
		return "{\"result\":true}";
	}
	
}
