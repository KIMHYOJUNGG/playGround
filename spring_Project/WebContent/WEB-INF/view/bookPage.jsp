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
						<input type="text" class="form-control" id="tag" placeholder="#태그#입력" name="tag" onkeyup="checkTag()">
					</div>
				</div>
				<div class="form-group" align="right">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">등록</button>
					</div>
				</div>
			</form>
		</div>
		<script>
			function checkTag() {
				var tag = $("#tag").val();
				console.log($("#tag").val());
				if(tag.charCodeAt(tag.length-1) == 32) {
					if(tag.charCodeAt(tag.length-2)!=35){
						$("#tag").val(tag.substr(0, tag.length-1)+"#");
					}	else {
						$("#tag").val(tag.substr(0, tag.length-1));
					}
				}
				if(tag.indexOf("　") != -1){
					if(tag.charCodeAt(tag.indexOf("　")-1) != 35){
						$("#tag").val(tag.replace("　", "#"));
					} else {
						$("#tag").val(tag.substr(0,tag.indexOf("　")) );
					}
				}
			}
		</script>
	</c:when>
	<c:otherwise>
		<div class="jumbotron" style="background-color: white">
			<div class="container">

				<div class="row">
					<div class="col-sm-3">
						<c:if test="${empty writerInfo.IMAGE }">
							<img
								src="${pageContext.request.contextPath }/image/default_profile.png"
								style="width: 240px; height: 240px;" class="img-circle">
						</c:if>
						<c:if test="${!empty writerInfo.IMAGE }">
							<img src="${writerInfo.IMAGE}"
								style="width: 240px; height: 240px;" class="img-circle">
						</c:if>
					</div>
					<div class="col-sm-8">
						<h2>${bookInfo.bookName}</h2>
						<p>
							<span style="font-size: 12px; color: gray; font-style: italic;">by</span>
							<a href="${pageContext.request.contextPath }/@${writerInfo.ID}">${writerInfo.NICKNAME }</a>
							<span style="font-size: 12px; color: gray; font-style: italic;">
								| view</span> <span class="badge">${bookInfo.good }</span>
						</p>
						<p>
							<c:forEach items="${bookInfo.tag }" var="t">
								<span class="badge">${t }</span>
							</c:forEach>
						</p>
					</div>
					<div class="col-sm-1">
						<c:if test="${logon  != writerInfo.ID || logon== null}">
							<c:forEach items="${follower }" var="fer">
								<c:set var="fan" value="${fer.READER eq logon}" />
							</c:forEach>
							<c:choose>
								<c:when test="${fan ne true}">
									<button type="button" class="btn btn-info" id="followbt">구독하기</button>
									<!-- Modal -->
									<div class="modal fade" id="result" role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">구독하기</h4>
												</div>
												<div class="modal-body">
													<p id="mbody"></p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal" id="rClose">Close</button>
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
									<button type="button" class="btn btn-info" id="canclebt">구독취소</button>
									<!-- Modal -->
									<div class="modal fade" id="cancle" role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">구독취소</h4>
												</div>
												<div class="modal-body">
													<p id="cancleBody"></p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal" id="cClose">Close</button>
												</div>
											</div>

										</div>
									</div>
						
								</c:otherwise>
							</c:choose>
						</c:if>

					</div>
				</div>

				<c:if test="${logon == writerInfo.ID }">
					<div align="right">
						<div class="btn-group">
							<a href="${pageContext.request.contextPath }/board/register"><button type="button" class="btn btn-info">이어서 쓰기</button></a>
							<a href="${pageContext.request.contextPath }/bookPage/${bookInfo.bno}/modify"><button type="button" class="btn btn-info">책 정보 수정</button></a>
							<a><button type="button" class="btn btn-info"  onclick="bookDel('${bookInfo.bno}')">책 삭제</button></a>
						</div>
					</div>
				</c:if>

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
					<c:if test="${writerInfo.ID eq logon}">
						<p>글을 등록해 보세요!</p>
						<a href="${pageContext.request.contextPath }/board/register"><button type="button" class="btn btn-info">글쓰기</button></a>
					</c:if>
				</c:if>
				</div>
	</c:otherwise>
</c:choose>

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
							  	
								function bookDel(bno) {
									var ans = window.confirm("삭제시 책에 등록된 모든 게시글이 함께 삭제됩니다.\r\n정말 삭제하시겠습니까?");
									if(ans) {
										$.get("${pageContext.request.contextPath}/bookPage/"+bno+"/del",{"bno" : bno}
											,function(obj){
												if(obj.rst) {
													window.alert("삭제되었습니다.");
													location.assign("${pageContext.request.contextPath}/@${bookInfo.writer}");
												} else {
													window.alert("삭제 실패. \r\n다시 시도해 주세요.");
												}
											});
									}
								}
							</script>
