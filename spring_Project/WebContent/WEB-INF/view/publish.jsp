<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
<title>출간신청구난입니다</title>
</head>
<body>
	<h2>현재 출간 신청을 할 수 있는 책목록들 입니다.</h2>
	<hr />
	<c:forEach var="m" items="${publish }">
		<p>
			<input type="hidden" id="btitle" name="btitle" value="${m.BTITLE }" />
			<b>${m.BTITLE }</b>
			<button type="submit" id="sbt" onclick="rm()">신청</button>
		</p>
	</c:forEach>
</body>
</html>
<script>
	
	function rm(){
		var btitle = $("#btitle").val();
		console.log(btitle);
		$.get("${pageContext.request.contextPath }/week/publishBook", { "btitle" : btitle}, function(obj){
			console.log("get 진행..." + obj);
		 	if (obj.rst) {
				window.alert("출간신청 완료");
			} else {
				/* if (obj.failp != null) {
					window.alert("30일 기준으로 출간신청을 하여 더이상의 출간신청을 할 수 없습니다.");
				} else { */
					window.alert("출간신청을 하실 수 없습니다.");
				/* } */
			} 
			window.close();
			opener.location.reload();
		});
	}
</script>