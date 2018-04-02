package total.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import total.domain.BookVO;
import total.domain.MongoBoardVo;
import total.domain.ReplyVO;


@Service
public class ReplyService {

	 @Autowired
	  MongoTemplate template;
	
	 //http://souning.tistory.com/68
	 
  public MongoBoardVo list(Integer no) throws Exception {

			Criteria cri = new Criteria("no");
			cri.is(no);
			Query query = new Query(cri);
			MongoBoardVo mbv = template.findOne(query, MongoBoardVo.class, "board");
			for(Map map:mbv.getComments()) {
				
				System.out.println(map.toString());
				
				
			}
			return mbv;
			

		 /* Criteria criteria=new Criteria("no");
		  criteria.is(vo.getBno());
		  
		  Map map =new HashMap();
		  map.put("id", vo.getReplyer());
		  map.put("reply", vo.getReplytext());
		  map.put("date", new Date());
		  
		  Query query=new Query(criteria);
		  Update update=new Update();
		  update.push("comments",new Document(map));
		  template.find(query, update, "board");
	    return template.selectList(namespace + ".list", bno);
	    */
	  }
/*	*/
	  public void create(ReplyVO vo) throws Exception {

		  Criteria criteria=new Criteria("no");
		  criteria.is(vo.getBno());
		  
		/*  Map map =new HashMap();
		  map.put("id", vo.getReplyer());
		  map.put("id", vo.getReplyer());
		  map.put("id", vo.getReplyer());
		  map.put("reply", vo.getReplytext());
		  map.put("date", new Date());
		  */
		  Query query=new Query(criteria);
		  Update update=new Update();
		  update.push("comments",vo);
		  template.updateFirst(query, update, "board");
		  
		 
	  }

	  public void update(ReplyVO vo) throws Exception {

	    //session.update(namespace + ".update", vo);
	  }
/*
	  public void delete(Integer rno) throws Exception {

	    session.update(namespace + ".delete", rno);
	  }

	  public List<ReplyVO> listPage(Integer bno, Criteria cri)
	      throws Exception {

	    Map<String, Object> paramMap = new HashMap<>();

	    paramMap.put("bno", bno);
	    paramMap.put("cri", cri);

	    return session.selectList(namespace + ".listPage", paramMap);
	  }

	  public int count(Integer bno) throws Exception {

	    return session.selectOne(namespace + ".count", bno);
	  }*/

}
