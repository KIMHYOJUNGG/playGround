<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp" %>

    <!-- Main content -->
    <section class="content">
      <div class="row">
      <!-- left column -->
      <div class="col-md-12">
        <!-- general form elements -->
        <div class="box box-primary">
        <div class="box-header">
          <h3 class="box-title">READ BOARD</h3>
        </div><!-- /.box-header -->
	
 <form role="form" action="modifyPage" method="post">
    <input type='hidden' name='no' value ="${boardVO.no}">
    <input type='hidden' name='page' value ="${cri.page}">
    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
    
 </form>   
    
  <div class="box-body">
    <div class="form-group">
      <label for="exampleInputEmail1">Title</label>
      <input type="text" name='title' class="form-control" 
         value="${boardVO.title}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Content</label>
      <textarea class="form-control"  name="content" rows="3" 
      readonly="readonly">${contents}</textarea>
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1" >Writer</label>
      <input type="text" name="writer" class="form-control" 
        value="${boardVO.writer}" readonly="readonly">
    </div>
    <div class="form-group">
		<label for="exampleInputEmail1">comments</label> 
		<c:forEach var="co" items="${comments }" varStatus="vs">
		<p>
		${co.id } &nbsp; &nbsp; &nbsp; ${co.reply } &nbsp; &nbsp; &nbsp; ${co.date}  
		</p> 
		</c:forEach>
	</div>
	<c:if test="${logon != null }">
		<label for="exampleInputEmail1">댓글쓰기</label> 
		  <textarea class="form-control" name="comments" id="comments" rows="3" cols="3" placeholder="댓글을 달아주세요." ></textarea>
                <br/>
		 <button type="button" id="comments-btn" name="comments" class="btn btn-default" >댓글쓰기</button>
	</c:if>
	<c:if test="${logon == null }">
		<label for="exampleInputEmail1">댓글쓰기</label> 
		  <textarea class="form-control" name="comments" id="commentslog" rows="3" cols="3" placeholder="댓글을 쓸수 있는 권한이 없습니다." ></textarea>
                <br/>
		 <button type="button" id="comments-btn" name="comments" class="btn btn-default" >댓글쓰기</button>
	</c:if>
	</div>
	<div class="form-group">
	
  </div><!-- /.box-body -->

  <div class="box-footer">
    <button type="submit" class="btn btn-warning modifyBtn">Modify</button>
    <button type="submit" class="btn btn-danger removeBtn">REMOVE</button>
    <button type="submit" class="btn btn-primary goListBtn">GO LIST </button>
  </div>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-warning").on("click", function(){
		formObj.attr("action", "/board/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		formObj.attr("action", "/board/removePage");
		formObj.submit();
	});
	
	$(".goListBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/board/listPage");
		formObj.submit();
	});
	
});


$('#comments-btn').click(function() {
$.ajax({
    url: "/addComments",
    method: "post",
    data: {   
    	"preco": "${comments }",
        "text" : $("#comments").val(),
        "boardNo" : "${boardVO.no}",
        "id" : "${logon}"},
    success: function() {
    	location.reload();
    	$("#comments").val("");
    }, error: function() {
        alert('게시글 등록 실패');
    }
	});
});

/*
var form = {
	    "id": "hjk",
	    "text": $('#comments-bts').val(),
		};

$('#comments-btn').click(function() {
	$.ajax({
	    url: "/addComments",
	    method: "post",
	    type: "json",
	    contentType: "application/json",
	    data: JSON.stringify(form),
	    success: function(data) {
	    	alert('게시글 등록 성공');
	    }
	});
});
*/

</script>


  
  
        </div><!-- /.box -->
      </div><!--/.col (left) -->
 
      </div>   <!-- /.row -->
    </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
    
<%@include file="../include/footer.jsp" %>
  