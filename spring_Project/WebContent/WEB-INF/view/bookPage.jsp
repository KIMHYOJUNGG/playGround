<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
	<c:when test="${empty bookContents}">
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
								<span class="badge">${fn:length(writerFollowing) }</span>
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
				<c:if test="${!empty writerInfo.IMAGE }">
					<img src="${writerInfo.IMAGE}" style="width: 240px; height: 240px;" class="img-circle">
				</c:if>
			</div>
			<div class="col-sm-8">
				<h2>${bookInfo.bookName}</h2>
				<p>
					<span style="font-size:12px; color: gray; font-style: italic;">by</span> <a href="${pageContext.request.contextPath }/@${writerInfo.ID}">${writerInfo.NICKNAME }</a>
					<span style="font-size:12px; color: gray; font-style: italic;"> | view</span> <span class="badge">${bookInfo.good }</span>
				</p>
				<p>
					<c:forEach items="${bookInfo.tag }" var="t">
					<span class="badge">${t }</span>
					</c:forEach>
				</p>
			</div>
			<div class="col-sm-1">
			<c:if test="${logon  != writerInfo.ID || logon== null}">
				<button type="button" class="btn btn-info">구독하기</button>
			</c:if>
			<c:if test="${logon == writerInfo.ID }">
				<c:choose>
					<c:when test="${!empty contentsList }">
						<a href="${pageContext.request.contextPath }/board/register?bno=${contentsList[0].BNO}"><button type="button" class="btn btn-info">이어서 쓰기</button></a>
					</c:when>
					<c:otherwise>
						
					</c:otherwise>
				</c:choose>
			</c:if>
			
			</div>
		</div>
		
		<hr/>

				<div class="container">
				<c:if test="${!empty contentsList }">
					<ul class="list-group">
						<li class="list-group-item">
							<div class="row">
					<c:forEach begin="0" end="${fn:length(boardVOList)-1 }" var="i" varStatus="vs">
						<c:set var="vo" value="${boardVOList[i] }"/>
											<c:set var="c" value="${contentsList[i] }"/>
								<div class="col-sm-4">
									<div class="card">
									<a href="${pageContext.request.contextPath}/board/read?no=${c.NO}">
										<c:if test="${empty vo.image }">
											<img class="card-img-top" src="${pageContext.request.contextPath }/image/Desert.jpg" alt="Card image" style="width: 100%">
										</c:if>
										<c:if test="${! empty vo.image }">
											<img class="card-img-top" src="${vo.image }" alt="Card image" style="width: 100%">
										</c:if>
										<div class="card-body">
											<h3 class="card-title">${c.TITLE }</h3></a>
											<h4><a href="${pageContext.request.contextPath }/search?search=${c.TYPE }"><span class="badge">${c.TYPE }</span></a>
											<span style="color: gray; font-size: 11pt;">GOOD</span> <span class="badge">${c.GOOD }</span>
											<span style="color: gray; font-size: 11pt;">VIEW</span> <span class="badge">${c.VIEWCNT }</span></h4>
											<p>
											<c:forEach items="${vo.tag}" var="t">
												<a href="${pageContext.request.contextPath }/search?search=${t}"><span class="badge"> ${t}</span></a>
											</c:forEach>
											</p>
										</div>
									</div>
								</div>
								<c:choose>
									<c:when test="${vs.count%3 eq 0 }">
										</div>
										</li>
										<c:if test="${!vs.last }">
											<li class="list-group-item">
											<div class="row">
										</c:if>		
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
					</c:forEach>
						</li>
					</ul>
				</c:if>
				<c:if test="${empty contentsList }">
					<p>발행된 글이 없습니다.</p>
					<c:if test="${contentsList.WRITER eq logon}">
						<p>글을 등록해 보세요!</p>
						<a href="${pageContext.request.contextPath }/board/register?bno=${contentsList.BNO}"><button type="button" class="btn btn-info">글쓰기</button></a>
					</c:if>
				</c:if>
				</div>
	</c:otherwise>
</c:choose>
