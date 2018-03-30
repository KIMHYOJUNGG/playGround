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


@Service
public class BoardService {

  @Autowired
 SqlSessionTemplate session;
  @Autowired
  MongoTemplate template;
 
  public List<BookVO> bookName(String id) {
	  
	  Criteria cri=new Criteria("writer");
	  cri.is(id);
	  Query query=new Query(cri);
	  List<BookVO> book=template.find(query,BookVO.class,"book");  
	  System.out.println(book);
	  return book;
  }
public String uuid() {

	
	
	  
	UUID uuid = UUID.randomUUID();// 고유 식별문자 생성 (8-4-4-4-12) 절대로 겹치지 않는다.
	System.out.println("uuid.toString()*****************************" + uuid.toString());
	String authkey = uuid.toString().split("-")[0];

	

	
	return authkey;
	
	
}


  @SuppressWarnings({ "unchecked", "unused" })
public void create(BoardVO vo,HttpSession sessions) throws Exception {
	  
	  System.out.println(vo.getTag());
	  String[] tag=vo.getTag().split("#");
	
	  for(String s : tag) {
		  System.out.println(s);
	  }
	  
	  List<String> imgpath=(List)sessions.getAttribute("imgpath");
	 
	  System.out.println(Arrays.toString(tag));
	  System.out.println(vo.getContent());
	  int no= session.selectOne("board.selectNo");
	  vo.setNo(no);
    session.insert("board.create", vo);
    
    
 /*// 게시글 DB(몽고 부분)
    db.board.insertOne({
    	"no":"글 번호(책 번호_0 .. 책 번호_10 이런 식?)",
    	"bno":"책 번호(book 컬렉션의 bno)",
    	"contents":"이제 여기가 게시글~ 1000자 맘껏 넘어도 됨ㅋㅋㅋ",
    	"image":["게시글에","들어갈","이미지"],
    	"tag":["글 태그","배열"],
    	"comments":[
    		{"id":"댓글 단 사람 id", "reply":"댓글 내용", "date":"댓글 단 시간"},
    		{"id":"댓글 단 사람 id2", "reply":"댓글 내용2", "date":"댓글 단 시간"}
    		]
    });
    
   */
	System.out.println("connect...");
	
	
	Map map=new HashMap();
	map.put("no",no);
	map.put("bno",vo.getBno());
	map.put("contents", vo.getContent());
	if(imgpath==null){
		
		map.put("image",new ArrayList<>());
		
		
	}else{
		
		map.put("image",imgpath);
		
	}
	if(tag==null){
		System.out.println("tag is null");
	map.put("tag",new ArrayList<>());
	}else{
		  List<String> listtag=new ArrayList<>(Arrays.asList(tag));
		  listtag.remove(0);
		map.put("tag", listtag);
	}
	map.put("comments",new ArrayList<>());
	
	
	//컬럼의 데이터형까지 마음대로 넣을수 있지만 웬만하면 통일을 하고 데이터를 넣고 안넣고를 비정형데이터라고 생각하자.
	//컬럼의 순서는 상관없다. 속성으로 구분하기 때문에.
	
	//collection.insertOne(doc2);   //들어갔다 안들어갔다를 안알려준다.Tdocument(만든객체)
	
	//T...a 가변인자 매개변수개수의 제한이 없다.
	//Arrays.asList()

	//여러개를 동시에 집어넣는것.
	template.insert(new Document(map),"board");
	/* collection.insertMany(Arrays.asList(Document.parse("{\"name\":\"쵸파\",\"role\":\"서포터\"}"),
			Document.parse("{\"name\":\"로빈\"}"))); */
	
	
	
	
  }

  public void addcomments(Integer boardNo,String id,String text,String preco)  {
	    System.out.println("session boardNo"+boardNo);
	   //Map map=new HashMap();
	   //map.put("no",boardNo);
	   //map.put("comments",);
	   Criteria criteria = new Criteria("no");
	   criteria.is(boardNo.intValue());
	    
	    Map map=new HashMap();
	   map.put("id",id);
	   map.put("reply",text);
	   map.put("date", new Date());
	   
	    Query query = new Query(criteria);
	       //업데이트 할 항목 정의
	       Update update = new Update();
	       update.push("comments", new Document(map) );
	       System.out.println("map : "+new Document(map));
	     template.updateFirst(query, update, "board");
  
  }
  
  public BoardVO read(Integer no) throws Exception {
	  
	
    return session.selectOne("board.read", no);
  }
  
  public String mongoFind(int no) {
	  
	  Criteria cri=new Criteria("no");
	  cri.is(no);
	  Query query=new Query(cri);
	  MongoBoardVo mbv=template.findOne(query,MongoBoardVo.class,"board");  
	  System.out.println(mbv.getContents());
	  return mbv.getContents();
	  
  }

public String[] mongoFindImage(Number no) {
	  
	  Criteria cri=new Criteria("no");
	  cri.is(no.intValue());
	  Query query=new Query(cri);
	  MongoBoardVo mbv=template.findOne(query,MongoBoardVo.class,"board");  
	  String[] list = "/image/Desert.jpg,/image/Desert.jpg".split(",");
	 System.out.println(mbv.getImage().length==0);
	  return mbv.getImage().length==0 ? list : mbv.getImage() ;
	  
  }

public List<Map> mongoFindComment(Number no) {
	  
	  Criteria cri=new Criteria("no");
	  cri.is(no.intValue());
	  System.out.println("no"+no);
	  Query query=new Query(cri);
	  MongoBoardVo mbv=template.findOne(query,MongoBoardVo.class,"board");  
	  System.out.println(mbv);
	  System.out.println(mbv.getComments());
	 
	  return mbv.getComments()==null ? null : mbv.getComments() ;
	  
}

public List<Map> mongoSearch(String word) {
	 
      Criteria cri=new Criteria();
      cri.orOperator(Criteria.where("contents").regex(word),Criteria.where("tag").regex(word));
	  //cri.regex("^"+word);
	  Query query=new Query(cri);
	  List<MongoBoardVo> mbv=template.find(query,MongoBoardVo.class,"board");  
	  
	  Map m =  new HashMap<>();
	  m.put("word1", "%"+word+"%");
	  m.put("word2", "%"+word+"%");
	  m.put("word3", "%"+word+"%");
	  List<Map> oracle = session.selectList("search.word",m);
	  //System.out.println("oracle:"+ oracle);
	  
	  Set set =new TreeSet<>();
	  
	  List<Map> list = new ArrayList<>();
	  
	  for(Map ora : oracle) {
		  set.add(ora.get("NO").toString());
	  }
	  
	  for(MongoBoardVo vo : mbv	) {
		  //System.out.println("vo : "+vo.getNo());
		  set.add(vo.getNo());
	  }
	  //System.out.println("set :" + set);
	  
	  for(Object no : set) {
	  Map map= new HashMap<>();
	  Map result = session.selectOne("search.boardNo", no);
	  //System.out.println("result : "+result);
	  map.put("no", result.get("NO"));
	  map.put("title", result.get("TITLE"));
	  map.put("date", result.get("REGDATE"));
	  map.put("writer", result.get("WRITER"));
	  map.put("view", result.get("VIEWCNT"));
	  
	  list.add(map); 
	  }
	  
	  //System.out.println("list :"+list);
	  return list;
	  
}


public void update(BoardVO vo) throws Exception {
    session.update("board.update", vo);
   
    //db.person.update({"name" : "고길동"});
    Criteria criteria = new Criteria("no");
    criteria.is(vo.getNo());
    
    Query query = new Query(criteria);
    //업데이트 할 항목 정의
    Update update = new Update();
    update.set("contents", vo.getContent());
    
  template.updateFirst(query, update, "board");
    /*mongoTemplate.updateMulti(query, update, "person");
    
    //조건없이 모든걸 다 바꿔버림
    mongoTemplate.updateMulti(new Query(), update, "person");*/
    
    
  
 }

  public void delete(Integer no) throws Exception {
	  session.delete("report.delete",no);
    session.delete("board.delete", no);
    
    Criteria criteria = new Criteria("no");
    criteria.is(no);
    Query query = new Query(criteria);
    
   template.remove(query, "board");
    /*   
     *전체삭제
        public void deletePerson(){
            mongoTemplate.remove(new Query(), "person2");
        }
      
      부분삭
        public void deletePersonByName(String name){
            Criteria criteria = new Criteria("name");
            criteria.is(name);
            Query query = new Query(criteria);
            
            mongoTemplate.remove(query, "person2");
        }
    Col


    출처: http://souning.tistory.com/68 [-]
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
  public void increaseViewcnt(int no, HttpSession sessions)throws Exception{
	 
	  long update_time=0;
	  if(sessions.getAttribute("update_time_"+no)!=null){
		  update_time=
				  (long)sessions.getAttribute("update_time_"+no);
		  
		  
	  }
	  long current_time=System.currentTimeMillis();
	  if(current_time-update_time>5*1000){
		  session.update("board.increaseViewcnt",no);
	sessions.setAttribute("update_time_"+no, current_time);	  
	  }
		  
  }

}
