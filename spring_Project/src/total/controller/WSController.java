package total.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import total.domain.WebSocketMap;

@Controller("WSController")
public class WSController extends TextWebSocketHandler {
	@Autowired
	WebSocketMap wsMap;
	@Autowired
	Gson gson;
	

	
	/*@PostConstruct
	public void init() {
		wsMap = new ArrayList<>();
	}*/
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String,Object> map = session.getAttributes();
		String key = (String)session.getAttributes().get("HTTP.SESSION.ID"); // HttpSession을 접근해야된다.
		if(!wsMap.containsKey(key)) {
			wsMap.put(key, new ArrayList<>());
		}
		wsMap.get(key).add(session);
		System.out.println(wsMap.keySet());
		for(String k : wsMap.keySet() ) {
			int size = wsMap.get(k).size();
			System.out.println("→ " + k+" ("+size+")" );
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String key = (String)session.getAttributes().get("HTTP.SESSION.ID");
		wsMap.get(key).remove(session);
		if(wsMap.get(key).isEmpty()) {
			wsMap.remove(key);
		}
	}
	
}
