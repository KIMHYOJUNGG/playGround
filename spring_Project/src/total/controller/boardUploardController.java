package total.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import total.domain.BoardVO;

@Controller
public class boardUploardController {
	

	@RequestMapping(path="/image", method = RequestMethod.POST)
	public void procFileUpload(BoardVO board,HttpServletRequest request,HttpServletResponse response, 
			MultipartFile upload) throws Exception{ 
		
		
		HttpSession session = request.getSession(); 
		String path = session.getServletContext().getRealPath("/bimage/"); // 웹서비스 root 경로

		if(session.getAttribute("imgpath")==null) {
			session.setAttribute("imgpath", new ArrayList<>());
			
			
		}
		List<String> imgpath=(List)session.getAttribute("imgpath");
		
		
		String id=(String)session.getAttribute("logon");
		File saveDir = new File(session.getServletContext().getRealPath("/bimage/"+id+"/"));
		System.out.println(saveDir.getAbsolutePath());
		if(!saveDir.exists())
			saveDir.mkdirs();
		
	  
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	String fileName=System.currentTimeMillis()+"-"+upload.getOriginalFilename();
	byte[] bytes=upload.getBytes();
	String uploadPath=saveDir.getPath();
	OutputStream out=new FileOutputStream(
			new File(uploadPath+"\\"+fileName));
System.out.println(uploadPath+"\\"+fileName);
	out.write(bytes);
	String callback=request.getParameter("CKEditorFuncNum");
	System.out.println(callback);
	PrintWriter printWriter=response.getWriter();
	String fileUrl=
			request.getContextPath()+"/bimage/"+id+"/"+fileName;
	imgpath.add(fileUrl);
	session.setAttribute("imgpath", imgpath);
	System.out.println(request.getContextPath()+"/bimage/"+id+"/"+fileName);
	printWriter.println(
			"<script>window.parent.CKEDITOR.tools.callFunction("
			+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>");
	printWriter.flush();
			
	
			
	}
	
	
	
	
}
