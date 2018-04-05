package total.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import total.service.MsgService;
import total.service.MyPageService;

@Controller
@RequestMapping("/message")
public class MsgController {
	@Autowired
	MsgService msgService;
	@Autowired
	MyPageService myPageService;
	@Autowired
	Gson gson;
	
	@RequestMapping(method=RequestMethod.GET)
	public String msgHandle(Map map, HttpSession session, @RequestParam(name="msg", required=false) String msg) {
		String id = (String)session.getAttribute("logon");
		map.put("info", myPageService.getInfo(id));
		map.put("newMsgCnt", msgService.getNewMsgCntByIdFromGetBox(id));
		map.put("getMsg", msgService.getMsgByIdFromGetBox(id));
		map.put("title", "우편함");
		map.put("body", "message.jsp");
		map.put("msg", msg);	
		return "t_el_title";
	}
	
	@RequestMapping("/sendBox")
	public String sendBoxHandle(Map map, HttpSession session) {
		String id = (String)session.getAttribute("logon");
		map.put("info", myPageService.getInfo(id));
		map.put("sendBox", msgService.getMsgByIdFromSendBox(id));
		map.put("newMsgCnt", msgService.getNewMsgCntByIdFromGetBox(id));
		map.put("title", "보낸 메세지");
		map.put("body", "sendMessage.jsp");
		return "t_el_title";
	}
	
	@RequestMapping(path="/sendBoxDel", produces="application/json;charset=utf-8")
	@ResponseBody
	public String sendBoxDelHandle(@RequestParam("no[]") String[] no, HttpSession session) {
		System.out.println("sendBoxDelHandle");
		String id = (String)session.getAttribute("logon");
		boolean rst = false;
		if (no != null) 
			rst = msgService.delMsgByNoFromSendBox(no);
		return "{\"rst\" : "+rst+"}";
	}
	
	@RequestMapping(path="/getBoxDel", produces="application/json;charset=utf-8")
	@ResponseBody
	public String getBoxDelHandle(@RequestParam ("no[]") String[] no, HttpSession session) {
		String id = (String)session.getAttribute("logon");
		boolean rst = false;
		if (no != null) 
			rst = msgService.delMsgByNoFromGetBox(no);
		
		return "{\"rst\" : "+rst+"}";
	}
	
	@RequestMapping(path="/send", method=RequestMethod.POST)
	public String sendHandle(@RequestParam Map<String,String> params, HttpSession session, Map map) {
		System.out.println("sendHandle");
		String id = (String)session.getAttribute("logon");
		params.put("sendid", id);
		String get = params.get("getid");
		System.out.println("getid??");
		System.out.println(myPageService.getInfo(get));
		if(myPageService.getInfo(get) != null) {
			boolean rst = msgService.send(params);
			if(rst) {
				return "redirect:/message/sendBox";
			} else {
				return "redirect:/message";
			}
		} else {
			map.put("msg", "window.alert('존재하지 않는 아이디입니다.')");
			return "redirect:/message";
		}
	}
	
	@RequestMapping(path="/get", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getMsgHandle(@RequestParam String no) {
		Map msg = msgService.getOneByNoFromGetBox(no);
		return gson.toJson(msg);
	}
	
	@RequestMapping("/readCheck")
	public void readCheckHandle(String no) {
		msgService.updateReadCheckByNo(no);
	}
	
}
