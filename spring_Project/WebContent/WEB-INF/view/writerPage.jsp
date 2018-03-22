<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="jumbotron" style="background-color: white">
	<div class="container">
	
		<div class="row">
			<div class="col-sm-3">
				<img src="cinqueterre.jpg" class="img-circle" alt="cinqueterre"  style="width: 100%">
			</div>
			<div class="col-sm-8">
				<h2>NICKNAME</h2>
				<p>
					글 <span class="badge">0</span> | 책 <span class="badge">0</span> | <a href="${pageContext.request.contextPath }/@NICKNAME/following">관심작가 <span class="badge">0</span></a>
				</p>
				<p>
					<span style="color: gray">WELCOME</span>
				</p>
			</div>
			<div class="col-sm-1">
			<c:if test="${logon  != id}">
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
			<div class="list-group">
<%-- 				<c:forEach var="c" items="${contentList}"> --%>
				<li class="list-group-item">
						<h3 class="list-group-item-heading"><a href="#">BOOKNAME</a> &nbsp;<span class="badge">TYPE</span></h3>
<%-- 						<c:if test=""> --%>
							<a href="#"><p class="list-group-item-text">  TITLE</p>
							<p class="list-group-item-text">VIEWCNT | REGDATE</p></a>
<%-- 						</c:if> --%>
					</li>
<%-- 					</c:forEach> --%>
				</div>
			</div>
			
			<div id="menu1" class="tab-pane fade">
				<div class="list-group">
<%-- 				<c:forEach var="b" items="${bookList}"> --%>
				<li class="list-group-item">
						<h3 class="list-group-item-heading"><a href="#">BOOKNAME</a> &nbsp;<span class="badge">TYPE</span></h3>
<%-- 						<c:if test="${}"> --%>
							<p class="list-group-item-text"><a href="#"><span class="badge"> tag</span></a></p>
							<p class="list-group-item-text">good</p>
<%-- 						</c:if> --%>
					</li>
<%-- 					</c:forEach> --%>
				</div>
			</div>
		</div>

	</div>
</div>