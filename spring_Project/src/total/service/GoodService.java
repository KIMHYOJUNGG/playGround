package total.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import total.domain.GoodVO;

@Service
public class GoodService {
	@Autowired
	SqlSessionTemplate template;

	public boolean create(GoodVO good) throws Exception{
		int result=0;	
		result+=template.update("good.updatePlus",good.getTargetboard());
		 result+=template.insert("good.insert", good);
		 
		return  result==2;

	}

	public boolean delete(GoodVO good) throws Exception{
		int result=0;
		result+=template.update("good.updateMin",good.getTargetboard());
		result+=template.delete("good.delete", good);
		
		return result==2;
	}
	public boolean find(GoodVO good)throws Exception{
		
		return template.selectOne("good.find",good)!=null;
	}

}
