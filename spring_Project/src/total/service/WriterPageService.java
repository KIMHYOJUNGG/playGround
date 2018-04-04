package total.service;

import java.util.*;

import org.bson.Document;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.client.FindIterable;

import total.domain.BookVO;

@Service
public class WriterPageService {
	@Autowired
	SqlSessionTemplate template;
	@Autowired
	MongoTemplate mongo;
	
	public List<Map> getContentsListById(String id){
		return template.selectList("board.getListById", id);
	}
	
	public List<BookVO> getBookListById(String id) {
		List<BookVO> list = mongo.find(new Query(Criteria.where("writer").is(id)).with(new Sort("bookName", "1")),  BookVO.class, "book");
		return list;
	}
	
	public List<Map> getBookContentsCntById(String id) {
		Map data = new HashMap<>();
			data.put("id", id);
		return template.selectList("board.getBookContentsCntById", data);
	}
	
	public List<BookVO> mergeBookListAndCnt(List<Map> bookContentsList, List<BookVO> bookList) {
		for(BookVO b : bookList) {
			for( Map m : bookContentsList) {
				if( m.containsValue(b.getBno()) ) {
					b.setCnt( ((Number)m.get("CNT")).intValue() );
					break;
				}
			}
		}
		return bookList;
	}
	
	public List<Map> getFollower (String id) {
		return template.selectList("follow.getFollower", id);
	}
}
