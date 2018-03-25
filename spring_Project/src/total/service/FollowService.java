package total.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FollowService {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean addFollowing(String follow, String target, String id) {
		Map data = new HashMap<>();
		if(follow != null) 
			data.put("follow", follow+","+target);
		else
			data.put("follow", target);
		data.put("id", id);
		System.out.println("follow? "+data.get("follow"));
		return template.update("member.addFollowing", data) == 1;
	}
	
}
