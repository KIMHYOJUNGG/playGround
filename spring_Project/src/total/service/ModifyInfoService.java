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

	public String makeFileName(String origin) {
		int idx = origin.lastIndexOf(".");
		String fname = origin.substring(0, idx);
		String type = origin.substring(idx);
		return fname +" "+ System.currentTimeMillis() +type;
	}

	public String imgModify(MultipartFile img, String id) {
		String fileName = null;
		String saveName = null;
		if (!img.isEmpty()) {
			fileName = makeFileName(img.getOriginalFilename());
			File parent = new File(application.getRealPath("/image/" + id));
			if (parent.exists()) {
				File[] olds = parent.listFiles();
				if (olds != null) {
					for (File o : olds) {
						o.delete();
					}
				}
			} else {
				parent.mkdirs();
			}
			File saveDir = new File(parent, fileName);
			try {
				img.transferTo(saveDir);
				saveName = "/image/" + id + "/" + fileName;
			} catch (Exception e) {
				e.printStackTrace();
				saveName = null;
			}
		}
		return saveName;
	}

	public boolean infoModify(Map param, String id) {
		param.put("id", id);
		return template.update("member.modifyInfo", param) == 1;
	}
	
	public boolean check(Map param) {
		Map map = template.selectOne("member.checkNickAndEmail", param);
		boolean rst = false;
		if(map == null) {
			rst = true;
		} else if ( ((String)map.get("ID")).equals(param.get("id")) ) {
			rst = true;
		}
		return rst;
	}

}
