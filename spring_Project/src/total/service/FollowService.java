package total.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import total.domain.BookVO;

@Service
public class FollowService {
	@Autowired
	SqlSessionTemplate template;
	@Autowired
	MongoTemplate mongo;
	
	public boolean addFollowing(Map data) {
		return template.insert("follow.addFollow", data) == 1;
	}
	
	public boolean dropFollowing(Map data) {
		return template.delete("follow.dropFollow", data) == 1;
	}
	
	public List<Map> getFollowingBookList(List<String> writers) {
		List<Map> fbList = new ArrayList<>();
		for(String w : writers) {
			Map<String, Object> map = new HashMap<>();
			map.put("writer", w);
			map.put("list", mongo.find(new Query(Criteria.where("writer").is(w)), BookVO.class, "book"));
			fbList.add(map);
		}
		
		
		return fbList;
	}
}
