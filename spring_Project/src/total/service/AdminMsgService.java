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

	public List<Map> sendmessage(){
		return template.selectList("admin.sendMessage");
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
	
	

}
