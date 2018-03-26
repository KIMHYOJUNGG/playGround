package total.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import total.domain.BoardVO;
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
		if (vo.getTag() != null && vo.getTag().length > 1) {
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
		return template.selectList("board.getListByBno", bno);
	}

	public List<MongoBoardVo> getBoardVO(String bno) {
		List<MongoBoardVo> list = mongo.find(new Query(Criteria.where("bno").is(bno)), MongoBoardVo.class, "board");
		System.out.println(list.size());
		return list;
	}

	public BookVO getBookInfo(String bno) {
		return mongo.findOne(new Query(Criteria.where("bno").is(bno)), BookVO.class, "book");
	}

	public BookVO getWriterInfoByBno(String bno) {
		return mongo.findOne(new Query(Criteria.where("bno").is(bno)), BookVO.class, "book");
	}

}
