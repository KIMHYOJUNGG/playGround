<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container text-center">
	<br>
	<div class="row">
		<div class="col-sm-4">
			<c:if test="${!empty info.IMAGE }">
				<img src="${info.IMAGE }" style="width: 240px; height: 240px;" class="img-circle">
			</c:if>
			<c:if test="${empty info.IMAGE }">
				<img src="${pageContext.request.contextPath }/image/default_profile.png" style="width: 240px; height: 240px;" class="img-circle">
			</c:if>
			<p>${info.NICKNAME} 님</p>
		</div>
		<div class="col-sm-8">
			<div class="list-group">
				<a href="${pageContext.request.contextPath }/modifyInfo" class="list-group-item">개인정보 수정</a> 
				<a href="#" class="list-group-item active">우편함 <span>메세지 ${fn:length(msg) } 건</span></a> 
				<a href="${pageContext.request.contextPath }/@${logon}" class="list-group-item">연재 중인 글</a>
<!-- 				<a href="#" class="list-group-item">내가 출간한 글</a> -->
			</div>
		</div>
	</div>
	
	<hr/>

	<div class="container">
		<h2>메세지</h2>
		<p></p>
		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox" class="msgcbx" id="topcbx"></th>
					<th>보낸 사람</th>
					<th>제   목</th>
					<th>보낸 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty getMsg }">
						<td colspan="4">우편함에 메세지가 없습니다.</td>
					</c:when>
					<c:otherwise>
						<c:forEach var="msg" items="${getMsg }">
							<tr>
								<td><input type="checkbox" class="msgcbx"  value="${msg.NO }"></td>
								<td><a href="javascript:void(0);" onclick="sendMsg(${msg.SENDID})">${msg.SENDID }</a></td>
								<td><a href="javascript:void(0);" onclick="readMsg(${msg.NO})">${msg.TITLE }</a></td>
								<td>${msg.REGDATE }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

</div>