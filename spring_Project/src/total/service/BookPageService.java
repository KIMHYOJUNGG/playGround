package total.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import com.mongodb.WriteResult;

import total.domain.BookVO;
import total.domain.MongoBoardVo;

@Service
public class BookPageService {
	@Autowired
	MongoTemplate mongo;
	@Autowired
	SqlSessionTemplate template;

	public String bookInsert(BookVO vo) {
		String bno = UUID.randomUUID().toString().split("-")[0];
		vo.setBno(bno);
		if (vo.getTag() != null && vo.getTag().length >= 1 && (vo.getTag()[0]).length() > 1) {
			String[] tags = vo.getTag()[0].trim().split("#");
			int[] ri = new int[tags.length];
			int j = 0;
			List<String> li = Arrays.asList(tags);
			List<String> copy = new ArrayList<>();
			copy.addAll(li);

			for (int i = 0; i < tags.length; i++) {
				tags[i] = tags[i].trim();
			}
			if (copy.get(0).length() <= 0)
				copy.remove(0);

			vo.setTag(copy.toArray(new String[copy.size()]));
		}
		mongo.insert(vo, "book");
		return bno;
	}

	public List<Map> getBookList(String bno) {
		Map data = new HashMap<>();
			data.put("bno", bno);
		return template.selectList("board.getListByBno", data);
	}
	
	public List<Map> getBookList(Map params) {
		return template.selectList("board.getListByBno", params);
	}

	public List<MongoBoardVo> getBoardVO(String bno) {
		List<MongoBoardVo> list = mongo.find(new Query(Criteria.where("bno").is(bno)), MongoBoardVo.class, "board");
		return list;
	}
	
	public BookVO getBookInfo(String bno) {
		return mongo.findOne(new Query(Criteria.where("bno").is(bno)), BookVO.class, "book");
	}
	
	public boolean delContentsFromBoard(int[] no) {
		Map data = new HashMap<>();
			data.put("no", no);
		int cntDel = 0;
		for(int n : no) {
			WriteResult wr = mongo.remove(new Query(Criteria.where("no").in(n)), "board");
			cntDel += wr.getN();
		}
		if(cntDel == no.length) {
			boolean rst = template.delete("board.delContentByNo", data) == no.length;
			return rst && cntDel == no.length;
		} else {
			return false;
		}
	}
	
	public boolean delBookByBno(String bno) {
		Map data = new HashMap<>();
			data.put("bno", bno);
		Map map = template.selectOne("board.getBookContentsCntById", data);
		boolean rst = false;
		boolean temrst = true;
		int cnt = 0;
		if(map != null && map.get("CNT") != null ) {
			cnt = (int)((Number)map.get("CNT")).intValue();
			temrst = template.delete("board.delBookByBno", bno) == cnt;
		}
		WriteResult wr = mongo.remove(new Query(Criteria.where("bno").is(bno)), "book");
		WriteResult wr2 = mongo.remove(new Query(Criteria.where("bno").is(bno)), "board");
		rst = temrst && wr.getN() == 1 && wr2.getN() == cnt;
		return rst;
	}
	
	public void ModifyBookInfoByBno(BookVO book) {
		if (book.getTag() != null && (book.getTag()).length != 0 && (book.getTag()[0]).length() > 1) {
			String[] tags = book.getTag()[0].trim().split("#");
			int[] ri = new int[tags.length];
			int j = 0;
			List<String> li = Arrays.asList(tags);
			List<String> copy = new ArrayList<>();
			copy.addAll(li);

			for (int i = 0; i < tags.length; i++) {
				tags[i] = tags[i].trim();
			}
			if (copy.get(0).length() <= 0)
				copy.remove(0);

			book.setTag(copy.toArray(new String[copy.size()]));
		}
		Update up = new Update();
			up.set("bookName", book.getBookName());
			up.set("tag", book.getTag());
		mongo.updateFirst(new Query(Criteria.where("bno").is(book.getBno())), up, "book");
	}
	
	public List<Map> getViewNGoodCnt(Map data) {
		return template.selectList("board.getViewNGoodCnt", data);
	}
	
}
