<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>접근 제한 !!!</h1>

<script>
alert("접근이 제한되었습니다.");
location.href="/";

</script>
   
   <%-- <h4>에러페이지</h4>
   <h4>${exception.getMessage() }</h4>
   
   
   <ul>
   <c:forEach items="${exception.getStackTrace() }" var="stack">
     <li>${stack.toString()}</li>
   </c:forEach>
   </ul> --%>
</body>
</html>