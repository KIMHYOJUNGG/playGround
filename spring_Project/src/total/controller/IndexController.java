
package total.controller;


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
		List<Map> boardNo = indexService.boardConnectNo();
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("body","index.jsp");
		System.out.println("getno"+boardNo.get(0).get("NO"));
		System.out.println("NO왜안나옴?"+boardNo.get(0).get("NO"));  
		System.out.println("=="+boardService.mongoFindImage((Number)(boardNo.get(0).get("NO"))) );
		
		/*
		System.out.println(boardService.mongoFindImage(boardNo.get(1).get("NO")));
		model.addAttribute("1",boardService.mongoFindImage(boardNo.get(0).get("NO")));			// 사진 배열이니까 배열에서 0번째꺼 가지고 와야함 
		model.addAttribute("2",boardService.mongoFindImage(boardNo.get(1).get("NO")));
		model.addAttribute("3",boardService.mongoFindImage(boardNo.get(2).get("NO")));
		model.addAttribute("4",boardService.mongoFindImage(boardNo.get(3).get("NO")));
		model.addAttribute("5",boardService.mongoFindImage(boardNo.get(4).get("NO")));
		model.addAttribute("6",boardService.mongoFindImage(boardNo.get(5).get("NO")));
		model.addAttribute("7",boardService.mongoFindImage(boardNo.get(6).get("NO")));
		model.addAttribute("8",boardService.mongoFindImage(boardNo.get(7).get("NO")));
		*/
		List list = new LinkedList<>();
		list.add(0,boardService.mongoFindImage(1));
		list.add(1,boardService.mongoFindImage((Number)(boardNo.get(1).get("NO"))));
		list.add(2,boardService.mongoFindImage((Number)(boardNo.get(2).get("NO"))));
		list.add(3,boardService.mongoFindImage((Number)(boardNo.get(3).get("NO"))));
		list.add(4,boardService.mongoFindImage((Number)(boardNo.get(4).get("NO"))));
		list.add(5,boardService.mongoFindImage((Number)(boardNo.get(5).get("NO"))));
		list.add(6,boardService.mongoFindImage((Number)(boardNo.get(6).get("NO"))));
		list.add(7,boardService.mongoFindImage((Number)(boardNo.get(7).get("NO"))));
		model.addAttribute("list",list);
		
		//application.getRealPath("/image")+"/Desert.jpg";
		return "t_el";
		
	}
	
	

	
	
}

