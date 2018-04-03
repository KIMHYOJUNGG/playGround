<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
<head>
<title>탈퇴</title>
</head>
<body>
		<p>
			<b>비밀번호를 입력해주세요</b><br /> <input type="password" name="password"
				id="password">
			<button id="sbt" type="submit" style="width: 20%; height: 30px;">탈퇴신청</button>
		</p>
</body>
</html>
<script>
	
	$("#sbt").click(function() {
		var password = $("#password").val();
		var s = window.confirm("회원탈퇴를 하게 되면 관련된 모든 정보가 삭제됩니다. 정말로 삭제합니까? ");
		if (s) {
			if(s){
				$.get("${pageContext.request.contextPath}/member/dropmember?password="+password,function(obj){
					console.log("삭제진행...? " + obj);
					if(obj.rst){
						window.alert("그동안 감사했습니다.");
						window.opener.location.href="/index";
						window.close();
					}
					else{
						window.alert("탈퇴실패");
					}
				});
			}
			else{
				window.close();
			}
		}
	});
</script>