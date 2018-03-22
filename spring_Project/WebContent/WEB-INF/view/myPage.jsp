<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jstl/core" prefix="c" %>

<div class="container text-center">
	<br>
	<div class="row">
		<div class="col-sm-4">
			<img src="${info.IMAGE}" class="img-responsive img-circle" style="width: 100%" alt="Image">
			<p>NICKNAME님</p>
		</div>
		<div class="col-sm-8">
			<div class="list-group">
				<a href="${pageContext.request.contextPath }/modifyInfo" class="list-group-item">개인정보 수정</a> 
				<a href="#" class="list-group-item">우편함 <span>신고 0 건 | 메세지 0 건</span></a> 
				<a href="${pageContext.request.contextPath }/@${logon}" class="list-group-item">연재 중인 글</a>
<!-- 				<a href="#" class="list-group-item">내가 출간한 글</a> -->
			</div>
		</div>
	</div>

		<p><h3><a href="${pageContext.request.contextPath }/@${logon }/following">관심 작가</a>의 새 글</h3></p>
		<div class="list-group">
<%-- 			<c:forEach items="${article }" var="a" varStatus="vs"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${vs.index}"> --%>
						<li  class="list-group-item">
							<h4 class="list-group-item-heading">{article.TITLE} </h4>
      						<p class="list-group-item-text">{article.WRITER}</p>
      					</li>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
					<a><p>더보기</p></a>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<%-- 			</c:forEach>  --%>
		</div>





</div>
<br>