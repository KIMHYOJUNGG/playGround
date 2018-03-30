
package total.controller;

import java.util.Arrays;
import java.util.HashMap;
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

	@RequestMapping({ "/index", "/" })
	public String indexHandle(Model model) {
		System.out.println("index");
		List<Map> boardNo = indexService.boardConnectNo();
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("body", "index.jsp");

		System.out.println("img : " + boardService.mongoFindImage((Number) (boardNo.get(0).get("NO"))));
		for (String s : boardService.mongoFindImage((Number) (boardNo.get(0).get("NO")))) {
			System.out.println("s :"+s);
		}
		Map<Integer, String > list = new HashMap<Integer, String>();
		for (int i = 0; i < (boardNo.size() < 8 ? boardNo.size() : 8); i++) {
			System.out.println("i :"+i);
			for (String s : boardService.mongoFindImage((Number) (boardNo.get(i).get("NO")))) {
				list.put(i, s);
			}
		}
		System.out.println("list: " + list);
		model.addAttribute("list", list);
		// application.getRealPath("/image")+"/Desert.jpg";
		return "t_el";

	}

}
