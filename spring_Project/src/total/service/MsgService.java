package total.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MsgService {
	@Autowired
	SqlSessionTemplate template;
	
	public List<Map> getMsgById(String id) {
		return template.selectList("getBox.getMsgById", id);
	}
	
}
