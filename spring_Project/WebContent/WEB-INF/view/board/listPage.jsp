<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%-- <%@include file="../include/header.jsp"%> --%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">Board List</h3>
				</div>
				<div class='box-body'>
					<a href="/board/register"><button class='btn btn-primary'>New Board</button></a>
				</div>
				
			<%-- 		<div class="form-group">
						<label for="exampleInputEmail1">Type</label><br /> <select
							name="type">

							<c:forEach items="${type}" var="v">

								<option value="${v }">${v}</option>


							</c:forEach>


						</select>

					</div>
				 --%>
				
				
					<div class="container">
					<c:forEach items="${type}" var="v">

						<a href="/board/listPage?type=${v }"><button type="button"  
						class="btn btn-info btn-sm bb">${v }</button></a>&nbsp;


							</c:forEach>
						<a href="/board/listPage"><button type="button"  
						class="btn btn-info btn-sm bb">전체목록</button></a>

					</div>
					
			</div>
			
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST PAGING</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered table-hover">
						<tr>
							<th style="width: 10px">BNO</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th>REGDATE</th>
							<th style="width: 80px">좋아요!</th>
							<th style="width: 40px">VIEWCNT</th>
						</tr>

					 	<c:forEach items="${list}" var="boardVO">

							<tr>
								<td>${boardVO.no}</td>
								<td><a
									href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page) }&no=${boardVO.no}'>
										${boardVO.title}</a></td>
								<td>${boardVO.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.regdate}" /></td>
							<td><span class="badge">${boardVO.good }</span></td> 
							 <td><span class="badge">${boardVO.viewcnt }</span></td> 

							</tr>

						</c:forEach> 

					</table>
				</div>
					<div class="box-footer">

				
					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
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
  
  <c:if test="${pageMaker.cri.type !=null }">
  <input type='hidden' name="type" value=${pageMaker.cri.type}>
  
  </c:if>
</form>


<script>
	var result = '${msg}';

	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	}
	
	$(".pagination li a").on("click", function(event){
		
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","/board/listPage").attr("method", "get");
		jobForm.submit();
	});
	
</script>

<%-- <%@include file="../include/footer.jsp"%> --%>
