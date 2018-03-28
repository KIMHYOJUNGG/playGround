<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container text-center">
	<h2>${writerInfo.NICKNAME }님의 관심 작가</h2>
	<c:choose>
		<c:when test="${!empty  writerFollowing}">
			<div class="list-group">
				<c:forEach var="f" items="${writerFollowing}">
					<li class="list-group-item">
						<div class="row" >
							<div class="col-sm-4" 	style="padding-left: 15px; padding-right: 5px">
								<a href="${pageContext.request.contextPath }/@${f.ID}">
								<c:if test="${!empty f.IMAGE }">
									<img src="${f.IMAGE }" class="img-circle" style="width: 240px; height: 240px;">
								</c:if>
								<c:if test="${empty f.IMAGE }">
									<img src="${pageContext.request.contextPath }/image/default_profile.png"style="width: 240px; height: 240px;" class="img-circle">
								</c:if>
								</a>
							</div>
							<div class="col-sm-8" style="padding: 5px; height: 240px">
							<a href="${pageContext.request.contextPath }/@${f.ID}">
								<div style="height: 20%">
									<h3>${f.NICKNAME}</h3>
								</div>
								<div style="height: 20%">
									<c:if test="${fn:length(f.WELCOME) > 0}">
										<p class="list-group-item-text">${f.WELCOME}</p>
									</c:if>
									<c:if test="${fn:length(f.WELCOME) <= 0}"><p><span style="color: gray">등록된 인사말이 없습니다.</span></p></c:if>
								</div>
							</a>
								<div style="height: 20%">
									<c:forEach var="fb" items="${followingBookList}">
										<c:if test="${fb.writer eq f.ID }">
											<c:set var="list" value="${fb.list }"/>
											<h3>
											<c:forEach var="book" items="${list }" varStatus="vs">
												<a href="${pageContext.request.contextPath }/bookPage/${book.bno}">${book.bookName }</a>
												<c:if test="${!vs.last }">/ </c:if>
											</c:forEach>
											</h3>
										</c:if>
									</c:forEach>
								</div>
								<div style="height: 20%">
									<h3>${f.NICKNAME}</h3>
								</div>
								<div style="height: 20%">
									<p class="list-group-item-text"><button class="btn btn-info"  id="canclebt">구독 취소</button></p>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</div>
		</c:when>
		<c:otherwise>
		관심 작가가 없습니다.
		</c:otherwise>
	</c:choose>
</div>