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

	public List<Map> memberSelect() {
		return template.selectList("member.selectAll");
	}

	public List<Map> boardIdSelect(String id) {
		return template.selectList("admin.boardid", id);
	}

	// 해당 no로 게시글 읽기
	public BoardVO read(Integer no) throws Exception {
		return template.selectOne("admin.read", no);
	}

	public String mongoFind(int no) {
		Criteria cri = new Criteria("no");
		cri.is(no);
		Query query = new Query(cri);
		MongoBoardVo mbv = session.findOne(query, MongoBoardVo.class, "board");
		System.out.println(mbv.getContents());
		return mbv.getContents();
	}

	public boolean delete(Integer no) throws Exception {
		template.delete("admin.delete", no);

		Criteria criteria = new Criteria("no");
		criteria.is(no);
		Query query = new Query(criteria);

		session.remove(query, "board");
		return true;
		/*
		 * 전체삭제 public void deletePerson(){ mongoTemplate.remove(new Query(),
		 * "person2"); }
		 * 
		 * 부분삭 public void deletePersonByName(String name){ Criteria criteria = new
		 * Criteria("name"); criteria.is(name); Query query = new Query(criteria);
		 * 
		 * mongoTemplate.remove(query, "person2"); } Col
		 * 
		 * 
		 * 출처: http://souning.tistory.com/68 [-]
		 */
	}

	public Map searchId(int no) {
		return template.selectOne("admin.boardNo",no); 
	}
	// 레드카드수 올리기(아직 3이 아닐때)
	public boolean updateRedCard(String id) {
		int i = template.update("admin.updateLv",id);
		if(i!=0) {
			return true;
		}
		else {
			return false;
		}
		
	}
	// 레드카드수 0으로(3일때)
		public boolean updateRedCard2(String id) {
			int i = template.update("admin.updateLv2",id);
			if(i!=0) {
				return true;
			}
			else {
				return false;
			}
			
		}

	public int selectRedcard(String id) {
		Map map = template.selectOne("admin.selectRedcard",id);
		int i = (int) map.get("LV");
		return i;
	}
}

