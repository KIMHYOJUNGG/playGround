package total.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WriterService {

	@Autowired
	SqlSessionTemplate session;
	
	public List<Map> Writer() {
		System.out.println("Writer!!!!!!!");
		
		return session.selectList("writers.writer");
	}
	
	
}
