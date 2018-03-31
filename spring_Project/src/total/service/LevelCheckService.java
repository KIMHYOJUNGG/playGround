package total.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LevelCheckService {

	@Autowired
	SqlSessionTemplate template;
	
	public int levelCheck(String id) {
		return template.selectOne("board.levelCheck",id);
	}
	
}
