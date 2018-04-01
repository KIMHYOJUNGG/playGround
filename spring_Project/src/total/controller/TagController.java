package total.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import total.service.BoardService;

@Controller
public class TagController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/tag")
	public String KeyWordHandle(Map map,@RequestParam String tag )throws Exception {
		List<Map> list = boardService.mongokeyword(tag);
		List<Map> t = boardService.mongoTagAnd(tag);
		map.put("searchList",boardService.mongoSearch(tag));
		map.put("list", list);
		map.put("tag", t);
		map.put("body", "/board/listAll.jsp");
		
		
		
		return "t_el";
  
	}

}

