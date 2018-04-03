
package total.controller;

import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import total.service.BoardService;
import total.service.IndexService;
import total.service.WriterService;

@Controller
public class IndexController {

	@Autowired
	IndexService indexService;
	@Autowired
	BoardService boardService;
	@Autowired
	ServletContext application;
	@Autowired
	WriterService writerService;
	  
	
	@RequestMapping({"/index","/"})
	public String indexHandle(Model model) throws Exception{

	List<Map> writerlist = writerService.Writer();
		Set<Map> set = new LinkedHashSet<>();
		while(true) {
			System.out.println("while!!");
			int i = (int)(Math.random() * (writerlist.size()) );
			set.add(writerlist.get(i));
			
			if(set.size() == 3)
				break;
		}
	  
	  	model.addAttribute("writer",set);
		
		
		System.out.println("index");
		List<Map> boardNo = indexService.boardConnectNo();
		if(boardNo.size()<8) 
			model.addAttribute("boardNo", boardNo);
		else 
			model.addAttribute("boardNo", boardNo.subList(0, 8));
		
		model.addAttribute("body", "index.jsp");

		Map<Integer, String > list = new HashMap<Integer, String>();
		for (int i = 0; i < (boardNo.size() < 8 ? boardNo.size() : 8); i++) {
			for (String s : boardService.mongoFindImage((Number) (boardNo.get(i).get("NO")))) {
				list.put(i, s);
			}
		}
		
		int cnt =0;
		for(Map m :boardNo) {
		m.put("IMAGE",list.get(0+cnt));
		cnt += 1;
		}
		model.addAttribute("list", list);
		// application.getRealPath("/image")+"/Desert.jpg";
		return "t_el";

	}

}
