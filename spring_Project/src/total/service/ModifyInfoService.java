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

	public boolean imgModify(MultipartFile img, String id) {
		boolean result = false;
		if (!img.isEmpty()) {
			File saveDir = new File(application.getRealPath("/image/" + id));
			saveDir.mkdirs();
			try {
				img.transferTo(saveDir);
				result = true;
			} catch (Exception e) {
				e.printStackTrace();
				result = false;
			}
		}
		return result;
	}

	public boolean infoModify(Map param, String id) {
		return template.update("member.modifyInfo", param) == 1;
	}
	
	
	
}
