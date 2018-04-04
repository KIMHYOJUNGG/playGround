package total.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import total.domain.PageMaker;
import total.domain.SearchCriteria;
import total.service.BoardService;

@Controller
public class SearchController {

	@Autowired
	BoardService boardService;
	
	
	@RequestMapping("/search")
	public String searchHandle(@ModelAttribute("cri") SearchCriteria cri,Model model,Map<String, Object> map,@RequestParam String word )throws Exception {
		
		System.out.println("cri :");
		String[] stype = "세계여행,글쓰기,문화·예술,그림·웹툰,직장인 현실조언,건축·설계,시사·이슈,스타트업 경험담,인문학·철학,IT트렌드,육아이야기,쉽게읽는 역사,사진·촬영,요리·레시피,우리집 반려동물,건강·운동,사랑·이별,디자인 스토리"
				.split(",");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(boardService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("type",stype);
		
		
		
		map.put("searchList",boardService.mongoSearch(word));
		//List<Map> list = boardService.mongokeyword(word);
		List<Map> t = boardService.mongoTagSearch(word);
		map.put("searchList",boardService.mongoSearch(word));
		//map.put("list", list);
		map.put("tag", t);
		map.put("body", "/board/listAll.jsp");
		
		
		
		
		return "t_el";
	}
	

	
}
