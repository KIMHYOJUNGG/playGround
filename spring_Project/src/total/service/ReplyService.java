package total.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.mybatis.spring.SqlSessionTemplate;
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
	 @Autowired
	 SqlSessionTemplate sqltemplate;
	
	 //http://souning.tistory.com/68
	 
	 public List<ReplyVO> list(Integer bno) throws Exception {

		    return sqltemplate.selectList("reply.list", bno);
		  }


	  public void create(ReplyVO vo) throws Exception {

		  sqltemplate.insert("reply.create", vo);
		  
		 
	  }

	  public void update(ReplyVO vo) throws Exception {

		  sqltemplate.update("reply.update", vo);
		  }


	  public void delete(Integer rno) throws Exception {

		  sqltemplate.delete("reply.delete", rno);
		  }


	  public List<ReplyVO> listPage(Integer bno, total.domain.Criteria cri)
	      throws Exception {

	    Map<String, Object> paramMap = new HashMap<>();

	    paramMap.put("bno", bno);
	    paramMap.put("cri", cri);

	    return sqltemplate.selectList("reply.listPage", paramMap);
	  }

	  public int count(Integer bno) throws Exception {

	    return sqltemplate.selectOne("reply.count", bno);
	  }

}
