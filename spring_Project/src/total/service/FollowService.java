package total.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FollowService {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean addFollowing(Map data) {
		return template.insert("follow.addFollow", data) == 1;
	}
	
	public boolean dropFollowing(Map data) {
		return template.delete("follow.dropFollow", data) == 1;
	}
	
}
