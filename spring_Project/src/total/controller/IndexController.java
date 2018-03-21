package total.controller;


import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mongodb.client.FindIterable;

import total.service.IndexService;
import total.domain.*;  

@Controller
public class IndexController {

	@Autowired
	IndexService indexService;
	
	@RequestMapping({"/index","/"})
	public String indexHandle(Model model) {
		List<Map> boardNo = indexService.boardConnectNo();
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("body","index.jsp");
		//FindIterable<Document> finds = collection.find(); // = collection.find(new Document());
		//for (Document doc : finds) {
			
			
		//}
		return "t_el";
	}
	
	
	
	
}
