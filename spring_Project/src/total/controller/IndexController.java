package total.controller;


import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping({"/index","/"})
	public String indexHandle(Map map) {
		map.put("body", "index.jsp");
		return "t_el";
	}
}
