<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
<%@include file="../include/header.jsp"%> --%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">MODIFY BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

                    <c:if test="${cri.stype!=null }">
					<input type='hidden' name='stype' value="${cri.stype}">
                    
                    </c:if>
					<input type='hidden' name='page' value="${cri.page}">
					 <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					 <input type='hidden' name='searchType' value="${cri.searchType}">
					 <input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">NO</label> <input type="text"
								name='no' class="form-control" value="${boardVO.no}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> <input type="text"
								name='title' class="form-control" value="${boardVO.title}" maxlengh="300">
						</div>
						<%-- <div class="form-group">
							<label for="exampleInputEmail1">Type</label> <input type="text"
								name='type' class="form-control" value="${boardVO.type}">
						</div> --%>
						<div class="form-group">
						<label for="exampleInputEmail1">Type</label><br /> <select
							name="type">

							<c:forEach items="${type}" var="v">

								<option value="${v }" <c:out value="${v==boardVO.type?'selected':'' }"/>>${v}</option>


							</c:forEach>


						</select>

					</div>
						<div class="form-group">
							<label for="exampleInputEmail1">tag</label> <input type="text" id="tag"
								name='tag' class="form-control" value="${mbv.ptag}" onkeyup="checkTag()" onclick="addHash()" onblur="finalCheck()">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="3" id="ck">${mbv.contents}</textarea>
							<script type="text/javascript">
							$(function() {
								CKEDITOR.replace('ck', {
									//width : '620px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
									height : '500px', // 입력창의 높이
								filebrowserUploadUrl :'/image'
								
								});
								
							
							});
							
							function addHash() {
								var tag = $("#tag").val();
								if(tag.length >1 && tag.charCodeAt(0) != 35) {
										$("#tag").val("#"+tag);
								}
							}
							
							function checkTag() {
								var tag = $("#tag").val();
								if(tag.charCodeAt(tag.length-1) == 32) {
									if(tag.charCodeAt(tag.length-2)!=35){
										$("#tag").val(tag.substr(0, tag.length-1)+"#");
									}	else {
										$("#tag").val(tag.substr(0, tag.length-1));
									}
								}
								if(tag.length > 1 && tag.indexOf("　") != -1){
									if(tag.charCodeAt(tag.indexOf("　")-1) != 35){
										$("#tag").val(tag.replace("　", "#"));
									} else {
										$("#tag").val(tag.substr(0,tag.indexOf("　")) );
									}
								}
							}
							
							function finalCheck() {
								addHash();
								var tag = $("#tag").val();
								$("#tag").val(tag.replace(/\s/gi, ""));
							}
						</script>
<!-- 							var editor = CKEDITOR.instances['ckeditor_textarea_id'];

							 if (editor) {

							     editor.on('blur', function(event) {

							         // Do something, Example: disable toolbar:

							        //$("#cke_top_" + event.editor.name).css("display", "none");

							         var a = CKEDITOR.instances.ckeditor_textarea_id.getData();       //이건 현재 웹에디터에 입력된 test를 가져온다. setData()로 데이터를 입력할 수 있다.

							         alert(a);

							     });

							 } -->
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input type="text"
								name="writer" class="form-control" value="${boardVO.writer}" 
								readonly="readonly">
						</div>
					</div>
					<!-- /.box-body -->
				</form>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</div>

				<script>
					$(document)
							.ready(
									function() {

										var formObj = $("form[role='form']");

										console.log(formObj);

										$(".btn-warning")
												.on(
														"click",
														function() {
															
														var stype="";
														var b=${cri.stype!=null};
															if(b){
																stype="&stype=${cri.stype}";
															}
															
															self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
																+ "&searchType=${cri.searchType}&keyword=${cri.keyword}"+stype;
														});

										$(".btn-primary").on("click",
												function() {
													formObj.submit();
												});

									});
				</script>




			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%-- <%@include file="../include/footer.jsp"%> --%>
