
package total.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import total.domain.BoardVO;
import total.domain.MongoBoardVo;

@Service
public class AdminService {
	@Autowired
	SqlSessionTemplate template;
	
	 @Autowired
	  MongoTemplate session;
	public boolean loginMember(Map<String, String> param) {
		// TODO Auto-generated method stub
		Map map = template.selectOne("admin.login", param);
		System.out.println(param);
		if (map != null) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<Map> memberSelect(){
		return template.selectList("member.selectAll");
	}
	
	public List<Map> boardIdSelect(String id) {
		return template.selectList("board.boardid",id);
	}
	
	// 해당 no로 게시글 읽기
	public BoardVO read(Integer no) throws Exception {
	    return template.selectOne("board.read", no);
	}
	 
	public String mongoFind(int no) {
		Criteria cri=new Criteria("no");
	  	cri.is(no);
	  	Query query=new Query(cri);
		MongoBoardVo mbv=session.findOne(query,MongoBoardVo.class,"board");  
		System.out.println(mbv.getContents());
		return mbv.getContents();
	}
}
