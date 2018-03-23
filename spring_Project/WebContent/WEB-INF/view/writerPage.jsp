
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="jumbotron" style="background-color: white">
	<div class="container">
	
		<div class="row">
			<div class="col-sm-3">
				<img src="${writerInfo.IMAGE }" class="img-circle"  style="width: 100%">
			</div>
			<div class="col-sm-8">
				<h2>${writerInfo.NICKNAME}</h2>
				<p>
					글 <span class="badge">${fn:length(contentList) }</span> | 책 <span class="badge">${fn:length(bookList)}</span> | <a href="${pageContext.request.contextPath }/@${ writerInfo.ID}/following">관심작가 <span class="badge">0</span></a>
				</p>
				<p>
					<span style="color: gray">${writerInfo.WELCOME}</span>
				</p>
			</div>
			<div class="col-sm-1">
			<c:if test="${logon  != id || logon== null}">
				<button type="button" class="btn btn-info">구독하기</button>
			</c:if>
			</div>
		</div>
		
		<hr />

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">CONTENTS</a></li>
			<li><a data-toggle="tab" href="#menu1">BOOK</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<c:choose>
				<c:when test="${!empty contentList }">
					<div class="list-group">
						<c:forEach var="c" items="${contentList}">
						<li class="list-group-item">
								<h3 class="list-group-item-heading"><a href="#">${c.BOOKNAME}</a> &nbsp;<span class="badge">${c.TYPE}</span></h3>
									<a href="${pageContext.request.contextPath}/board/read?no=${c.NO}"><p class="list-group-item-text">  ${c.TITLE}</p>
									<p class="list-group-item-text">${c.VIEWCNT} | ${c.REGDATE}</p></a>
							</li>
							</c:forEach>
						</div>
				</c:when>
				<c:otherwise>
					<p>등록된 글이 없습니다.</p>
					<p>글을 등록해 보세요.</p>
					<a href="${pageContext.request.contextPath }/board/register"><button type="button" class="btn btn-info">글 쓰러 가기</button></a>
				</c:otherwise>
				</c:choose>
			</div>
			
			<div id="menu1" class="tab-pane fade">
				<c:choose>
				<c:when test="${!empty bookList }">
					<div class="list-group">
					<c:forEach var="b" items="${bookList}">
						<li class="list-group-item">
							<h3 class="list-group-item-heading"><a href="#">${b.bookName}</a></h3>
								<p class="list-group-item-text">
									<c:forEach items="${b.tag }" var="tag">
										<a href="#"><span class="badge"> ${tag}</span></a>
									</c:forEach>
								</p>
								<p class="list-group-item-text">${b.good}</p>
						</li>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<p>등록된 책이 없습니다.</p>
					<p>책을 등록해 보세요.</p>
					<a href=""><button type="button" class="btn btn-info">책 등록하러 가기</button></a>
				</c:otherwise>
				</c:choose>
			</div>
		</div>

	</div>

</div>