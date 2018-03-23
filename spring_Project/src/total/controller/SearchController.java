package total.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {

	@RequestMapping("/search")
	public String searchHandle(Map map) {
		map.put("body", "/board/listAll.jsp");
		return "t_el";
	}
	
}
