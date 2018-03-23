<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
	<c:when test="${empty bno }">
		<div class="jumbotron" style="background-color: white; margin-bottom: 10px">
			<div class="container">
		
				<div class="row">
					<div class="col-sm-3">
						<c:if test="${!empty writerInfo.IMAGE }">
							<img src="${writerInfo.IMAGE }" class="img-circle"  style="width: 100%">
						</c:if>
						<c:if test="${empty writerInfo.IMAGE }">
							<img src="${pageContext.request.contextPath }/image/default_profile.png" style="width: 240px; height: 240px;" class="img-circle">
						</c:if>
					</div>
					<div class="col-sm-9">
						<h2>${writerInfo.NICKNAME}</h2>
						<p>
							글 <span class="badge">${fn:length(contentList) }</span> | 책 <span
								class="badge">${fn:length(bookList)}</span> | <a
								href="${pageContext.request.contextPath }/@${ writerInfo.ID}/following">관심작가
								<span class="badge">0</span>
							</a>
						</p>
						<p>
							<span style="color: gray">${writerInfo.WELCOME}</span>
						</p>
					</div>
				</div>
		
			</div>
		</div>
		
		<div class="container">
			<h3>책 등록하기</h3>
			<form class="form-horizontal" action="${pageContext.request.contextPath }/bookPage" method="post">
				<div class="form-group">
					<label class="control-label col-sm-2" for="bookName">BOOK NAME:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="bookName"
							placeholder="책 제목을 입력해 주세요" name="bookName" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="tag">TAG:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="tag"
							placeholder="#태그#입력" name="tag">
					</div>
				</div>
				<div class="form-group" align="right">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">등록</button>
					</div>
				</div>
			</form>
		</div>
	</c:when>
	<c:otherwise>
		<div class="jumbotron" style="background-color: white">
	<div class="container">
	
		<div class="row">
			<div class="col-sm-3">
				<c:if test="${empty writerInfo.IMAGE }">
					<img src="${pageContext.request.contextPath }/image/default_profile.png" style="width: 240px; height: 240px;" class="img-circle">
			</c:if>
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
		
		<hr/>

				<div class="container">
					<ul class="list-group">

						<li class="list-group-item">
							<div class="row">
								<div class="col-sm-4">
									<div class="card">
										<img class="card-img-top" src="img_avatar1.png" alt="Card image" style="width: 100%">
										<div class="card-body">
											<h4 class="card-title">John Doe</h4>
											<p class="card-text">Some example text some example text.
												John Doe is an architect and engineer</p>
											<a href="#" class="btn btn-primary">See Profile</a>
										</div>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="card">
										<img class="card-img-top" src="img_avatar1.png"
											alt="Card image" style="width: 100%">
										<div class="card-body">
											<h4 class="card-title">John Doe</h4>
											<p class="card-text">Some example text some example text.
												John Doe is an architect and engineer</p>
											<a href="#" class="btn btn-primary">See Profile</a>
										</div>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="card">
										<img class="card-img-top" src="img_avatar1.png"
											alt="Card image" style="width: 100%">
										<div class="card-body">
											<h4 class="card-title">John Doe</h4>
											<p class="card-text">Some example text some example text.
												John Doe is an architect and engineer</p>
											<a href="#" class="btn btn-primary">See Profile</a>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>

				</div>
	</c:otherwise>
</c:choose>
