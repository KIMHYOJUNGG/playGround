<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div style="margin-top: 15px">
	<div class="container" style="width:100%">
	
		<div class="row">
			<div class="col-sm-4">
				<c:if test="${!empty writerInfo.IMAGE }">
					<img src="${writerInfo.IMAGE }" class="img-circle"  style="width: 240px; height: 240px;">
				</c:if>
				<c:if test="${empty writerInfo.IMAGE }">
					<img src="${pageContext.request.contextPath }/image/default_profile.png" style="width: 240px; height: 240px;" class="img-circle">
			</c:if>
			</div>
			<div class="col-sm-8 outer">
				<div class="inner">
					<div class="centered">
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
			</div>
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
	
		<div align="right">
	  		<c:if test="${logon eq writerInfo.ID }">
			  	<div class="btn-group">
			      <a href="${pageContext.request.contextPath }/board/register"><button type="button" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>쓰기</button></a>
			      <a href="${pageContext.request.contextPath }/bookPage"><button type="button" class="btn btn-info"><span class="glyphicon glyphicon-book"></span> 등록</button></a>
				</div> 
			</c:if>
		
			<c:if test="${logon  != writerInfo.ID || logon== null}">
				<c:forEach items="${follower }" var="fer">
					<c:if test="${fer.READER eq logon}">
						<c:set var="fan" value="true" />
					</c:if>
				</c:forEach>
				<button type="button" class="btn btn-info"  id="sendMsg" onclick="sendMsg('${writerInfo.ID}')"><span class="glyphicon glyphicon-envelope"></span></button>

			<div class="modal fade" id="sendModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title" id="sendHead">메세지 보내기</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal"
								action="${pageContext.request.contextPath }/message/send" method="post">
								<div class="form-group text-right">
									<label for="getid" class="control-label col-sm-2"> 받을 	사람</label>
									<div class="col-sm-10">
										<input type="text" class="form-control " id="getid" name="getid" required>
									</div>
								</div>
								<div class="form-group">
									<label for="msgtitle" class="control-label col-sm-2">제목</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="msgtitle" name="title" required>
									</div>
								</div>
								<div class="form-group">
									<label for="msgBody" class="control-label col-sm-2">내용</label>
									<div class="col-sm-10">
										<textarea class="form-control" id="msgBody" rows="15" name="msg"  style="resize: none; overflow-y: scroll;" required></textarea>
									</div>
								</div>
								<button type="submit" class="btn btn-default" formaction="${pageContext.request.contextPath }/message/send">보내기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<script>
				 function sendMsg(getid){
						$("#getid").val(getid);
						$("#sendModal").modal();
					}
			</script>
			<c:choose>
				<c:when test="${fan ne true}">
					<button type="button" class="btn btn-info"  id="followbt">구독하기</button>
				  </c:when>
				  <c:otherwise>
				  	<button type="button" class="btn btn-info"  id="canclebt">구독취소</button>
				  </c:otherwise>
				  </c:choose>
			</c:if>
			</div>
			 <!-- Modal -->
				  <div class="modal fade" id="result"  role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
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
				  
				  	<!-- Modal -->
					  <div class="modal fade" id="cancle"  role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
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
					  
			<p></p>
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">CONTENTS</a></li>
				<li><a data-toggle="tab" href="#menu1">BOOK</a></li>
			</ul>
	
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<c:choose>
					<c:when test="${!empty contentList }">
						<c:choose>
							<c:when test="${fn:length(contentList) > 10 }">
							<div class="list-group" id="div_lg"> 
								<c:forEach var="ci" begin="0" end="9" varStatus="vs">
									<c:set var="c" value="${contentList[ci] }"/>
									<li class="list-group-item">
										<h3 class="list-group-item-heading" style="margin-bottom: 15px"><a href="${pageContext.request.contextPath }/bookPage/${c.BNO}">
											<span class="glyphicon glyphicon-book" style="font-size:15pt"></span> &nbsp;${c.BOOKNAME}</a> &nbsp; 
											<a href="${pageContext.request.contextPath }/search?word=${c.TYPE}"><span class="badge bg_type">${c.TYPE}</span></a></h3>
										<a href="${pageContext.request.contextPath}/board/readPage?no=${c.NO}"><h4>${c.TITLE}</h4></a>
										<p class="list-group-item-text"><span class="glyphicon glyphicon-eye-open"></span> ${c.VIEWCNT} &nbsp; &nbsp; <span class="glyphicon glyphicon-pencil"></span> <fmt:formatDate value="${c.REGDATE}" pattern="yy/MM/dd hh:mm"/></p>
										${ci }
									</li>
									<c:if test="${vs.last }">
										<button type="button" class="btn btn-default btn-block more" value="${vs.count }">더 보기</button>
									</c:if>							
								</c:forEach>
								</div>
								<script>
									$(function(){
										$("#div_lg").on("click", ".more", function(e){
											console.log(e);
											console.log(e.target.value);
											e.target.style.display = "none";
											more(e.target.value);
										});
										
										function more(idx) {
											console.log("more");
											idx = parseInt(idx, 10);
											console.log(idx);
											$.get("${pageContext.request.contextPath }/@${writerInfo.ID}/moreContents",function(con){
												console.log(con);
												if(con != null) {
													var html = $("#div_lg").html();
													var more = (idx+10) < con.length;
													var end =  more ?  idx + 10 : con.length;
													for(var i = idx; i < end; i++) {
														html += "<li class='list-group-item'>"
																	+ "<h3 class='list-group-item-heading' style='margin-bottom: 15px'><a href='${pageContext.request.contextPath }/bookPage/"+con[i].BNO+"'>"
																	+"<span class='glyphicon glyphicon-book' style='font-size:15pt'></span> &nbsp;"+con[i].BOOKNAME+"</a> &nbsp;" 
																	+"<a href='${pageContext.request.contextPath }/search?word="+con[i].TYPE+"'><span class='badge bg_type'>"+con[i].TYPE +"</span></a></h3>"
																	+"<a href='${pageContext.request.contextPath}/board/readPage?no="+con[i].NO+"'><h4>"+con[i].TITLE+"</h4></a>"
																	+"<p class='list-group-item-text'><span class='glyphicon glyphicon-eye-open'></span>"+ con[i].VIEWCNT+" &nbsp; &nbsp;"
																	+" <span class='glyphicon glyphicon-pencil'></span> "+con[i].REGDATE+"</p>"+i+"</li>";
													}
													if(more) {
														html += "<button type='button' class='btn btn-default btn-block more' id="+i+" value="+i+">더 보기</button>";
													}
													$("#div_lg").html(html);
												}
											});
										}
									});
								</script>
							</c:when>
							<c:otherwise>
							<div class="list-group"> 
							<c:forEach var="c" items="${contentList}">
								<li class="list-group-item">
									<h3 class="list-group-item-heading" style="margin-bottom: 15px"><a href="${pageContext.request.contextPath }/bookPage/${c.BNO}">
									<span class="glyphicon glyphicon-book" style="font-size:15pt"></span> &nbsp;${c.BOOKNAME}</a> &nbsp;
									<a href="${pageContext.request.contextPath }/search?word=${c.TYPE}"><span class="badge bg_type">${c.TYPE}</span></a></h3>
										<a href="${pageContext.request.contextPath}/board/readPage?no=${c.NO}"><h4>${c.TITLE}</h4></a>
										<p class="list-group-item-text"><span class="glyphicon glyphicon-eye-open"></span> ${c.VIEWCNT} &nbsp; &nbsp; <span class="glyphicon glyphicon-pencil"></span> 
										<fmt:formatDate value="${c.REGDATE }" pattern="yy/MM/dd hh:mm"/></p>
								</li>
								</c:forEach>
								</div>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
					<br>
					<div align="center">
						<p>등록된 글이 없습니다.</p>
						<c:if test="${logon eq wirterInfo.ID }">
						<p>글을 등록해 보세요.</p>
						<a href="${pageContext.request.contextPath }/board/register"><button type="button" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>글쓰기</button></a>
						</c:if>
					</div>
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
									<h3 class="list-group-item-heading"><a href="${pageContext.request.contextPath }/bookPage/${b.bno}">${b.bookName}</a> &nbsp; 
									<c:forEach items="${b.tag }" var="tag">
										<a href="${pageContext.request.contextPath }/search?word=${tag}"><span class="badge search"> ${tag}</span></a>
									</c:forEach>
									</h3>
								<p class="list-group-item-text" style="margin-top:15px;"><span class="glyphicon glyphicon-heart"></span> ${b.good}</p>
								</div>
								<div class="col-sm-4" align="center">
									<h3 class="list-group-item-heading" style="color: blue">${b.cnt } <span style="color:blue">contents</span></h3>
									<c:if test="${logon eq b.writer }">
										<p class="list-group-item-text">
											<a href="${pageContext.request.contextPath }/board/register?${b.bno}"><button type="button" class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span>쓰기</button></a>
											<a href="${pageContext.request.contextPath }/bookPage/${b.bno}/modify"><button type="button" class="btn btn-info"><span class="glyphicon glyphicon-book"></span> 관리</button></a>
										</p>
									</c:if>
								</div>
							</div>
						</li>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<br>
					<div align="center">
						<p>등록된 책이 없습니다.</p>
						<c:if test="${logon eq wirterInfo.ID }">
						<p>책을 등록해 보세요.</p>
						<a href="${pageContext.request.contextPath }/bookPage"><button type="button" class="btn btn-info"><span class="glyphicon glyphicon-book"></span> 등록하기</button></a>
						</c:if>
					</div>
				</c:otherwise>
				</c:choose>
			</div>
		</div>

	</div>
</div>