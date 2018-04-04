<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%-- <%@include file="../include/header.jsp"%> --%>

<div class="outer" style="max-height: 100px">
	<div class="inner">
		<div class="centered" style="width: 100%; height: 30%" >
				<p>
					<select name="searchType" style="height: 33.6px">
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
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }' style="height: 33.6px">
					<button id='searchBtn' class="btn btn-info"><span class="glyphicon glyphicon-search"></span></button>
					<a href="/board/register"><button class='btn btn-primary'><span class="glyphicon glyphicon-pencil"></span> 글쓰기</button></a>
					<button class='btn btn-primary' onclick="showKw()">키워드</button>
				</p>
			</div>
		</div>
	</div>
	
				<div id="kw" class="container-fulid" align="center" style="display: none;">
					<p style="margin: 10 0 0 10">
						<c:forEach items="${type}" var="v" varStatus="vs">
							<a href="/board/listPage?stype=${v }">
							<button type="button"  	class="btn btn-info btn-sm bb" >${v }</button></a>&nbsp;
							<c:if test="${vs.count == 9 }"></p><p></c:if>
						</c:forEach>
						<a href="/board/listPage"><button type="button"  
						class="btn btn-info btn-sm bb">전체목록</button></a>
						</p>
					</div>
					
			
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

<div class="container-fluid"  align="center">
	<div class="li"  style="margin-top: 10px; width: 80%">
		<c:forEach items="${list}" var="boardVO">
			<hr/>
			<a href="/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&no=${boardVO.no}" style="text-align: center">
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

<%-- <%@include file="../include/footer.jsp"%> --%>
