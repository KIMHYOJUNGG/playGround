package total.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import total.service.ModifyInfoService;
import total.service.MyPageService;

@Controller
@RequestMapping("/modifyInfo")
public class ModifyInfoController {
	@Autowired
	MyPageService myPageService;
	@Autowired
	ModifyInfoService modifyInfoService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String modifyHandle(Map map, HttpSession session) {
		map.put("info", myPageService.getInfo((String)session.getAttribute("logon")) );
		map.put("title", "정보 수정");
		map.put("body", "modifyInfo.jsp");
		return "t_el_title";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String modifyHandle2(Map map, HttpSession session, @RequestParam Map<String,String> param, @RequestParam("image") MultipartFile img) {
		if( !img.isEmpty()) {
			String fileName = modifyInfoService.imgModify(img, (String)session.getAttribute("logon"));
			param.put("image", fileName);
		}
		for(String s : param.keySet()) {
			System.out.println(s +"→"+param.get(s)+"/ null?"+(param.get(s) == null));
		}
		if(param.get("password").length() <1) {
			param.remove("password");
		}
		boolean rst = modifyInfoService.infoModify(param, (String)session.getAttribute("logon"));
		if(rst) {
			map.put("msg", "수정되었습니다.");
		} else {
			map.put("msg", "수정 실패하였습니다. 다시 시도해 주세요.");
		}
		map.put("info", myPageService.getInfo((String)session.getAttribute("logon")) );
		map.put("title", "정보 수정");
		map.put("body", "modifyInfo.jsp");
		return "t_el";
	}
	
	
}
