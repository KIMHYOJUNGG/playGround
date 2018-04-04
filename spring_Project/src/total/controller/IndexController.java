
package total.controller;

import java.util.*;

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
	  
	
	@RequestMapping({"/index","/"})  ///week/castindex
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
		
		List<Map> boardNo = indexService.boardConnectNo();
		List<Map> WinnerNo = indexService.boardWinnerNo();
		List<Map> WinnerNo2 = indexService.boardWinnerNo2();
		model.addAttribute("WinnerNo",WinnerNo);
		
		List<Map> bnolist = new LinkedList<>();
		for (int i = 0; i < WinnerNo.size() ; i++) { 
		 bnolist.add(indexService.boardWinnerBno((String)WinnerNo.get(i).get("BNO")).get(0));
		}
		
		System.out.println("bnolist : "+ bnolist);
		System.out.println("bnolist : "+ bnolist.get(0).get("NO"));
		for(int i = 0; i < WinnerNo.size() ; i++) {
			WinnerNo.get(i).put("image", boardService.mongoFindImage((Number)bnolist.get(i).get("NO")));
		}
		System.out.println("image; "+WinnerNo.get(2).get("NO"));
		System.out.println(";;;"+ WinnerNo.get(2).get("image").toString());
		
		
		/*
		int count = 0;
		Map<Integer, String > slidelist = new HashMap<Integer, String>();
		Set<String> bnoset = new HashSet<>();
		Set<Map> bnomap = new HashSet<>();
		for (int i = 0; i < WinnerNo2.size() ; i++) {  
			for (String s : boardService.mongoFindImage((Number) (WinnerNo2.get(i).get("NO")))) { 
				if(bnoset.add((String) WinnerNo2.get(i).get("BNO"))){
				slidelist.put(count, s);
				
				count++;  
				//if(WinnerNo.size() < bnoset.size() )
				//WinnerNo.get(i).put("image", slidelist.get(i));
				
				}
			}
		}
		
		for(int ii=0 ; ii < WinnerNo.size() ; ii++) {
			WinnerNo.get(ii).put("image", slidelist.get(ii));
			
		}
		
		System.out.println("slidelist  : "+slidelist);
		System.out.println("slidelist22  : "+WinnerNo);
		 */
		
		
		
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
