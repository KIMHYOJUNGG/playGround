package total.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import total.domain.BoardVO;

@Service
public class AdminService {
	@Autowired
	SqlSessionTemplate template;
	
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
}
