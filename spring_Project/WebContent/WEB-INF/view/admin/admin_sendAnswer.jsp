<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
<head>
<title>답글</title>
</head>
<body>
	<div>
		<p> 받는이 : <input type="text" readonly="readonly" name = "id" id ="id" value="${id }" style="width:100px;"/></p>
		<p> 타이틀 : <input type="text" readonly="readonly" name = "title" id="title" value="${title }에 대한 답변"/>
		<p> 내용  </p>
		<textarea name="text" id="text" style="width:99%;border:1;overflow:visible;text-overflow:ellipsis;"style="resize: none; overflow-y: scroll;" rows=30>텍스트</textarea>
		<p  align="right">
			<button id="sbt" type="submit" style="width: 50%; height: 30px;" onclick="bt()"> 보내기 </button>
		</p>
	</div>
</body>
</html>
<script>
	function bt(){
		var id = $('#id').val();
		var title = $('#title').val();
		var text = $('#text').val();
		console.log(id);
		console.log(title);
		console.log(text);
		$.get("${pageContext.request.contextPath}/admin/sendmsg?id="+id +"&title="+title+"&text="+text,function(obj){
			console.log("get 진행..."+obj);
			if (obj.rst) {
				window.close();
				opener.location.reload();
			} else {
				window.alert("실패. \r\n다시 시도해 주세요.");
			}
		});
	}
</script>