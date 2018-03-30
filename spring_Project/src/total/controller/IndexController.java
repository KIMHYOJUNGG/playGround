
package total.controller;


import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mongodb.client.FindIterable;

import total.service.BoardService;
import total.service.IndexService;
import total.domain.*;  

@Controller
public class IndexController {

	@Autowired
	IndexService indexService;
	@Autowired
	BoardService boardService;
	@Autowired
	ServletContext application;

	
	@RequestMapping({"/index","/"})
	public String indexHandle(Model model) {
		System.out.println("index");
		List<Map> boardNo = indexService.boardConnectNo();
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("body","index.jsp");
		
		
		List list = new LinkedList<>();
		for(int i=0;i>(boardNo.size() < 8 ? boardNo.size() : 8);i++) {
		list.add(i,boardService.mongoFindImage((Number)(boardNo.get(i).get("NO"))));
		//System.out.println(Arrays.toString(boardService.mongoFindImage((Number)(boardNo.get(i).get("NO")))));
	
		}
		model.addAttribute("list",list);
		
		//application.getRealPath("/image")+"/Desert.jpg";
		return "t_el";
		
	}
	
	

	
	
}

