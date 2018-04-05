package total.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping(method = RequestMethod.GET)
	public String modifyHandle(Map map, HttpSession session, @RequestParam(name="msg", required=false) String msg) {
		map.put("info", myPageService.getInfo((String) session.getAttribute("logon")));
		map.put("title", "정보 수정");
		map.put("body", "modifyInfo.jsp");
		map.put("msg", msg);
		return "t_el_title";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String modifyHandle2(Map map, HttpSession session, @RequestParam Map<String, String> param, @RequestParam(name = "image", required = false) MultipartFile img) {
		if (img != null && !img.isEmpty()) {
			if (img.getContentType().contains("image")) {
				String fileName = modifyInfoService.imgModify(img, (String) session.getAttribute("logon"));
				param.put("image", fileName);
			} else {
				map.put("msg", "이미지 파일만 가능합니다.");
				return "redirect:/modifyInfo";
			}
		}
		if (param.get("password") != null && param.get("password").length() < 1) {
			param.remove("password");
		}
		boolean rst = modifyInfoService.infoModify(param, (String) session.getAttribute("logon"));

		return "redirect:/modifyInfo";
	}

	@RequestMapping(path = "/check", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String checkHandle(@RequestParam Map<String, String> param) {
		return "{\"rst\" : " + modifyInfoService.check(param) + "}";
	}

}
