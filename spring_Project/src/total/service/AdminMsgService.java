package total.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;
@Service
public class AdminMsgService {
	@Autowired
	SqlSessionTemplate template;

	@Autowired
	MongoTemplate session;

	public List<Map> getmessage() {
		return template.selectList("admin.getMessage");
	}

	
	public Map getmessageId(int no) {
		int rst = template.update("admin.updategetRead",no);
		if(rst!=0) {
			return template.selectOne("admin.getMessageId",no);
		}
		else {
			Map map2 = new HashMap<>();
			map2.put("fail", "실패");
			return map2;
		}
	}
	
	public int sendmessage(Map map) {
		int no = template.selectOne("admin.selectNo");
		map.put("no", no);
		int i = template.insert("admin.get",map);
		if(i!=0) {
			System.out.println("겟메일함에 넣기 실패");
		}
		return  template.insert("admin.send",map);
	}
}
