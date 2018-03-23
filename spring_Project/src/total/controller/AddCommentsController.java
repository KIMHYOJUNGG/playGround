package total.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import total.service.BoardService;

@Controller
public class AddCommentsController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/addComments")
	public String addCommentsHandle() {
		System.out.println("나와라나와라");
		  
		return "true";
	}
	
}
