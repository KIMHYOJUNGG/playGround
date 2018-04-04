package total.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

@Service
public class adminWeekService {
	@Autowired
	SqlSessionTemplate template;

	@Autowired
	MongoTemplate session;
	// 
	public String weektop() {
		return template.selectOne("week.weekendtop");
	}
	// 날짜비교함으로써 같으면 주간순위테이블에 삽입 
	public boolean weekendequal() {
		List<Map> list = template.selectList("week.weekendequal");
		if(list.size()!=0) {
			int i = template.insert("week.inserttime");
			if(i!=0) {
				return true;
			}
			else {
				System.out.println("주간순위 삽입 실패");
				return false;
			}
		}else {
			System.out.println("날짜가 다릅니다.");
			return false;
		}
	}
	
	// 책에 속한 게시글의 좋아요수가 늘어날 때의 time테이블 cnt증가
	public int goodincre(String bno) {
		return template.update("week.updatetimecnt",bno);
	}
	
	// 좋아요를 취소할 때
	public int gooddecre(String bno) {
		return template.update("week.updatetimedel",bno);
	}

	// 어드민 로그인페이지로 갈시의 regdate와 lastweek날짜 비교
	public int castweek() {
		return template.selectOne("week.castweek");
	}

	// 이번주 우승자의 정보찾기
	public Map search() {
		return template.selectOne("week.search");
	}

	// publish테이블에 해당  bno가 있는지를 확인
	public boolean selectBno(String bno) {
		return template.selectOne("week.selectBno",bno);
	}
	// 우승자가 나올시 출간테이블(publish)에 정보저장
	public boolean insertPb(Map param) {
		int i = template.insert("week.publish",param);
		if(i!=0) {
			return true;
		}else {
			return false;
		}
	}
	// 주간순위 리셋
	public int updateWeek() {
		return template.update("week.updateWeek");
	}
	
	// 다시 책들의 정보를 받아옴
	public int insertWeek() {
		return template.insert("week.inserttime");
	}


	
	
}
