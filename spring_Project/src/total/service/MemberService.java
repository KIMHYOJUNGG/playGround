
package total.service;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	SqlSessionTemplate template;

	@Autowired
	MongoTemplate session;

	public boolean registerMember(Map<String, Object> param) {
		int rst = template.insert("member.register", param);
		if (rst == 1) {
			return true;
		} else {
			return false;
		}
	}

	public Map loginMember(Map<String, String> param) {
		Map map = template.selectOne("member.login", param);
		if (map != null) {
			int i = template.update("member.update", param);
			if (map.get("STOPTIME") != null) {
				Map map2 = template.selectOne("member.member", param);
				Date a = (Date) map2.get("STOPTIME");
				Date b = (Date) map2.get("LOGINTIME");
				long date1 = a.getTime();
				long date2 = b.getTime();
				if ((double) date2 - (double) date1 > (1000 * 60 * 60 * 3)) {
					template.update("admin.updateLv4", param);
					System.out.println("업뎃완료");
					return map;
				}
				return map;
			}
			return map;
		} else {
			return map;
		}
	}

	public Map idMember(String email) {
		return template.selectOne("member.idsearch", email);
	}

	public Map passwordMember(Map<String, String> param) {
		return template.selectOne("member.passwordsearch", param);
	}

	public Map selectId(String id) {
		return template.selectOne("member.idsearch2", id);
	}

	public int updateLv(String id) {
		// TODO Auto-generated method stub
		return template.update("member.updateLv", id);
	}

	public Map emailMember(String id) {
		return template.selectOne("member.member", id);
	}

	public String selectNick(String nick) {
		return template.selectOne("member.nicksearch", nick);
	}

	public String selectEmail(String email) {
		return template.selectOne("member.emailsearch", email);
	}

	public boolean deleteAll(String id) {
		System.out.println("id--->"+id);
		List<Map> list = template.selectList("member.selectAllbd", id);
		System.out.println("삭제할 회원의 목록들 :" + list);
		for(Map map:list) {
			if(map.get("BNO")!=null) {
				System.out.println("삭제  bno->" + map.get("BNO"));
				String bno = map.get("BNO").toString();
				template.delete("reply.replybno",bno);
				template.delete("week.deletebno",bno);
				template.delete("week.deletepublish",bno);
				session.remove(new Query(Criteria.where("bno").is(bno)), "book");			
			}else {
				break;
			}
		}
		for (Map map : list) {
			if (map.get("NO") != null) {
				System.out.println("삭제  no -> " + map.get("NO"));
				int no = Integer.parseInt(map.get("NO").toString());
				template.delete("report.delete",no);
				template.delete("good.deleteAll",no);
				int i = template.delete("board.delete", no);
				System.out.println("board지워졌니 ? " + i);
				Criteria criteria = new Criteria("no");
				criteria.is(no);
				Query query = new Query(criteria);
				session.remove(query, "board");
			} else {
				System.out.println("브레이크했니?");
				break;
			}
		}
		template.delete("follow.deleteAll",id);
		System.out.println("팔로우도 통과니? ");
		int j =template.delete("getBox.deletegetMessage",id);
		int i1 = template.delete("sendBox.deletesendMessage",id);
		int i = template.delete("member.deleteAll",id);
		if(i!=0) {
			return true;
		}
		else {
			return false;
		}
	}
}
