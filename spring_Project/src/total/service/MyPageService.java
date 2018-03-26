package total.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageService {
	@Autowired
	SqlSessionTemplate template;

	public Map getInfo(String id) {
		return template.selectOne("member.getInfoById", id);
	}

	public List<String> getMyFollowingList(String id) {
		System.out.println("getMyFollowingList");
		List<Map> raw = template.selectList("follow.getFollowListById", id);
		List<String> follow = null;
		for (Map r : raw) {
			System.out.println(r.get("TARGET"));
			if (r.get("TARGET") != null) {
				if (follow == null)
					follow = new ArrayList<>();
				follow.add((String) r.get("TARGET"));
			}
		}
		return follow;
	}

	public List<Map> getFollowingOrderByDesc(List following) {
		if (following != null) {
			System.out.println("getFollowingOrderByDesc");
			Map data = new HashMap<>();
			data.put("following", following);
			System.out.println(data.get("following") == null);
			return template.selectList("board.followingArticle", data);
		} else {
			return null;
		}
	}

	public List<Map> getFollowingInfoById(List following) {
		if (following != null) {
			Map data = new HashMap<>();
			data.put("following", following);
			return template.selectList("member.getFollowingInfoById", data);
		} else {
			return null;
		}
	}

}
