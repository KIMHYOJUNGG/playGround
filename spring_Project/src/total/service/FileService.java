package total.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {
	@SuppressWarnings("resource")

	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile file)
			throws Exception {

		OutputStream out = null;

		PrintWriter printWriter = null;

		String fileName = file.getOriginalFilename();

		byte[] bytes = file.getBytes();

		String uploadPath = "/image";

		System.out.println(uploadPath);

		out = new FileOutputStream(new File(uploadPath));

		out.write(bytes);

		String callback = request.getParameter("CKEditorFuncNum");

		printWriter = response.getWriter();

		String fileUrl = request.getContextPath() + "/" + fileName; // url 경로

		printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("

				+ callback

				+ ",'"

				+ fileUrl

				+ "','이미지를 업로드 하였습니다.'"

				+ ")</script>");

		printWriter.flush();

	}

}
