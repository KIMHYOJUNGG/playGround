<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	img {
	    max-width: 100%;
	    height: auto;
	}

	.centered {
  position: relative;
  display: inline-block;
 
  width: 50%;
  padding: 1em;
  }
</style>

<div class="container text-center">
	<br>
	<div class="row">
		<div class="col-sm-4">
			<c:if test="${!empty info.IMAGE }">
				<img src="${info.IMAGE }" class="img-circle" style="max-height: 250px;">
			</c:if>
			<c:if test="${empty info.IMAGE }">
				<img src="${pageContext.request.contextPath }/image/default_profile.png" style="max-height: 250px;" class="img-circle">
			</c:if>
			<p>${info.NICKNAME} 님</p>
		</div>
		<div class="col-sm-8 outer">
			<div class="list-group inner">
				<div class="centered"  style="width: 100%;">
					<a href="${pageContext.request.contextPath }/modifyInfo" class="list-group-item"><b>개인정보 수정</b></a> 
					<a href="${pageContext.request.contextPath }/message" class="list-group-item " ><b>우편함 </b><span>새 메세지 ${newMsgCnt } 건</span></a> 
					<a href="${pageContext.request.contextPath }/@${logon}" class="list-group-item"><b>연재 중인 글</b></a>
					<a href="${pageContext.request.contextPath }/@${logon}/following" class="list-group-item"><b>관심 작가 관리</b></a>
<!-- 				<a href="#" class="list-group-item">내가 출간한 글</a> -->
				</div>
			</div>
		</div>
	</div>

		<p><h3><a href="${pageContext.request.contextPath }/@${logon }/following">관심 작가</a>의 새 글</h3></p>
		<div class="list-group">
			<c:if test="${!empty article }">
			<c:forEach  var="ai" begin="0" end="${fn:length(article) >= 15 ? 14 : fn:length(article)-1}">
						<li  class="list-group-item">
							<h4 class="list-group-item-heading">
							<a href="${pageContext.request.contextPath }/search?search=${article[ai].TYPE}"><span class="badge">${article[ai].TYPE }</span></a>
							<a href="${pageContext.request.contextPath }/board/read?no=${article[ai].NO}">${article[ai].TITLE} 
							<span style="font-size:12px; color: gray;">${article[ai].REGDATE }</span>
							</a></h4>
   							<p class="list-group-item-text">
   							<span style="font-size:12px; color: gray; font-style: italic;">by</span> 
   							<a href="${pageContext.request.contextPath }/@${article[ai].WRITER}">${article[ai].NICKNAME}</a></p>
      					</li>
			</c:forEach> 
				<c:if test="${fn:length(article) > 15 }">
					<a><p>더보기</p></a>
				</c:if>
			</c:if>
			
			<c:if test="${empty article }">
				관심 작가의 글이 없습니다.
			</c:if>


		</div>





</div>
<br>