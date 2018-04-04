<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
	.centered {
  position: relative;
  display: inline-block;
 
  width: 50%;
  padding: 1em;
}
</style>
<div class="container text-center" >
	<h2>${writerInfo.NICKNAME }님의 관심 작가</h2>
	<c:choose>
		<c:when test="${!empty  writerFollowing}">
			<div class="list-group">
				<c:forEach var="f" items="${writerFollowing}">
					<li class="list-group-item" style="margin-top: 20px;">
						<div class="row">
							<div class="col-sm-4" 	style="padding-left: 15px; padding-right: 5px">
								<a href="${pageContext.request.contextPath }/@${f.ID}"> <c:if
										test="${!empty f.IMAGE }">
										<img src="${f.IMAGE }" class="img-circle" alt="img" style="width: 240px; height: 240px;">
									</c:if>
									 <c:if test="${empty f.IMAGE }">
										<img src="${pageContext.request.contextPath }/image/default_profile.png"
											style="width: 240px; height: 240px;" class="img-circle">
									</c:if>
								</a>
							</div>
							<div class="col-sm-8 outer" style="padding: 15px; ">
										<div class="inner" >
											<div class="centered" style="width: 100%; padding-top: 0px;">
												<a href="${pageContext.request.contextPath }/@${f.ID}">
													<h3>${f.NICKNAME}</h3> 
													<c:if	test="${fn:length(f.WELCOME) > 0}">
														<p style="margin: 0px;">${f.WELCOME}</p>
													</c:if> <c:if test="${fn:length(f.WELCOME) <= 0}">
														<p style="margin: 0px;">
															<span style="color: gray">등록된 인사말이 없습니다.</span>
														</p>
													</c:if>
												</a>
											</div>
										</div>
										<div class="inner" >
											<div class="centered" style="width: 100%">
												<c:forEach var="fb" items="${followingBookList}">
													<c:if test="${fb.writer eq f.ID }">
														<c:set var="list" value="${fb.list }" />
														<h3>
															<c:choose>
																<c:when test="${fn:length(list) > 2 }">
																	<c:forEach var="bi" begin="0" end="1" varStatus="vs">
																		<a href="${pageContext.request.contextPath }/bookPage/${list[bi].bno}">${list[bi].bookName }</a>
																		<c:if test="${!vs.last}"> / </c:if>
																		<c:if test="${vs.last }"> ...</c:if>
																	</c:forEach>
																</c:when>
																<c:otherwise>
																	<c:forEach var="book" items="${list }"  varStatus="vs">
																		<a href="${pageContext.request.contextPath }/bookPage/${book.bno}">${book.bookName }</a>
																		<c:if test="${!vs.last}"> / </c:if>
																	</c:forEach>
																</c:otherwise>
															</c:choose>
														</h3>
													</c:if>
												</c:forEach>
												<c:forEach var="map" items="${regList }" varStatus="vs">
													<c:choose>
														<c:when  test="${map.WRITER eq f.ID }">
														<c:set var="m" value="${map }"/>
															<p>	최근 글 등록일 <span style="color: gray"><fmt:formatDate value="${ m.REGDATE}" pattern="yy/MM/dd HH:mm"/></span></p>
														</c:when>
														<c:otherwise>
															<c:if test="${vs.last }">
																<p>	등록된 글 없음</p>
															</c:if>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</div>
										</div>
										<div class="inner" >
											<div class="centered" style="width: 100%">
											<p class="list-group-item-text">
												<button class="btn btn-info canclebt" id="${f.ID }" value="${f.NICKNAME }">구독 취소</button>
											</p>
											</div>
										</div>
								</div>
					</li>
								<!-- Modal -->
								<div class="modal fade" id="cancle" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
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
				</c:forEach>
								<script>
									$(".canclebt").click(function(){
										var id = $(this).attr("id");
										var name =$(this).val();
											
										$.get("${pageContext.request.contextPath}/follow/cancle",  {"target": $(this).attr("id")
											}).done(function(rst){
												var html="";
												if(rst.result) {
													html = name+" 님을 관심 작가에서 삭제하였습니다. "
												} else {
													html = "<span style='color: red'>관심 작가 삭제실패. 다시 시도해 주세요.</span> "
												}
													$("#cancleBody").html(html);
									  			$("#cancle").modal();
											})	;
							  		});
								  	
								  	$("#cClose").click(function(){
								  		location.assign("${pageContext.request.contextPath}/@${writerInfo.ID}/following");
								  	});
								</script>
			</div>
		</c:when>
		<c:otherwise>
		<hr/>
		<p>관심 작가가 없습니다.</p>
		</c:otherwise>
	</c:choose>
</div>