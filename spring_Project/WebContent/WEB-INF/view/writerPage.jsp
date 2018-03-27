<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="jumbotron" style="background-color: white">
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
			<div class="col-sm-8">
				<h2>${writerInfo.NICKNAME}</h2>
				<p>
					글 <span class="badge">${fn:length(contentList) }</span> | 책 <span class="badge">${fn:length(bookList)}</span> | 
					<a href="${pageContext.request.contextPath }/@${ writerInfo.ID}/following">관심작가 <span class="badge">
					${fn:length(writerFollowing) }</span></a> |
					구독자  <span class="badge">${fn:length(follower)}</span>
				</p>
				<p>
					<span style="color: gray">${writerInfo.WELCOME}</span>
				</p>
			</div>
			<div class="col-sm-1">
			<c:if test="${logon  != writerInfo.ID || logon== null}">
				<c:forEach items="${follower }" var="fer">
					<c:set var="fan" value="${fer.READER eq logon}"/>
				</c:forEach>
				<c:choose>
				<c:when test="${fan ne true}">
				<button type="button" class="btn btn-info"  id="followbt">구독하기</button>
				  <!-- Modal -->
				  <div class="modal fade" id="result"  role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title" >구독하기</h4>
				        </div>
				        <div class="modal-body">
				          <p id="mbody"></p>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal" id="rClose">Close</button>
				        </div>
				      </div>
				      
				    </div>
				  </div>
				  <script>
					  	$("#followbt").click(function(){
							$.get("${pageContext.request.contextPath}/follow",  {"target": "${writerInfo.ID}"
								}).done(function(rst){
									var html="";
									if(rst.result) {
										html = "${writerInfo.NICKNAME} 님을 관심 작가로 등록하였습니다. "
									} else {
										html = "<span style='color: red'>관심 작가 등록실패. 다시 시도해 주세요.</span> "
									}
										$("#mbody").html(html);
						  			$("#result").modal();
								})	;
				  		});
					  	
					  	$("#rClose").click(function(){
					  		location.assign("${pageContext.request.contextPath}/@${writerInfo.ID}");
					  	});
				  </script>
				  </c:when>
				  <c:otherwise>
				  	<button type="button" class="btn btn-info"  id="canclebt">구독취소</button>
					  	<!-- Modal -->
					  <div class="modal fade" id="cancle"  role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title" >구독취소</h4>
					        </div>
					        <div class="modal-body">
					          <p id="cancleBody"></p>
					        </div>
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal" id="cClose">Close</button>
					        </div>
					      </div>
					      
					    </div>
					  </div>
					  <script>
						  	$("#canclebt").click(function(){
								$.get("${pageContext.request.contextPath}/follow/cancle",  {"target": "${writerInfo.ID}"
									}).done(function(rst){
										var html="";
										if(rst.result) {
											html = "${writerInfo.NICKNAME} 님을 관심 작가에서 삭제하였습니다. "
										} else {
											html = "<span style='color: red'>관심 작가 삭제실패. 다시 시도해 주세요.</span> "
										}
											$("#cancleBody").html(html);
							  			$("#cancle").modal();
									})	;
					  		});
						  	
						  	$("#cClose").click(function(){
						  		location.assign("${pageContext.request.contextPath}/@${writerInfo.ID}");
						  	});
					  </script>
				  </c:otherwise>
				  </c:choose>
			</c:if>
			</div>
		</div>

		<c:if test="${! empty msg }">
			<!-- Modal -->
			<div class="modal fade" id="bookRegister" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">책 등록하기</h4>
						</div>
						<div class="modal-body">
							<p id="mbody2"></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>

			<script>
				$("#mbody2").html("${msg}");
				$("#bookRegister").modal();
			</script>
		</c:if>

		<hr />

	<div class="row">
	  <div class="col-sm-8">
			<ul class="nav nav-pills">
				<li class="active"><a data-toggle="pill" href="#home">CONTENTS</a></li>
				<li><a data-toggle="pill" href="#menu1">BOOK</a></li>
			</ul>
			 </div>
	  <div class="col-sm-4">
	  	<c:if test="${logon eq writerInfo.ID }">
	  	 <div class="btn-group">
	      <a href="${pageContext.request.contextPath }/board/register"><button type="button" class="btn btn-primary">글쓰기</button></a>
	      <a href="${pageContext.request.contextPath }/bookPage"><button type="button" class="btn btn-primary">책 등록</button></a>
		</div> 
		</c:if>
	  </div>
	 </div>
	<hr/>	
	
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<c:choose>
				<c:when test="${!empty contentList }">
					<div class="list-group">
						<c:forEach var="c" items="${contentList}">
						<li class="list-group-item">
								<h3 class="list-group-item-heading" style="margin-bottom: 15px"><a href="${pageContext.request.contextPath }/bookPage/${c.BNO}">${c.BOOKNAME}</a> &nbsp;
								<a href="${pageContext.request.contextPath }/search?search=${c.TYPE}"><span class="badge">${c.TYPE}</span></a></h3>
									<a href="${pageContext.request.contextPath}/board/readPage?no=${c.NO}"><p class="list-group-item-text" style="margin-bottom: 3px">  ${c.TITLE}</p>
									<p class="list-group-item-text">${c.VIEWCNT} | ${c.REGDATE}</p></a>
							</li>
							</c:forEach>
						</div>
				</c:when>
				<c:otherwise>
					<p>등록된 글이 없습니다.</p>
					<p>글을 등록해 보세요.</p>
					<a href="${pageContext.request.contextPath }/board/register"><button type="button" class="btn btn-info">글쓰기</button></a>
				</c:otherwise>
				</c:choose>
			</div>
			
			<div id="menu1" class="tab-pane fade">
				<c:choose>
				<c:when test="${!empty bookList }">
					<div class="list-group">
					<c:forEach var="i" begin="0" end="${fn:length(bookList)-1 }">
						<c:set var="b" value="${bookList[i] }"/>
						<c:set var="bc" value="${bookContentsList[i] }"/>
						<li class="list-group-item">
							<div class="row">
								<div class="col-sm-8">
									<h3 class="list-group-item-heading"><a href="${pageContext.request.contextPath }/bookPage/${b.bno}">${b.bookName}</a></h3>
								<p class="list-group-item-text">
									<c:forEach items="${b.tag }" var="tag">
										<a href="${pageContext.request.contextPath }/search?search=${tag}"><span class="badge"> ${tag}</span></a>
									</c:forEach>
								</p>
								<p class="list-group-item-text">${b.good}</p>
								</div>
								<div class="col-sm-4">
									<h2 style="color: blue">${b.cnt } <span style="color:blue">contents</span></h2>
									<c:if test="${logon eq b.writer }">
										<p class="list-group-item-text"><a href="${pageContext.request.contextPath }/board/register?${b.bno}"><button type="button" class="btn btn-info">이어쓰기</button></a></p>
									</c:if>
								</div>
							</div>
						</li>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<p>등록된 책이 없습니다.</p>
					<p>책을 등록해 보세요.</p>
					<a href="${pageContext.request.contextPath }/bookPage"><button type="button" class="btn btn-info">책 등록하기</button></a>
				</c:otherwise>
				</c:choose>
			</div>
		</div>

	</div>
</div>