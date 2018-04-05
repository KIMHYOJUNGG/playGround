<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>답글</title>
</head>
<body>
	<form action="/member/regist" role="form" method="post" style="width: 400px; text-align: left; line-height: 34px;"
			autocomplete="off">
		받는이 : ${id } <br/>
		내용 : <br/>
		<textarea name="ourtext" style="width:99%;border:1;overflow:visible;text-overflow:ellipsis;"style="resize: none; overflow-y: scroll;" rows=30>텍스트</textarea>
	</form>
</body>
</html>