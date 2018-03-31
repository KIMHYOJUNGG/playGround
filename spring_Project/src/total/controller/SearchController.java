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
	public String searchHandle(Map map,@RequestParam String word )throws Exception {
		map.put("searchList",boardService.mongoSearch(word));
		List<Map> list = boardService.mongokeyword(word);
		List<Map> t = boardService.mongoTagSearch(word);
		map.put("searchList",boardService.mongoSearch(word));
		map.put("list", list);
		map.put("tag", t);
		map.put("body", "/board/listAll.jsp");
		
		
		return "t_el";
	}
	

	
}
