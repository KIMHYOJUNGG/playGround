package total.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.bson.Document;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import total.domain.BoardVO;
import total.domain.MongoBoardVo;


@Service
public class BoardService {

  @Autowired
 SqlSessionTemplate session;
  @Autowired
  MongoTemplate template;
 
public String uuid() {

	UUID uuid = UUID.randomUUID();// 고유 식별문자 생성 (8-4-4-4-12) 절대로 겹치지 않는다.
	System.out.println("uuid.toString()*****************************" + uuid.toString());
	String authkey = uuid.toString().split("-")[0];

	return authkey;
}

  public void create(BoardVO vo) throws Exception {
	  
	  int no= session.selectOne("board.selectNo");
	  vo.setNo(no);
    session.insert("board.create", vo);
    
    
 /*// 게시글 DB(몽고 부분)
    db.board.insertOne({
    	"no":"글 번호(책 번호_0 .. 책 번호_10 이런 식?)",
    	"bno":"책 번호(book 컬렉션의 bno)",
    	"contents":"이제 여기가 게시글~ 1000자 맘껏 넘어도 됨ㅋㅋㅋ",
    	"image":["게시글에","들어갈","이미지"],
    	"tag":["글 태그,"배열"],
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
	map.put("image",new ArrayList<>());
	map.put("tag",new ArrayList<>());
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
	  System.out.println("no"+no);
	  Query query=new Query(cri);
	  MongoBoardVo mbv=template.findOne(query,MongoBoardVo.class,"board");  
	  System.out.println(mbv);
	  String[] list = "/image/Desert.jpg".split(",");
	  System.out.println(mbv.getImage()==null ? list : mbv.getImage());
	 
	  return mbv.getImage()==null ? list : mbv.getImage() ;
	  
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

}
