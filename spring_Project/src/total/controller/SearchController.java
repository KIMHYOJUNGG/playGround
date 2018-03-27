package total.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import total.service.BoardService;

@Controller
public class SearchController {

	@Autowired
	BoardService boardService;
	
	
	@RequestMapping("/search")
	public String searchHandle(Map map,@RequestParam String word ) {
		System.out.println("search : "+word);
		System.out.println(boardService.mongoSearch(word));
		map.put("body", "/board/listAll.jsp");
		return "t_el";
	}
	

	
}
