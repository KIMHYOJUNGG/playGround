<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container text-center">
		<h2>${writerInfo.NICKNAME }님의 관심 작가</h2>
	<c:choose>
		<c:when test="${!empty  writerFollowing}">
			<div class="list-group">
				<c:forEach var="f" items="${writerFollowing}">
					<a href="#" class="list-group-item">
						<div class="row">
							<div class="col-sm-2" 	style="padding-left: 15px; padding-right: 5px">
								<img src="${f.IMAGE }" alt="Image" class="img-responsive img-circle" style="width: 100px">
							</div>
							<div class="col-sm-10" style="padding: 5px">
								<h4 class="list-group-item-heading">${f.NICKNAME}</h4>
								<c:if test="${fn:length(f.WELCOME) > 0}">
									<p class="list-group-item-text">${f.WELCOME}</p>
								</c:if>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</c:when>
		<c:otherwise>
		관심 작가가 없습니다.
		</c:otherwise>
	</c:choose>
</div>