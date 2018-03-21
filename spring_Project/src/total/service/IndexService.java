package total.service;

import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IndexService {

	 @Autowired
	 SqlSessionTemplate template;
	
	public List<Map> boardConnectNo() {
		return template.selectList("board.mainBoardOrder");
	}
	
	
}
