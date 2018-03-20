package total.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class myPageService {
	@Autowired
	SqlSessionTemplate template;
	
	public Map getInfo(String id) {
		return template.selectOne("member.getInfoById", id);
	}
	
	public String[] splitFollowing(Map info) {
		return ((String)info.get("FOLLOW")).split(",");
	}
	
	public List<Map> getFollowingOrderByAsc(String[] following) {
		Map data = new HashMap<>();
			data.put("following", following);
		return template.selectList("board.following", data);
	}
	
	
}
