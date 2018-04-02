package total.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import total.service.BoardService;

@Controller
public class PreNextBTSController {

	@Autowired
	BoardService boardService;
	@Autowired
	Gson gson;
	
	@RequestMapping(path="/pre", method = RequestMethod.GET, produces="application/json; charset=utf-8")
	@ResponseBody
	public String preHandle(Model model,@RequestParam String id, @RequestParam int boardNo ,@RequestParam String bookname) {
		System.out.println("prenext로 옴 ");
		Map pre = boardService.prenext(boardNo,bookname);
		System.out.println("prev : "+pre.get("PREV"));
		Map map = new HashMap<String, String>();
		map.put("result", true);
		map.put("prev",pre.get("PREV"));
		Gson gson = new Gson();
		gson.toJson(map);
		return gson.toJson(map);
	}
	
	
	@RequestMapping(path="/next", method = RequestMethod.GET, produces="application/json; charset=utf-8")
	@ResponseBody
	public String nextHandle(Model model,@RequestParam String id, @RequestParam int boardNo ,@RequestParam String bookname) {
		Map pre = boardService.prenext(boardNo,bookname);
		System.out.println("next : "+pre.get("NEXT"));
		Map map = new HashMap<String, String>();
		map.put("result", true);
		map.put("next",pre.get("NEXT"));
		Gson gson = new Gson();
		gson.toJson(map);
//		return gson.toJson(map);
		return ((String)pre.get("next"));
	}
	
	
}
