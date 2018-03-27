package total.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import total.service.FileService;

@Controller
@RequestMapping("/image")
public class boardUploardController {

	
	@Autowired
	FileService fileService;

	@RequestMapping( method=RequestMethod.POST)
	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws    Exception {

			

		response.setCharacterEncoding("UTF-8");

		response.setContentType("text/html;charset-utf-8");

		

		try {

			fileService.ckeditorImageUpload(request, response, upload);

			

		} catch (IOException e) {

			e.printStackTrace();

		}

	}



	
	
	
	
}
