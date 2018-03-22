package total.service;

import java.io.File;
import java.util.*;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ModifyInfoService {
	@Autowired
	SqlSessionTemplate template;
	@Autowired
	ServletContext application;

	public String imgModify(MultipartFile img, String id) {
		String fileName = null;
		if (!img.isEmpty()) {
			File saveDir = new File(application.getRealPath("/image/" + id+"/"+id));
			saveDir.mkdirs();
			try {
				img.transferTo(saveDir);
				fileName = "/image/"+id+"/"+id;
			} catch (Exception e) {
				e.printStackTrace();
				fileName = null;
			}
		}
		return fileName;
	}

	public boolean infoModify(Map param, String id) {
		param.put("id", id);
		return template.update("member.modifyInfo", param) == 1;
	}
	
	
	
}
