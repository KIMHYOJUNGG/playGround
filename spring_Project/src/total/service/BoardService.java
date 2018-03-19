package total.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import total.domain.BoardVO;


@Service
public class BoardService {

  @Autowired
 SqlSessionTemplate session;

 

  public void create(BoardVO vo) throws Exception {
    session.insert("board.create", vo);
  }

  public BoardVO read(Integer bno) throws Exception {
    return session.selectOne("board.read", bno);
  }

  public void update(BoardVO vo) throws Exception {
    session.update("board.update", vo);
  }

  public void delete(Integer bno) throws Exception {
    session.delete("board.delete", bno);
  }

  public List<BoardVO> listAll() throws Exception {
    return session.selectList("board.listAll");
  }

}
