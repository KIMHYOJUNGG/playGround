package total.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageService {
	@Autowired
	SqlSessionTemplate template;
	
	public Map getInfo(String id) {
		return template.selectOne("member.getInfoById", id);
	}
	
	public String[] splitFollowing(Map info) {
		if (info.get("FOLLOW") != null) 
			return ((String)info.get("FOLLOW")).split(",");
		else {
			System.out.println("널 리턴하라규");
			return null;
		}
	}
	
	public List<Map> getFollowingOrderByAsc(String[] following) {
		Map data = new HashMap<>();
			data.put("following", following);
		return template.selectList("board.following", data);
	}
	
	public List<Map> getFollowingInfoById(String[] following) {
		Map data = new HashMap<>();
			data.put("following", following);
		return template.selectList("member.getFollowingInfoById",data	);
	}
	
	
}
