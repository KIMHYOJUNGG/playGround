package total.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class boardUploardController {
	

	@RequestMapping("/imageUpload")
	public void procFileUpload(HttpServletRequest request,HttpServletResponse response, 
			MultipartFile upload) throws Exception{ 
		
		HttpSession session = request.getSession(); 
		String path = session.getServletContext().getRealPath("/WEB-INF/view/image/"); // 웹서비스 root 경로

		//반드시 변수명을 upload로 해야 한다.
		//String path=request.getRealPath("/WEB-INF/view/image/");
		System.out.println(path);
	  
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	String fileName=upload.getOriginalFilename();
	byte[] bytes=upload.getBytes();
	String uploadPath=path;
	OutputStream out=new FileOutputStream(
			new File(uploadPath+fileName));
System.out.println(uploadPath+fileName);
	out.write(bytes);
	String callback=request.getParameter("CKEditorFuncNum");
	PrintWriter printWriter=response.getWriter();
	String fileUrl=
			request.getContextPath()+"/WEB-INF/view/image/"+fileName;
	System.out.println(request.getContextPath()+"/image/"+fileName);
	printWriter.println(
			"<script>window.parent.CKEDITOR.tools.callFunction("
			+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>");
	printWriter.flush();
			
	
			
	}
	
	
	
	
}
