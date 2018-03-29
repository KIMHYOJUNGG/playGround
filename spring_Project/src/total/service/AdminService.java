package total.service;

import java.util.HashMap;
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

	
	// ----------- 여기서 부터 삭제
	// --------------------------------------------------------------
	public boolean delete(Integer no) throws Exception {
		int rst = template.delete("admin.delete", no);
		if (rst != 0) {
			Criteria criteria = new Criteria("no");
			criteria.is(no);
			Query query = new Query(criteria);
			session.remove(query, "board");
			return true;
		} else {
			return false;
		}

	}

	// 레드카드 수 알기
	public int selectRedcard(String id) {
		Map map = template.selectOne("admin.selectRedcard", id);
		int i = Integer.parseInt(map.get("REDCARD").toString());
		return i;
	}

	// 레드카드수 올리기(아직 3이 아닐때)
	public boolean updateRedCard(String id) {
		int i = template.update("admin.updateLv", id);
		if (i != 0) {
			return true;
		} else {
			return false;
		}
	}

	// 레드카드수 0으로(3일때)
	public boolean updateRedCard2(String id) {
		int i = template.update("admin.updateLv2", id);
		if (i != 0) {
			return true;
		} else {
			return false;
		}

	}

	// 회원한테 msg 보내기
	public boolean msgSend(Map map) {
		int no = template.selectOne("admin.selectNo");
		Map map2 = new HashMap<>();
		map2.put("no",no);
		map2.put("id", map.get("id"));
		map2.put("title","신고된게시물이 삭제되었습니다.");
		map2.put("msg", map.get("title") + " 부적절한 게시글이므로 삭제하였습니다.");
		int i = template.insert("admin.msg", map2);
		if (i != 0) {
			int j = template.insert("admin.msg2",map2);
			if(j!=0) {
				return true;
			}
			else {
				return false;
			}
		} else {
			return false;
		}
	}

	public String title(int i) {
		return template.selectOne("admin.selectTitle", i);
	}

	// No로 report읽기
	public List<Map> readNo(int no) {
		return template.selectList("admin.selectReport", no);
	}

	public boolean reportRemove(int no) {
		int i = template.delete("admin.reportRemove", no);
		if (i != 0) {
			return true;
		} else {
			return false;
		}
	}

	public int getMessageCnt() {
		return template.selectOne("admin.getMessageCnt");
	}

	public boolean deletereport(int no) {
		int i = template.delete("admin.reportRemove",no);
		if(i!=0) {
			return true;
		}
		else {
			return false;
		}
	}

	public int sendMessageCnt() {
		return template.selectOne("admin.sendMessageCnt");
	}

}
