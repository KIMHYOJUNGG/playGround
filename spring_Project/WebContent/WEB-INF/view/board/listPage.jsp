<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false"%>

<%-- <%@include file="../include/header.jsp"%> --%>
<script>
	var result = '${msg}';

	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	}
	
/* 	$(".pagination li a").on("click", function(event){
		
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","/board/listPage").attr("method", "get");
		jobForm.submit();
	}); */
	$(document).ready(
			function() {

				$("#keywordInput").on("change",function(event){
					self.location = "listPage"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + $('#keywordInput').val();
					$(this).focus();
					
				});
				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "listPage"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});
			});

	function showKw() {
		if($("#kw").css("display") == "none")
			$("#kw").css("display", "block");
		else
			$("#kw").css("display", "none");
	}
	
</script>


<div class="outer" style="max-height: 100px">
	<div class="inner">
		<div class="centered" style="width: 100%; height: 70%" align="center" >
			<div class="row" align="center"  style="margin: 10px">
				<div class="col-sm-7" >

					<select name="searchType" style="height: 33.6px; width: 15%">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							Title</option>
						<%-- <option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							Content</option> --%>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							Writer</option>
						<%-- <option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							Title OR Content</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							Content OR Writer</option> --%>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							Title OR Writer</option>
					</select> 
					<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }' style="height: 33.6px">
					<button id='searchBtn' class="btn btn-info"><span class="glyphicon glyphicon-search"></span></button>
				</div>
<!-- <<<<<<< HEAD -->
<%-- 						value='${cri.keyword }'> --%>
<!-- 					<button id='searchBtn'>Search</button> -->
					<script>
// 					$("#searchBtn").onchange(function(){
						
						
// 					});
						var responsive;
							
							function setResponsive() {
							    if ($('div#media-320').css('display') == 'block') responsive = 1;
							    else if ($('div#media-768').css('display') == 'block') responsive = 2; // 모바일
							    else if ($('div#media-1024').css('display') == 'block') responsive = 3;
							    else if ($('div#media-1025').css('display') == 'block') responsive = 0;
							    else responsive = 4;
								console.log("responsive?"+ responsive);
							}
							
							$(window).on('load', function () {
							    setResponsive();
							});
							  
							$(window).on('resize', function () {
							    setResponsive();
							});
							
 					</script> 
<!-- 					<a href="/board/register"><button class='btn btn-primary'>New Board</button></a> -->
					
<!-- 				</div> -->
				
		
				
				
<!-- 					<div class="container"> -->
<%-- 					<c:forEach items="${type}" var="v"> --%>

<%-- 						<a href="/board/listPage?stype=${v }"><button type="button"   --%>
<%-- 						class="btn btn-info btn-sm bb">${v }</button></a>&nbsp; --%>


<%-- 							</c:forEach> --%>
<!-- ======= -->
				<div class="col-sm-5" >		
					<a href="/board/register"><button class='btn btn-primary'><span class="glyphicon glyphicon-pencil"></span> 글쓰기</button></a>
					<button class='btn btn-primary' onclick="showKw()">장르보기</button>
				</div>
			</div>

				<div id="kw" class="container-fulid" align="center" style="display: none;">
					<p style="margin: 10 0 0 10">
						<c:forEach items="${type}" var="v" varStatus="vs">
							<a href="/board/listPage?stype=${v }">
							<button type="button"  	class="btn btn-info btn-sm bb" >${v }</button></a>&nbsp;
							<c:if test="${vs.count == 9 }"></p><p></c:if>
						</c:forEach>
<!-- >>>>>>> refs/heads/CSS -->
						<a href="/board/listPage"><button type="button"  
						class="btn btn-info btn-sm bb">전체목록</button></a>
						</p>
					</div>
		
		
		
		<div id="tg" align="center"  style="margin: 10px">
			<h3>
			<c:if test="${fn:length(tag) <= 10 }">
				<c:forEach items="${tag }" var="tag">
<!-- 					<button class="button button" -->
<%-- 						onclick="javascript: location.assign('${pageContext.request.contextPath}/tag?tag=${tag }')">${tag }</button> --%>
						<a href="${pageContext.request.contextPath }/tag?tag=${tag}">
						<button class="btn" style="background-color: #f0ad4e; color: white">${tag }</button></a>
				</c:forEach>
			</c:if>
			<c:if test ="${fn:length(tag) > 10 }">
				<c:forTokens items="${fn:replace(tag, '[', '' )}" delims="," var="t" varStatus="vs">
					<c:if test="${vs.count <= 10 }">
						<a href="${pageContext.request.contextPath }/tag?tag=${t}">
						<button class="btn" style="background-color: #f0ad4e; color: white">${t }</button></a>
					</c:if>
				</c:forTokens>
			</c:if>
			</h3>
		</div>
		</div><!-- centered -->
	</div> <!-- inner -->
</div>	<!-- outer -->
<!-- <<<<<<< HEAD -->
<!-- 			<div class="box"> -->
<!-- 				<div class="box-header with-border"> -->
<!-- 					<h3 class="box-title">LIST PAGING</h3> -->
<!-- 				</div> -->
<!-- 				<div class="box-body"> -->
<!-- 					<table class="table table-bordered table-hover"> -->
<!-- 						<tr> -->
<!-- 							<th style="width: 10px">BNO</th> -->
<!-- 							<th >TITLE</th> -->
<!-- 							<th>WRITER</th> -->
<!-- 							<th>REGDATE</th> -->
<!-- 							<th style="width: 80px">좋아요!</th> -->
<!-- 							<th style="width: 40px">VIEWCNT</th> -->
<!-- 						</tr> -->
<!-- ======= -->
<!-- 				<div class="table-responsive"> -->
<!-- 					<table class="table table-hover" style="margin-top: 10px"> -->
<!-- 						<tr> -->
<!-- 							<th style="width: 10px">BNO</th> -->
<!-- 							<th>TITLE</th> -->
<!-- 							<th>WRITER</th> -->
<!-- 							<th>REGDATE</th> -->
<!-- 							<th style="width: 80px">좋아요!</th> -->
<!-- 							<th style="width: 40px">VIEWCNT</th> -->
<!-- 						</tr> -->
<!-- >>>>>>> refs/heads/CSS -->

<%-- 					 	<c:forEach items="${list}" var="boardVO"> --%>

<!-- 							<tr> -->
<%-- 								<td>${boardVO.no}</td> --%>
<!-- 								<td><a -->
<%-- 									href='/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&no=${boardVO.no}'> --%>
<%-- 										${boardVO.title}</a></td> --%>
<%-- 								<td>${boardVO.writer}</td> --%>
<%-- 								<td><fmt:formatDate pattern="yy-MM-dd HH:mm" --%>
<%-- 										value="${boardVO.regdate}" /></td> --%>
<%-- 							<td><span class="badge">${boardVO.good }</span></td>  --%>
<%-- 							 <td><span class="badge">${boardVO.viewcnt }</span></td>  --%>

<!-- 							</tr> -->

<%-- 						</c:forEach>  --%>

<!-- 					</table> -->
<!-- 				</div> -->

<div class="container-fluid"  align="center" style="padding-top: 10px">
	<div class="li"  style="margin-top: 10px; width: 80%">
		<c:forEach items="${list}" var="boardVO">
			<hr/>
			<c:choose>
			<c:when test="${empty nocri }">
			<a href="/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&no=${boardVO.no}" style="text-align: center">
			</c:when>
			<c:otherwise>
			<a href="/board/readPage?no=${boardVO.no}" style="text-align: center">
			</c:otherwise>
			</c:choose>
			<div class="row">
					 <h3 style="margin-bottom:25px">${boardVO.title} <span style="font-size: 12px; color: gray; font-style: italic;">by</span> <span style="font-size: 12pt">${boardVO.writer}</span> </p></h3>
					 <p>
					 <span style="font-size: 12px; color: gray; font-style: italic;">GOOD</span> <span class="badge">${boardVO.good }</span> &nbsp;
					 <span style="font-size: 12px; color: gray; font-style: italic;">VIEW</span>  <span class="badge">${boardVO.viewcnt }</span> &nbsp;
					 <span style="font-size: 12px; color: gray;"><fmt:formatDate pattern="yy-MM-dd HH:mm" value="${boardVO.regdate}" /></span>
			</div>
			</a>
		</c:forEach>
		<hr/>
	</div>
</div>


<div class="box-footer">

				
					<div class="text-center">
						<ul class="pagination">

						<%-- 	<c:if test="${pageMaker.prev}">
								<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="${idx}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="${pageMaker.endPage +1}">&raquo;</a></li>
							</c:if> --%>

	<c:if test="${pageMaker.prev}">
								<li><a
									href="listPage${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="listPage${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="listPage${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<form id="jobForm">
  <input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
  <input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>



<script>
// 	var result = '${msg}';

// 	if (result == 'success') {
// 		alert("처리가 완료되었습니다.");
// 	}
	
// /* 	$(".pagination li a").on("click", function(event){
		
// 		event.preventDefault(); 
		
// 		var targetPage = $(this).attr("href");
		
// 		var jobForm = $("#jobForm");
// 		jobForm.find("[name='page']").val(targetPage);
// 		jobForm.attr("action","/board/listPage").attr("method", "get");
// 		jobForm.submit();
// 	}); */
// 	$(document).ready(
// 			function() {

// 				$("#keywordInput").on("change",function(event){
// 					self.location = "listPage"
// 						+ '${pageMaker.makeQuery(1)}'
// 						+ "&searchType="
// 						+ $("select option:selected").val()
// 						+ "&keyword=" + $('#keywordInput').val();
// 					$(this).focus();
					
// 				});
// 				$('#searchBtn').on(
// 						"click",
// 						function(event) {

// 							self.location = "listPage"
// 									+ '${pageMaker.makeQuery(1)}'
// 									+ "&searchType="
// 									+ $("select option:selected").val()
// 									+ "&keyword=" + $('#keywordInput').val();

// 						});

// 				$('#newBtn').on("click", function(evt) {

// 					self.location = "register";

// 				});

// 	function showKw() {
// 		if($("#kw").css("display") == "none")
// 			$("#kw").css("display", "block");
// 		else
// 			$("#kw").css("display", "none");
// 	}
// 			});
	
 </script>

<%-- <%@include file="../include/footer.jsp"%> --%>
