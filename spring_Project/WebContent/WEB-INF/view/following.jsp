<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<div class="container text-center">
	<div align="center">
		<h2>나의 관심 작가</h2>
		<div class="list-group">
			<c:forEach var="f" items="${ follow}">
				<a href="#" class="list-group-item"></a> 
			</c:forEach>	
		</div>
	</div>
</div>