<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<c:choose>
		<c:when test="${lv==0}">
			현재 귀하의 권한으로는 행할수 없습니다.</br>
			이메일 인증을 통하여 권한을 변경하시겠습니까?<br />
			<a href="/member/lvup2"> 예 </a> / <a href="${uri }"> 아니오 </a> 
		</c:when>
		<c:otherwise>
			현재 귀하의 권한은 제한되어있습니다.<br/>
			관리자와 문의해보세요.<br/>
		</c:otherwise>
	</c:choose>
</body>
<script>
	console.log('${lv}');
	console.log('${uri}');
</script>