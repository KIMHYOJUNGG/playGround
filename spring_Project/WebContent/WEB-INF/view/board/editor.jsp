<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--     
    컨트롤러에서 리턴시킨 jsp 페이지를 '/webapp/WEB-INF/views/' 경로안에 만들어준다.
파일업로드 후 CKEditor 에 이미지를 삽입하기 위해
window.parent.CKEDITOR.tools.callFunction(CKEditorFuncNum, 첨부파일경로, 완료메세지); CKEditor 콜백함수를 추가한다. -->
<script type='text/javascript'> 
    window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}','${file_path}','파일전송완료');
</script>

