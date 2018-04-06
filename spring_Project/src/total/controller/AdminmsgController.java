package total.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import total.domain.WebSocketMap;
import total.service.AdminMsgService;
import total.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminmsgController {
	@Autowired
	WebSocketMap sessions;

	@Autowired
	AdminService adminservice;

	@Autowired
	AdminMsgService adminmsgservice;

	// 받은 메세지함 보기
	@RequestMapping("/getmessage")
	public String GetMessage(Model model, HttpSession session, @RequestParam Map param) {
		int scnt = adminservice.sendMessageCnt();
		int gcnt = Integer.parseInt(param.get("gcnt").toString());
		List<Map> list = adminmsgservice.getmessage();
		model.addAttribute("getmessage", list);
		model.addAttribute("gcnt2", gcnt);
		model.addAttribute("scnt", scnt);
		return "/admin/admin_getmessage";
	}


	
	// 받은 메세지함에서 본메일 체크
	@RequestMapping("/getmessageCheck")
	public String GetMessageId(Model model, HttpSession session, @RequestParam int no) {
		Map map = adminmsgservice.getmessageId(no);
		model.addAttribute("msgId", map);
		System.out.println(map);
		return "/admin/admin_messageId";
	}
	
	// 받은메세지에서 답장보내기창
	@RequestMapping("/sendAnswer")
	public String SendAnswer(Model model,@RequestParam Map map) {
		String id = map.get("id").toString();
		String title = map.get("title").toString();
		model.addAttribute("id",id);
		model.addAttribute("title",title);
		return "/admin/admin_sendAnswer";
	}
	
	// 답장보내기
	@RequestMapping(path = "/sendmsg", method = RequestMethod.GET,produces="application/json;charset=utf-8")
	@ResponseBody
	public String Sendmsg(Model model,@RequestParam Map map) {
		System.out.println(map);
		int i = adminmsgservice.sendmessage(map);
		boolean rst = false;
		if(i!=0) {
			rst = true;
			return "{\"rst\" : "+rst+"}";
		}else {
			return "{\"rst\" : "+rst+"}";
		}
	}
	
	// 메세지 삭제
	// 신고된 글을 삭제시
		@RequestMapping(path = "/removeMessage", method = RequestMethod.GET,produces="application/json;charset=utf-8")
		@ResponseBody
		public String removeRep(@RequestParam("no") String no, Model model) {
			boolean rst = false;
			if (no.contains(",")) {
				String[] no2 = no.split(",");
				Map map = adminmsgservice.getmessageAll(no2[0]);
				System.out.println("게시글삭제시의 넘버 "+map.get("NO"));
				String no3 = map.get("NO").toString();
				rst = adminmsgservice.deletemessage2(no2);
				if (rst) {
						return "{\"rst\" : "+rst+"}";
				} else {
					return "{\"rst\" : "+rst+"}";
				}
			}
			else {
				Map map = adminmsgservice.getmessageAll(no);
				System.out.println("게시글삭제시의 넘버 "+map.get("NO"));
				String no2 = map.get("NO").toString();
				rst = adminmsgservice.deletemessage3(no);
				if (rst) {
						return "{\"rst\" : "+rst+"}";
				} else {
					return "{\"rst\" : "+rst+"}";
				}
			}
		}
}
