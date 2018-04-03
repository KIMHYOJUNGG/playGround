package total.service;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import total.domain.BoardVO;
import total.domain.BookVO;
import total.domain.MongoBoardVo;
import total.domain.SearchCriteria;

@Service
public class BoardService {

	@Autowired
	SqlSessionTemplate session;
	@Autowired
	MongoTemplate template;

	public List<BookVO> bookName(String id) throws Exception {

		Criteria cri = new Criteria("writer");
		cri.is(id);
		Query query = new Query(cri);
		List<BookVO> book = template.find(query, BookVO.class, "book");
		System.out.println(book);
		return book;
	}

	public String uuid() throws Exception {

		UUID uuid = UUID.randomUUID();// 고유 식별문자 생성 (8-4-4-4-12) 절대로 겹치지 않는다.
		System.out.println("uuid.toString()*****************************" + uuid.toString());
		String authkey = uuid.toString().split("-")[0];

		return authkey;

	}

	@SuppressWarnings({ "unchecked", "unused" })
	public void create(BoardVO vo, HttpSession sessions) throws Exception {

		System.out.println(vo.getTag());
		String[] tag = vo.getTag().split("#");

		for (String s : tag) {
			System.out.println(s);
		}

		List<String> imgpath = (List) sessions.getAttribute("imgpath");

		System.out.println(Arrays.toString(tag));
		System.out.println(vo.getContent());
		int no = session.selectOne("board.selectNo");
		vo.setNo(no);
		session.insert("board.create", vo);

		/*
		 * // 게시글 DB(몽고 부분) db.board.insertOne({
		 * "no":"글 번호(책 번호_0 .. 책 번호_10 이런 식?)", "bno":"책 번호(book 컬렉션의 bno)",
		 * "contents":"이제 여기가 게시글~ 1000자 맘껏 넘어도 됨ㅋㅋㅋ",
		 * "image":["게시글에","들어갈","이미지"], "tag":["글 태그","배열"], "comments":[
		 * {"id":"댓글 단 사람 id", "reply":"댓글 내용", "date":"댓글 단 시간"},
		 * {"id":"댓글 단 사람 id2", "reply":"댓글 내용2", "date":"댓글 단 시간"} ] });
		 * 
		 */
		System.out.println("connect...");

		Map map = new HashMap();
		map.put("no", no);
		map.put("bno", vo.getBno());
		map.put("contents", vo.getContent());
		if (imgpath == null) {

			map.put("image", new ArrayList<>());

		} else {
			List<String> imgpath3 = new ArrayList<>();

			for (String s : imgpath) {
				if (vo.getContent().contains(s)) {
					imgpath3.add(s);
					System.out.println(s);
				}
			}

			map.put("image", imgpath3);
			sessions.setAttribute("imgpath", null);

		}
		if (tag == null) {
			System.out.println("tag is null");
			map.put("tag", new ArrayList<>());
		} else {
			List<String> listtag = new ArrayList<>(Arrays.asList(tag));
			listtag.remove(0);
			map.put("tag", listtag);
		}
		map.put("comments", new ArrayList<>());

		// 컬럼의 데이터형까지 마음대로 넣을수 있지만 웬만하면 통일을 하고 데이터를 넣고 안넣고를 비정형데이터라고 생각하자.
		// 컬럼의 순서는 상관없다. 속성으로 구분하기 때문에.

		// collection.insertOne(doc2); //들어갔다 안들어갔다를 안알려준다.Tdocument(만든객체)

		// T...a 가변인자 매개변수개수의 제한이 없다.
		// Arrays.asList()

		// 여러개를 동시에 집어넣는것.
		template.insert(new Document(map), "board");
		/*
		 * collection.insertMany(Arrays.asList(Document.parse(
		 * "{\"name\":\"쵸파\",\"role\":\"서포터\"}"),
		 * Document.parse("{\"name\":\"로빈\"}")));
		 */

	}

	public void addcomments(Integer boardNo, String id, String text, String preco) throws Exception {
		System.out.println("session boardNo" + boardNo);
		// Map map=new HashMap();
		// map.put("no",boardNo);
		// map.put("comments",);
		Criteria criteria = new Criteria("no");
		criteria.is(boardNo.intValue());

		Map map = new HashMap();
		map.put("id", id);
		map.put("reply", text);
		map.put("date", new Date());

		Query query = new Query(criteria);
		// 업데이트 할 항목 정의
		Update update = new Update();
		update.push("comments", new Document(map));
		System.out.println("map : " + new Document(map));
		template.updateFirst(query, update, "board");

	}

	public BoardVO read(Integer no) throws Exception {

		return session.selectOne("board.read", no);
	}

	public MongoBoardVo mongoFind(int no) throws Exception {

		Criteria cri = new Criteria("no");
		cri.is(no);
		Query query = new Query(cri);
		MongoBoardVo mbv = template.findOne(query, MongoBoardVo.class, "board");
		System.out.println(mbv.getContents());
		return mbv;

	}

	public String[] mongoFindImage(Number no) throws Exception {

		Criteria cri = new Criteria("no");
		cri.is(no.intValue());
		Query query = new Query(cri);
		MongoBoardVo mbv = template.findOne(query, MongoBoardVo.class, "board");
		String[] list = "/image/Desert.jpg,/image/Desert.jpg".split(",");
		System.out.println("image :" + mbv.getImage());
		return mbv.getImage().length == 0 ? list : mbv.getImage();

	}

	public List<Map> mongoFindComment(Number no) throws Exception {

		Criteria cri = new Criteria("no");
		cri.is(no.intValue());
		System.out.println("no" + no);
		Query query = new Query(cri);
		MongoBoardVo mbv = template.findOne(query, MongoBoardVo.class, "board");
		System.out.println(mbv);
		System.out.println(mbv.getComments());

		return mbv.getComments() == null ? null : mbv.getComments();

	}

	public List<Map> mongoSearch(String word) {

		Criteria cri = new Criteria();
		cri.orOperator(Criteria.where("contents").regex(word), Criteria.where("tag").regex(word));
		// cri.regex("^"+word);
		Query query = new Query(cri);
		List<MongoBoardVo> mbv = template.find(query, MongoBoardVo.class, "board");

		Map m = new HashMap<>();
		m.put("word1", "%" + word + "%");
		m.put("word2", "%" + word + "%");
		m.put("word3", "%" + word + "%");
		List<Map> oracle = session.selectList("search.word", m);
		// System.out.println("oracle:"+ oracle);

		Set set = new TreeSet<>();

		List<Map> list = new ArrayList<>();

		for (Map ora : oracle) {
			set.add(ora.get("NO").toString());
		}

		for (MongoBoardVo vo : mbv) {
			// System.out.println("vo : "+vo.getNo());
			set.add(vo.getNo());
		}
		// System.out.println("set :" + set);

		for (Object no : set) {
			Map map = new HashMap<>();
			Map result = session.selectOne("search.boardNo", no);
			// System.out.println("result : "+result);
			map.put("NO", result.get("NO"));
			map.put("TITLE", result.get("TITLE"));
			map.put("REGDATE", result.get("REGDATE"));
			map.put("WRITER", result.get("WRITER"));
			map.put("VIEWCNT", result.get("VIEWCNT"));
			map.put("GOOD", result.get("GOOD"));

			list.add(map);
		}

		// System.out.println("list :"+list);
		return list;

	}

	public List<Map> mongokeyword(String type) {
		List<Map> list = session.selectList("search.type", type);
		System.out.println("list :" + list);
		return list;

	}

	public static List sortByValue(final Map map) {
		List<String> list = new ArrayList();
		list.addAll(map.keySet());
		Collections.sort(list, new Comparator() {
			public int compare(Object o1, Object o2) {
				Object v1 = map.get(o1);
				Object v2 = map.get(o2);
				return ((Comparable) v2).compareTo(v1);
			}
		});
		// Collections.reverse(list); // 주석시 오름차순
		return list;
	}

	public List<Map> mongoTag(String type) {
		List tag = new LinkedList<>();
		Map<String, Integer> m = new HashMap<>(); // key: tag, value: 수
		List<Map> list = session.selectList("search.type", type);
		for (Map map : list) {
			System.out.println("No : " + map.get("NO"));
			Number no = (Number) map.get("NO");
			Criteria cri = new Criteria("no");
			cri.is(no.intValue());
			Query query = new Query(cri);
			List<MongoBoardVo> mbv = template.find(query, MongoBoardVo.class, "board");
			System.out.println("mbv : " + mbv);
			for (String t : mbv.get(0).getTag()) {
				if (m.containsKey(t)) {
					m.put(t, m.get(t) + 1);
				} else {
					m.put(t, 1);
				}
			}
		}

		// 오름차순으로 정렬시키기
		Iterator it = sortByValue(m).iterator();
		while (it.hasNext()) {
			String temp = (String) it.next();
			System.out.println(temp + " = " + m.get(temp));
			if (temp.length() != 0) {
				tag.add(temp);
			}
		}
		System.out.println(tag);
		return tag;
	}

	public List<Map> mongoTagAnd(String tag) throws Exception {
		List taglist = new LinkedList<>();
		Map<String, Integer> m1 = new HashMap<>(); // key: tag, value: 수
		// List<Map> list = session.selectList("search.type", type);
		Criteria cri = new Criteria();
		cri.orOperator(Criteria.where("contents").regex(tag), Criteria.where("tag").regex(tag));
		// cri.regex("^"+word);
		Query query = new Query(cri);
		List<MongoBoardVo> mbv = template.find(query, MongoBoardVo.class, "board");
		System.out.println("mbv :" + mbv.size());
		for (MongoBoardVo m2 : mbv) {
			System.out.println("m2 : " + m2);
			for (String m3 : m2.getTag()) {
				System.out.println("m3 : " + m3);
				if (m1.containsKey(m3)) {
					m1.put(m3, m1.get(m3) + 1);
				} else {
					m1.put(m3, 1);
				}
			}
		}

		System.out.println("m1 : " + m1);
		// 오름차순으로 정렬시키기
		Iterator it = sortByValue(m1).iterator();
		while (it.hasNext()) {
			String temp = (String) it.next();
			System.out.println(temp + " = " + m1.get(temp));
			if (temp.length() != 0) {
				taglist.add(temp);
			}
		}
		System.out.println(taglist);

		return taglist;

	}

	public List<Map> mongoTagSearch(String word) throws Exception { // 검색된 데이터에서
																	// 태그가져오기
		List tag = new LinkedList<>();
		Map<String, Integer> m1 = new HashMap<>(); // key: tag, value: 수
		Criteria cri = new Criteria();
		cri.orOperator(Criteria.where("contents").regex(word), Criteria.where("tag").regex(word));
		Query query = new Query(cri);
		List<MongoBoardVo> mbv = template.find(query, MongoBoardVo.class, "board");

		for (MongoBoardVo m2 : mbv) {
			for (String m3 : m2.getTag()) {
				if (m1.containsKey(m3)) {
					m1.put(m3, m1.get(m3) + 1);
				} else {
					m1.put(m3, 1);
				}
			}
		}

		Map m2 = new HashMap<>();
		m2.put("word1", "%" + word + "%");
		m2.put("word2", "%" + word + "%");
		m2.put("word3", "%" + word + "%");
		List<Map> oracle = session.selectList("search.word", m2);

		for (Map ora : oracle) {
			Criteria criteria = new Criteria("no");
			Number no = (Number) ora.get("NO");
			cri.is(no.intValue());
			System.out.println("nono :" + no);
			Query que = new Query(cri);
			List<MongoBoardVo> mb = template.find(que, MongoBoardVo.class, "board");
			for (MongoBoardVo m4 : mb) {
				for (String m3 : m4.getTag()) {
					if (m1.containsKey(m3)) {
						m1.put(m3, m1.get(m3) + 1);
					} else {
						m1.put(m3, 1);
					}
				}
			}

		}

		/*
		 * List<Map> list = session.selectList("search.type", type); for(Map map
		 * : list) { System.out.println("No : "+map.get("NO")); Number no =
		 * (Number) map.get("NO"); Criteria cri=new Criteria("no");
		 * cri.is(no.intValue()); Query query=new Query(cri); List<MongoBoardVo>
		 * mbv =template.find(query,MongoBoardVo.class,"board");
		 * System.out.println("mbv : "+mbv);
		 */

		// 오름차순으로 정렬시키기
		Iterator it = sortByValue(m1).iterator();
		while (it.hasNext()) {
			String temp = (String) it.next();
			System.out.println(temp + " = " + m1.get(temp));
			if (temp.length() != 0) {
				tag.add(temp);
			}
		}
		System.out.println(tag);

		return tag;
	}

	public void update(BoardVO vo, HttpSession sessions) throws Exception {
		List<String> imgpath1 = (List) sessions.getAttribute("imgpath");
		String[] tag = vo.getTag().split("#");

		session.update("board.update", vo);

		// db.person.update({"name" : "고길동"});
		Criteria criteria = new Criteria("no");
		criteria.is(vo.getNo());

		Query query = new Query(criteria);
		// 업데이트 할 항목 정의
		Update update = new Update();
		List<String> imgpath2 = new ArrayList<>();

		MongoBoardVo mbv = mongoFind(vo.getNo());
		String[] path = mbv.getImage();
		if (path != null) {
			for (String p : path) {
				if (vo.getContent().contains(p)) {
					imgpath2.add(p);
				}
			}
		}

		if (imgpath1 == null) {

			update.set("image", imgpath2);

		} else {
			List<String> imgpath3 = new ArrayList<>();

			for (String s : imgpath1) {
				if (vo.getContent().contains(s)) {
					imgpath3.add(s);
				}
			}

			imgpath2.addAll(imgpath3);
			update.set("image", imgpath2);
			sessions.setAttribute("imgpath", null);

		}
		update.set("contents", vo.getContent());
		if (tag == null) {
			System.out.println("tag is null");
			update.set("tag", new ArrayList<>());
		} else {
			List<String> listtag = new ArrayList<>(Arrays.asList(tag));
			listtag.remove(0);
			update.set("tag", listtag);
		}

		template.updateFirst(query, update, "board");
		/*
		 * mongoTemplate.updateMulti(query, update, "person");
		 * 
		 * //조건없이 모든걸 다 바꿔버림 mongoTemplate.updateMulti(new Query(), update,
		 * "person");
		 */

	}

	public Map prenext(int no, String bookname) { 
		System.out.println("nnn :" + no+bookname);
		Map m = new HashMap<>();
		m.put("no", no);
		m.put("bookname", bookname);
		Map map = session.selectOne("prenext.read",m);
		System.out.println("nextnext : "+map.get("NEXT"));
		return map;
	}
	
	
	public void delete(Integer no) throws Exception {
		session.delete("report.delete", no);
		session.delete("board.delete", no);

		Criteria criteria = new Criteria("no");
		criteria.is(no);
		Query query = new Query(criteria);

		template.remove(query, "board");
		/*
		 * 전체삭제 public void deletePerson(){ mongoTemplate.remove(new Query(),
		 * "person2"); }
		 * 
		 * 부분삭 public void deletePersonByName(String name){ Criteria criteria =
		 * new Criteria("name"); criteria.is(name); Query query = new
		 * Query(criteria);
		 * 
		 * mongoTemplate.remove(query, "person2"); } Col
		 * 
		 * 
		 * 출처: http://souning.tistory.com/68 [-]
		 */
	}

	public List<BoardVO> listAll() throws Exception {
		return session.selectList("board.listAll");
	}

	public List<BoardVO> listPage(int page) throws Exception {

		if (page <= 0) {
			page = 1;
		}

		page = (page - 1) * 10;

		return session.selectList("board.listPage", page);
	}

	public List<BoardVO> listCriteria(total.domain.Criteria cri) throws Exception {

		return session.selectList("board.listCriteria", cri);
	}

	public int countPaging(total.domain.Criteria cri) throws Exception {

		return session.selectOne("board.countPaging", cri);
	}

	public void increaseViewcnt(int no, HttpSession sessions) throws Exception {

		long update_time = 0;
		if (sessions.getAttribute("update_time_" + no) != null) {
			update_time = (long) sessions.getAttribute("update_time_" + no);

		}
		long current_time = System.currentTimeMillis();
		if (current_time - update_time > 5 * 1000) {
			session.update("board.increaseViewcnt", no);
			sessions.setAttribute("update_time_" + no, current_time);
		}

	}

	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {

		return session.selectList("boardsearch.listSearch", cri);
	}

	public int listSearchCount(SearchCriteria cri) throws Exception {

		return session.selectOne("boardsearch.listSearchCount", cri);
	}

}
