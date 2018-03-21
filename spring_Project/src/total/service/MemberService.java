package total.service;

import java.io.File;
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

	public boolean loginMember(Map<String, String> param) {
		// TODO Auto-generated method stub
		Map map = template.selectOne("member.login",param);
		if(map!=null ) {
			return true;
		}
		else {
			return false;
		}
	}
	public boolean idMember(String id) {
		Map map = template.selectOne("member.idsearch",id);
		if(map!=null) {
			return true;
		}
		else {
			return false;
		}
	}
}
