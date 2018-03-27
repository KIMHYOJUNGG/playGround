<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@include file="../include/header.jsp" %> --%>

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

<%--  <form role="form" action="modifyPage" method="post">
    
    <input type='hidden' name='no' value ="${boardVO.no}">
    <input type='hidden' name='page' value ="${cri.page}">
    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
    </form> --%>
    
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
		<input type="text" name='title' class="form-control" 
         value="${co.id }      ${co.reply }      ${co.date} " readonly="readonly">
	
		</c:forEach>
	</div>
  </div><!-- /.box-body -->

  <div class="box-footer">
   <c:if test="${sessionScope.logon== boardVO.writer}" >
    <button type="submit" class="btn btn-warning modifyBtn">Modify</button>
    <button type="submit" class="btn btn-danger removeBtn">REMOVE</button>
    </c:if>
    <button type="submit" class="btn btn-primary goListBtn">GO LIST </button>
    
   
    <c:if test="${sessionScope.logon!= boardVO.writer}" >
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">report</button> 
  </c:if>
<!--   <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">report</button>  -->
  </div>
<div class="container" >
 
  <!-- Trigger the modal with a button -->

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">신고하기</h4>
        </div>
        <div class="modal-body">
         <form role="form" action="modifyPage" method="post">
           
    <input type='hidden' name='no' value ="${boardVO.no}">
    <input type='hidden' name='btitle' value ="${boardVO.title}">
    <input type='hidden' name='page' value ="${cri.page}">
    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
    <input type='hidden' name='writer' value ="${boardVO.writer}">
    <div class="form-group">
      <label for="exampleInputEmail1">Title</label>
      <input type="text" name='title' class="form-control" 
         placeholder="신고하는 제목을 적어주세요." >
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">Reason</label>
      <input type="text" name='reason' class="form-control" 
         placeholder="신고하는 이유를 적어주세요." >
    </div>
 </form>   
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-danger reportBtn">신고하기 </button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
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
	$(".reportBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/board/report");
		formObj.submit();
	});
	
	
});
</script>


  
  
        </div><!-- /.box -->
      </div><!--/.col (left) -->
 
      </div>   <!-- /.row -->
    </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
<%--     
<%@include file="../include/footer.jsp" %> --%>










