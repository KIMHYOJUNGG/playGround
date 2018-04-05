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
	// 현재일등인놈
	public String weektop() {
		return template.selectOne("week.weekendtop");
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
	
	// 책들의 정보와 날짜 리셋을 위한 delete
	public int dropweek() {
		return template.delete("week.deletetime");
	}
	
	// 다시 책들의 정보를 받아옴
	public int insertWeek() {
		return template.insert("week.inserttime");
	}
	
	// 게시글 삭제시 주간순위에 있을 때 해당 게시글의 좋아요 수만큼 감소
	public boolean updateWeekCnt(String bno) {
		int i = template.update("week.updatecnt",bno);
		if(i!=0) {
			System.out.println("해당 게시글의 좋아요 수만큼 감소");
		}else {
			System.out.println("해당 게시글이 없거나 실패");
		}
		return true;
	}
	
	// 책 삭제시 주간순위에 등록되어 있을 시 삭제
	public boolean deleteBno(String bno) {
		int i = template.delete("week.deletebno",bno);
		if(i!=0) {
			System.out.println("주간순위에서 책삭제 성공");
		}
		else {
			System.out.println("주간순위에 없거나 책삭제 실패");
		}
		return true;
	}
	
	// 책 삭제시 해당 책의 출간 삭제
	public boolean deletePublish(String bno) {
		int i = template.delete("week.deletepublish",bno);
		if(i!=0) {
			System.out.println("책권한 삭제");
		}else {
			System.out.println("책권한이 없었거나 삭제실패");
		}
		return true;
	}

	public List<Map> loginMember(String id) {
		return template.selectList("week.searchPublish",id);
	}

/*	public int selectYN(String id) {
		return template.selectOne("week.searchYN",id);
	}
*/
	/*// cnt가 0이 아닐때의 비교
	public int selectDate(String id) {
		return template.selectOne("week.searchDate",);
	}*/

	
	
	
	
}
