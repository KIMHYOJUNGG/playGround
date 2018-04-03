<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>탈퇴</title>
</head>
<body>
	<form action="/member/dropmember" role="form" method="post"
		style="width: 400px; text-align: center; line-height: 34px;"
		autocomplete="off">
		<p>
			<b>비밀번호를 입력해주세요</b><br /> <input type="password" name="password"
				id="password">
			<button id="sbt" type="submit" style="width: 20%; height: 30px;">탈퇴신청</button>
		</p>
	</form>
</body>
</html>
<script>
	$("#sbt").click(function() {
		var formObj = $("form[role='form']");
		var s = window.confirm("회원탈퇴를 하게 되면 관련된 모든 정보가 삭제됩니다. 정말로 삭제합니까? ");
		if (s) {
			if(s){
				formObj.submit();
			}
		}
	});
</script>