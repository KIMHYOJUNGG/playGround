
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

	
	@RequestMapping({"/index","/"})
	public String indexHandle(Model model) throws Exception{

		String[] type = "세계여행,글쓰기,문화·예술,그림·웹툰,직장인 현실조언,건축·설계,시사·이슈,스타트업 경험담,인문학·철학,IT트렌드,육아이야기,쉽게읽는 역사,사진·촬영,요리·레시피,우리집 반려동물,건강·운동,사랑·이별,디자인 스토리"
				.split(",");
		model.addAttribute("type",type);
		System.out.println("index");
		List<Map> boardNo = indexService.boardConnectNo();
		if(boardNo.size()<8) 
			model.addAttribute("boardNo", boardNo);
		else 
			model.addAttribute("boardNo", boardNo.subList(0, 8));
		
		model.addAttribute("body", "index.jsp");

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
		
		int cnt =0;
		for(Map m :boardNo) {
		m.put("IMAGE",list.get(0+cnt));
		cnt += 1;
		}
		System.out.println("list: " + boardNo);
		model.addAttribute("list", list);
		// application.getRealPath("/image")+"/Desert.jpg";
		return "t_el";

	}

}
