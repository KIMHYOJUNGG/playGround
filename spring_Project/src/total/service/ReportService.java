package total.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.bson.Document;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import total.domain.ReportVO;
@Service
public class ReportService {
	

	  @Autowired
	 SqlSessionTemplate session;
	  
	  
	  public void create(ReportVO vo) throws Exception {
		
		  System.out.println("connect...");
	    session.insert("report.insert", vo);
		session.update("member.updateReport",vo.getWriter());
		session.update("board.boardRedCard",vo.getNo());
		
	  }
	  
}
