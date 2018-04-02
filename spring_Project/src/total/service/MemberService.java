
package total.service;

import java.io.File;
import java.util.Date;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean registerMember(Map<String,Object> param) {
		int rst = template.insert("member.register", param);
		if (rst == 1) {
			return true;
		} else {
			return false;
		}
	}

	public Map loginMember(Map<String, String> param) {
		Map map = template.selectOne("member.login",param);
		if(map!=null ) {
			int i = template.update("member.update",param);
			if(map.get("STOPTIME")!=null) {
				Map map2 = template.selectOne("member.member", param);
				Date a =  (Date) map2.get("STOPTIME");
				Date b = (Date) map2.get("LOGINTIME");
				long date1 = a.getTime();
				long date2 = b.getTime();
				if((double)date2-(double)date1 >(1000*60*60*3)) {
					template.update("admin.updateLv4",param);
					System.out.println("업뎃완료");
					return map;
				}
				return map;
			}
			return map;
		}
		else {
			return map;
		}
	}
	public Map idMember(String email) {
		return template.selectOne("member.idsearch",email);
	}
	public Map passwordMember(Map<String,String> param) {
		return template.selectOne("member.passwordsearch",param);
	}

	public Map selectId(String id) {
		return template.selectOne("member.idsearch2",id);
	}

	public int updateLv(String id) {
		// TODO Auto-generated method stub
		return template.update("member.updateLv",id);
	}
	
	public Map emailMember(String id) {
		return template.selectOne("member.member",id);
	}

	public String selectNick(String nick) {
		return template.selectOne("member.nicksearch",nick);
	}

	public String selectEmail(String email) {
		return template.selectOne("member.emailsearch",email);
	}
}

