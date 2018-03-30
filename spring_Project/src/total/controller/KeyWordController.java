package total.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import total.domain.MongoBoardVo;
import total.service.BoardService;

@Controller
public class KeyWordController {
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/keyword")
	public String KeyWordHandle(Map map,@RequestParam String type ) {
		// type이 세계여생인것들 찾기
		List<Map> list = boardService.mongokeyword(type);  
		List<Map> tag = boardService.mongoTag(type);
		map.put("searchList",boardService.mongoSearch(type));
		map.put("list", list);
		map.put("tag", tag);
		map.put("body", "/board/listAll.jsp");
		
		
		
		return "t_el";
	}
	
	
}
