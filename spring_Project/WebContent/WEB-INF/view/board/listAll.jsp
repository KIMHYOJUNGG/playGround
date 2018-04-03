<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>

<style>
.button {
	background-color: white; /* Green */
	border: grey;  
	color: grey;
	padding: 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.button {
	background-color: white;
	color: black;
	border: 2px solid #e7e7e7;
}

.button {
	border-radius: 50%;
}
</style>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				<div class="box-body">

					<select name="searchType">
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
						value='${cri.keyword }'>
					<button id='searchBtn'>Search</button>

					<a href="/board/register"><button class='btn btn-primary'>New
							Board</button></a>

				</div>

				<div class="container">
					<c:forEach items="${type}" var="v">

						<a href="/board/listPage?stype=${v }"><button type="button"
								class="btn btn-info btn-sm bb">${v }</button></a>&nbsp;


							</c:forEach>
					<a href="/board/listPage"><button type="button"
							class="btn btn-info btn-sm bb">전체목록</button></a>

				</div>

			</div>



			<table class="table table-bordered">
				<tr>
					<th style="width: 10px">NO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>REGDATE</th>
					<th style="width: 80px">좋아요!</th>
					<th style="width: 40px">VIEWCNT</th>
				</tr>



				<c:forEach items="${searchList}" var="boardVO">
					<tr>
						<td>${boardVO.NO}</td>
						<td><a href='/board/readPage?no=${boardVO.NO}'>
								${boardVO.TITLE}</a></td>
						<td><a
							href="${pageContext.request.contextPath }/@${boardVO.WRITER}">${boardVO.WRITER}</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${boardVO.REGDATE}" /></td>
						<td><span class="badge">${boardVO.GOOD }</span></td>
						<td><span class="badge bg-red">${boardVO.VIEWCNT }</span></td>
					</tr>
				</c:forEach>


			</table>
			<div align="center">
				<c:if test="${fn:length(searchList)==0}">
								검색결과가 없습니다. 
								</c:if>
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
							href="listAll${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">

						<li
							<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="listAll${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="listAll${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
					</c:if>
				</ul>
			</div>

		</div>
		<!-- /.box-footer-->
	</div>
	<!--/.col (left) -->

	<!-- /.row -->
</section>
<!-- /.content -->
<form id="jobForm">
	<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
	<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>


</form>

<!-- /.content-wrapper -->
<c:forEach items="${tag }" var="tag">
	<button class="button button"
		onclick="javascript: location.assign('${pageContext.request.contextPath}/tag?tag=${tag }')">${tag }</button>
</c:forEach>

<script>
	var result = '${msg}';

	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	}

	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "listAll"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>
<!-- Bootstrap 3.3.2 JS -->

<%-- <%@include file="../include/footer.jsp"%> --%>