package total.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MsgService {
	@Autowired
	SqlSessionTemplate template;
	
	public Integer getNewMsgCntByIdFromGetBox(String id) {
		return template.selectOne("getBox.getNewMsgCntById",id);
	}
	
	public List<Map> getMsgByIdFromGetBox(String id) {
		return template.selectList("getBox.getMsgById", id);
	}
	
	public boolean send(Map params) {
		int no = template.selectOne("sendBox.selectNo");
		params.put("no", no);
		return template.insert("sendBox.send", params) == 1 && template.insert("getBox.send",params) == 1;
	}
	
	public Map getOneByNoFromGetBox(String no) {
		return template.selectOne("getBox.getOneByNo",no);
	}
	
	public Map getOneByNoFromSendBox(String no) {
		return template.selectOne("sendBox.getOneByNo",no);
	}
	
	public List<Map> getMsgByIdFromSendBox(String id) {
		return template.selectList("sendBox.getMsgById", id);
	}
	
	public void updateReadCheckByNo(String no) {
		template.update("getBox.updateReadCheck", no);
		template.update("sendBox.updateReadCheck", no);
	}
	
	public boolean delMsgByNoFromSendBox(String[] no) {
		Map data = new HashMap<>();
			data.put("no", no);
		return template.delete("sendBox.delMsgByNo",data) == no.length;
	}
	
	public boolean delMsgByNoFromGetBox(String[] no) {
		Map data = new HashMap<>();
			data.put("no", no);
		return template.delete("getBox.delMsgByNo", data) == no.length;
	}
	
}
