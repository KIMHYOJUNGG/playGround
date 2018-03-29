<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>
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

.button {border-radius: 50%;}
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

					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">NO</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th>REGDATE</th>
							<th style="width: 40px">VIEWCNT</th>
						</tr>


						<c:forEach items="${list}" var="boardVO">
							<tr>
								<td>${boardVO.NO}</td>
								<td><a href='/board/readPage?no=${boardVO.NO}'>
										${boardVO.TITLE}</a></td>
								<td>${boardVO.WRITER}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.REGDATE}" /></td>
								<td><span class="badge bg-red">${boardVO.VIEWCNT }</span></td>
							</tr>
						</c:forEach>

					</table>

				</div>
				<!-- /.box-body -->
				<div class="box-footer">Footer</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<c:forEach items="${tag }" var="tag">
<button class="button button">${tag }</button>
</c:forEach>

<script>
	console.log('dsfs');
	var result = '${msg}';

	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	}
</script>
<!-- Bootstrap 3.3.2 JS -->

<%@include file="../include/footer.jsp"%>
