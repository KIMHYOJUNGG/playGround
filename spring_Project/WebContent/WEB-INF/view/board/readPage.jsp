<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<%-- <%@include file="../include/header.jsp" %> --%>
 
<div class="container-fluid">
	<div class="page-header">
		 <a href="${pageContext.request.contextPath}/bookPage/${boardVO.bno}"><h3 style="text-decoration: underline;">${boardVO.bookname}</h3></a>
		<h1>${boardVO.title} &nbsp; <a href="${pageContext.request.contextPath}/board/listPage?stype=${boardVO.type}"><span class="badge bg_type">${boardVO.type}</span></a></h1>
	<p> <span style="font-size: 12px; color: gray; font-style: italic;">by </span> <a href="${pageContext.request.contextPath}/@${boardVO.writer}">${boardVO.writer} </a>
	 &nbsp;<span class="glyphicon glyphicon-eye-open"  style="color: gray;"></span> <span style="font-size: 12px; color: gray; font-style: italic;">${boardVO.viewcnt}</span>
	 &nbsp;<span class="glyphicon glyphicon-pencil"  style="color: gray;"></span> 
	 <span style="font-size: 12px; color: gray; font-style: italic;"><fmt:formatDate value="${boardVO.regdate }" pattern="yy/MM/dd HH:mm"/></span> </p> 
	</div>

	<div align="right">
		<c:if test="${sessionScope.logon== boardVO.writer}" >
		    <button type="submit" class="btn btn-primary" id="modifyBtn">수정</button>
		    <button type="submit" class="btn btn-primary" id="removeBtn">삭제</button>
	    </c:if>
	</div>
	<div id="cbody">
		${mbv.contents}    
	</div>
	<hr/>

    <font size="5px;" style="color:red;" id="heart">
		<c:if test="${like eq false }">
					
          <span data-toggle="tooltip" title="좋아요!" id="good" class="glyphicon glyphicon-heart-empty"></span>
          <span data-toggle="tooltip" title="좋아요취소!" id="bad" class="glyphicon glyphicon-heart" style="display:none;"></span>
		</c:if>
		<c:if test="${like eq true}">
          <span data-toggle="tooltip" title="좋아요!" id="good" class="glyphicon glyphicon-heart-empty" style="display:none;"></span>
          <span data-toggle="tooltip" title="좋아요취소!" id="bad" class="glyphicon glyphicon-heart"></span>
		</c:if>
	</font>
	
    <span id="info"></span> 
  <script>
					  $(document).ready(function(){
						  $('[data-toggle="tooltip"]').tooltip();   
						  
					  });
					  var c=0;
					  var s=0;
						  	$("#good").click(function(){
						  		c++;
						  		if(c==1){
								$.get("${pageContext.request.contextPath}/board/like",  {"targetboard": "${boardVO.no}"
									}).done(function(rst){
										var html="";
										var html2="";
										if(rst.result) {
											html = "${boardVO.no}게시물을 좋아합니다. ";
										$("#good").hide();
										$("#bad").show();
											//html2="<a href=\"#\"><span data-toggle=\"tooltip\" title=\"좋아요취소!\" id=\"good\" class=\"glyphicon glyphicon-heart\"></span></a>";
										} else {
											html = "좋아요 실패. 다시 시도해 주세요. "
										}
											$("#info").html(html);
											//$("#heart").html(html2);
									})	;
							s=0;
								    $('[data-toggle="tooltip"]').tooltip();   
						  		}
						  		
								
					  		});
					  
						  	$("#bad").click(function(){
						  		s++;
						  		if(s==1){
								$.get("${pageContext.request.contextPath}/board/cancle",  {"targetboard": "${boardVO.no}"
									}).done(function(rst){
										var html="";
										if(rst.result) {
											html = "${boardVO.no}게시물 좋아요를 취소했습니다. ";
											$("#good").show();
											$("#bad").hide();
												//html2="<a href=\"#\"><span data-toggle=\"tooltip\" title=\"좋아요!\" id=\"good\" class=\"glyphicon glyphicon-heart-empty\"></span></a>";
										} else {
											html = "좋아요 취소 실패. 다시 시도해 주세요.";
										}
											$("#info").html(html);
											//$("#heart").html(html2);
							  			
									})	;
								c=0; 
								$('[data-toggle="tooltip"]').tooltip();   
						  		}
					  		});
						  	
						  
					  </script>
<div class="form-group">
   
	
	<div id="cmt">
<!-- 	 <div class="row">
		<div class="col-md-12">  -->

			
<ul class="timeline">
				<!-- timeline time label -->
				<button type="button" class="time-label" id="repliesDiv"><span class="bg-green">
						Replies List </span></button></li>
			</ul>
<c:if test="${logon != null  }">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">댓글 추가</h3>
				</div>
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label> <input
						class="form-control" type="text" placeholder="USER ID"
						id="newReplyWriter" readonly="readonly" value="${logon }"> <label for="exampleInputEmail1">Reply
						Text</label> <input class="form-control" type="text"
						placeholder="REPLY TEXT" id="newReplyText" maxlength="1000">

				</div><br/>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">ADD
						REPLY</button>
				</div>
			</div><br/>
</c:if>

			<!-- The time line -->
			<!-- <ul class="timeline">
				timeline time label
				<button type="button" class="time-label" id="repliesDiv"><span class="bg-green">
						Replies List </span></button></li>
			</ul> -->

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

<!-- 		</div>
		/.col
	</div> -->
	</div>

	 <div id="btn-div" style="margin-bottom: 15px" align="center">
	    <!-- <button type="submit" class="btn btn-primary goListBtn" id="pre">이전글</button>
	    <button type="submit" class="btn btn-primary goListBtn" id="next">다음글 </button> -->
	    <button type="submit" class="btn btn-primary" id="goListBtn"> 목록 </button>
	    <c:if test="${sessionScope.logon!= boardVO.writer and sessionScope.logon!=null and sessionScope.lv==1}" >
	  		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">신고</button> 
	  </c:if>
	</div> 
	
<%-- 
 <div class="row">
		<div class="col-md-12">

<c:if test="${logon != null  }">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label> <input
						class="form-control" type="text" placeholder="USER ID"
						id="newReplyWriter" readonly="readonly" value="${logon }"> <label for="exampleInputEmail1">Reply
						Text</label> <input class="form-control" type="text"
						placeholder="REPLY TEXT" id="newReplyText">

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">ADD
						REPLY</button>
				</div>
			</div>
</c:if>

			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<button type="button" class="time-label" id="repliesDiv"><span class="bg-green">
						Replies List </span></button></li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

		</div>
		<!-- /.col -->
	</div>
	 --%>
	<!-- Modal -->
 <div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    Modal content
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>      

<!-- 	<div id='modDiv' style="display: none;">
		<div class='modal-title'></div>
		<div>
			<input type='text' id='replytext'>
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">DELETE</button>
			<button type="button" id='closeBtn'>Close</button>
		</div>
	</div>
		 -->

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
    <c:if test="${cri.stype!=null }">
    
    <input type='hidden' name='stype' value ="${cri.stype}">
    
    </c:if>
    <input type='hidden' name='page' value ="${cri.page}">
    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
    <input type='hidden' name='writer' value ="${boardVO.writer}">
    <input type='hidden' name='searchType' value ="${cri.searchType}">
    <input type='hidden' name='keyword' value ="${cri.keyword}">
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
        <button type="submit" class="btn btn-danger" id="reportBtn">신고하기 </button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

<!--   <a class="btn btn-primary btn-xs mo" 
	    data-toggle="modal" data-target="#modifyModal" >Modify</a> -->

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<div>
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><span>댓글번호:</span><strong>{{rno}}</strong> -<span>글쓴이:</span><span class="rid">{{replyer}}</span></h3>
  <div class="timeline-body">{{replytext}}</div>
    <div class="timeline-footer modifyshow" >
{{#eqReplyer replyer}}
 <a class="btn btn-primary btn-xs mo" 
	    data-toggle="modal" data-target="#modifyModal" >Modify</a>
{{/eqReplyer}}
    </div>
</div>
 	

</li>
</
{{/each}}
</script>

<script>



Handlebars.registerHelper("eqReplyer", function(replyer,block) {
	var accum='';
	if(replyer =='${logon}'){
		accum+=block.fn();
	}
	return accum;
});
Handlebars.registerHelper("prettifyDate", function(timeValue) {
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date = dateObj.getDate();
	return year + "/" + month + "/" + date;
});

var printData = function(replyArr, target, templateObject) {

	var template = Handlebars.compile(templateObject.html());

	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);


}


var bno = ${boardVO.no};
console.log(bno);
var replyPage = 1;

function getPage(pageInfo) {

	$.getJSON(pageInfo, function(data) {
		printData(data.list, $("#repliesDiv"), $('#template'));
		printPaging(data.pageMaker, $(".pagination"));

		$("#modifyModal").modal('hide');

	});
}

var printPaging = function(pageMaker, target) {

	var str = "";

	if (pageMaker.prev) {
		str += "<li><a href='" + (pageMaker.startPage - 1)
				+ "'> << </a></li>";
	}

	for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
		var strClass = pageMaker.cri.page == i ? 'class=active' : '';
		str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
	}

	if (pageMaker.next) {
		str += "<li><a href='" + (pageMaker.endPage + 1)
				+ "'> >> </a></li>";
	}

	target.html(str);
};
$("#repliesDiv").on("click", function() {
console.log($(".timeline li").length );
	if ($(".timeline li").length > 1) {
	
		return;
	}
	
	getPage("/replies/" + bno + "/1");

});

$(".pagination").on("click", "li a", function(event){
	
	event.preventDefault();
	
	replyPage = $(this).attr("href");
	
	getPage("/replies/"+bno+"/"+replyPage);
	
});
$("#replyAddBtn").on("click",function(){
	 console.log("dfsd");
	 var replyerObj = $("#newReplyWriter");
	 var replytextObj = $("#newReplyText");
	 var replyer = replyerObj.val();
	 var replytext = replytextObj.val();
	console.log(replyer+" "+replytext+" ");
	  
	  $.ajax({
			type:'post',
			url:'/replies/',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'text',
			data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/"+bno+"/"+replyPage );
					
					replytextObj.val("");
				}
		}});
});


var id="";
  $(".timeline").on("click", ".replyLi", function(event){
	
	var reply = $(this);
	console.log(reply);
	id=reply.find('.rid').text();
	$("#replytext").val(reply.find('.timeline-body').text());
	$(".modal-title").html(reply.attr("data-rno"));
	
});  
$("#replyModBtn").on("click",function(){
	  var log="${logon}";
	  
	  if(id!=log){
		  alert('권한이 없습니다.');
		  $("#modifyModal").modal('hide');
		  
		  return;
	  }
	  var rno = $(".modal-title").html();
	  var replytext = $("#replytext").val();
	  
	  $.ajax({
			type:'put',
			url:'/replies/'+rno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			data:JSON.stringify({replytext:replytext}), 
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("수정 되었습니다.");
					getPage("/replies/"+bno+"/"+replyPage );
				}
		}});
});

$("#replyDelBtn").on("click",function(){
	 var log="${logon}";
	  
	  if(id!=log){
		  alert('권한이 없습니다.');
		  $("#modifyModal").modal('hide');
		  return;
	  }
	  var rno = $(".modal-title").html();
	  var replytext = $("#replytext").val();
	  
	  $.ajax({
			type:'delete',
			url:'/replies/'+rno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "DELETE" },
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("삭제 되었습니다.");
					getPage("/replies/"+bno+"/"+replyPage );
				}
		}});
});

</script>



<script>
$(document).ready(function(){

	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/board/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		formObj.attr("action", "/board/removePage");
		formObj.submit();
	});
	
	$("#goListBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/board/listPage");
		formObj.submit();
	});
	$("#reportBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/board/report");
		formObj.submit();
	});
	
	
});


/* $('#comments-btn').click(function() {
$.ajax({
    url: "/addComments",
    method: "post",
    data: {   
    	"preco": "${comments }",
        "text" : $("#comments").val(),
        "boardNo" : "${boardVO.no}",
        "id" : "${logon}"},
    success: function(rst) {
		if(rst.result) {
    		location.reload();
    		$("#comments").val("");
		}
    }, error: function() {
        alert('게시글 등록 실패');
    }
	});
});

 */
/*  $('#pre').click(function() {
	$.ajax({
	    url: "/pre",
	    method: "get",
	    data: {   
	        "boardNo" : "${boardVO.no}",
	        "bookname" : "${boardVO.bookname}",
	        "id" : "${logon}"},
	    success: function(response) {
				if(response.result) {
				alert(response.prev);
				if(response.prev==null){
					alert('이전 글이 존재하지 않습니다.');
					location.assign("${pageContext.request.contextPath}/board/readPage?no="+${boardVO.no});
				}else{
					location.assign("${pageContext.request.contextPath}/board/readPage?no="+response.prev);
				}
	    		
			}
	    }, error: function() {
	        alert('게시글 등록 실패');
	    }
		});
});

$('#next').click(function() {
	$.ajax({
	    url: "/next",
	    method: "get",
	    data: {   
	        "boardNo" : "${boardVO.no}",
	        "bookname" : "${boardVO.bookname}",
	        "id" : "${logon}"},
	    success: function(response) {
				if(response.result) {
				if(response.next==null){
					alert('다음 글이 존재하지 않습니다.');
					location.assign("${pageContext.request.contextPath}/board/readPage?no="+${boardVO.no});
				}else{
					location.assign("${pageContext.request.contextPath}/board/readPage?no="+response.next);
				}
	    		
			}
	    }, error: function() {
	    	console.log("에러");
	        alert('게시글 등록 실패');
	    }
		});
});
  */


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




<!-- ---------------------------------------------------------------------------------------------------------------------------------- -->
<%-- 
     <!-- Main content -->
    <section class="content">
      <div class="row">
      <!-- left column -->
      <div class="col-md-12">
        <!-- general form elements -->
        <div class="box box-primary">
        <div class="box-header">
          <h2 class="box-title">READ BOARD</h2>
        </div><!-- /.box-header -->
    
					
					<font size="5px;" style="color:red;" id="heart">
					<c:if test="${like eq false }">
					
<a href="#">
          <span data-toggle="tooltip" title="좋아요!" id="good" class="glyphicon glyphicon-heart-empty"></span>
        </a>
        			<a href="#">
          <span data-toggle="tooltip" title="좋아요취소!" id="bad" class="glyphicon glyphicon-heart" style="display:none;"></span>
        </a>
					</c:if>
					<c:if test="${like eq true}">
					<a href="#">
          <span data-toggle="tooltip" title="좋아요!" id="good" class="glyphicon glyphicon-heart-empty" style="display:none;"></span>
        </a>
					<a href="#">
          <span data-toggle="tooltip" title="좋아요취소!" id="bad" class="glyphicon glyphicon-heart"></span>
        </a>
					</c:if>
</font>

        <span id="info"></span> 


				<c:choose>
				<c:when test="${fan ne true}">
					<button type="button" class="btn btn-info"  id="followbt">구독하기</button>
				  </c:when>
				  <c:otherwise>
				  	<button type="button" class="btn btn-info"  id="canclebt">구독취소</button>
				  </c:otherwise>
				  </c:choose>
			



					  <script>
					  $(document).ready(function(){
						  $('[data-toggle="tooltip"]').tooltip();   
						  
					  });
					  var c=0;
					  var s=0;
						  	$("#good").click(function(){
						  		c++;
						  		if(c==1){
								$.get("${pageContext.request.contextPath}/board/like",  {"targetboard": "${boardVO.no}"
									}).done(function(rst){
										var html="";
										var html2="";
										if(rst.result) {
											html = "${boardVO.no}게시물을 좋아합니다. ";
										$("#good").hide();
										$("#bad").show();
											//html2="<a href=\"#\"><span data-toggle=\"tooltip\" title=\"좋아요취소!\" id=\"good\" class=\"glyphicon glyphicon-heart\"></span></a>";
										} else {
											html = "좋아요 실패. 다시 시도해 주세요. "
										}
											$("#info").html(html);
											//$("#heart").html(html2);
									})	;
							s=0;
								    $('[data-toggle="tooltip"]').tooltip();   
						  		}
						  		
								
					  		});
					  
						  	$("#bad").click(function(){
						  		s++;
						  		if(s==1){
								$.get("${pageContext.request.contextPath}/board/cancle",  {"targetboard": "${boardVO.no}"
									}).done(function(rst){
										var html="";
										if(rst.result) {
											html = "${boardVO.no}게시물 좋아요를 취소했습니다. ";
											$("#good").show();
											$("#bad").hide();
												//html2="<a href=\"#\"><span data-toggle=\"tooltip\" title=\"좋아요!\" id=\"good\" class=\"glyphicon glyphicon-heart-empty\"></span></a>";
										} else {
											html = "좋아요 취소 실패. 다시 시도해 주세요.";
										}
											$("#info").html(html);
											//$("#heart").html(html2);
							  			
									})	;
								c=0; 
								$('[data-toggle="tooltip"]').tooltip();   
						  		}
					  		});
						  	
						  
					  </script>
  <div class="box-body">
    <div class="form-group">
      <h3>조회수 <small>${boardVO.viewcnt}</small></h3> 
      <input type="text" name='title' class="form-control" 
         value="${boardVO.viewcnt}" readonly="readonly">
    </div>
  
    <div class="form-group">
      <h3>Type <small>${boardVO.type}</small></h3>
      
      <label for="exampleInputEmail1">Type</label><br/>
      <input type="text" name='type' class="form-control" 
         value="${boardVO.type}" readonly="readonly">
    </div>
    <div class="form-group">
    
							<h3>Tag <small>${mbv.ptag}</small></h3> <input type="text"
								name='tag' class="form-control" value="${mbv.ptag}" readonly="readonly">
						</div>
    <div class="form-group">
   <h3>BookName <a href="${pageContext.request.contextPath}/bookPage/${boardVO.bno}"><small>${boardVO.bookname}</small></a></h3>
      <label for="exampleInputEmail1">BookName</label><br/>
      <a href="${pageContext.request.contextPath}/bookPage/${boardVO.bno}"> <input type="text" name='title' class="form-control" 
         value="${boardVO.bookname}" readonly="readonly"></a>
    </div>
    <div class="form-group">
   <h3>Title <small>${boardVO.title}</small></h3>
      <label for="exampleInputEmail1">Title</label>
      <input type="text" name='title' class="form-control" 
         value="${boardVO.title}" readonly="readonly">
    </div>
    <div class="form-group">
     <h3>Content</h3>
${mbv.contents}     
      <label for="exampleInputPassword1">Content</label>
       <textarea class="form-control"  name="content" rows="3" id="ck" 
      readonly="readonly">${mbv.contents}</textarea>
      <script type="text/javascript">
							$(function() {
								CKEDITOR.replace('ck', {
									//width : '620px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
									height : '500px' // 입력창의 높이
							
								
								});
								
							
							});
							
		
						</script>
      
    </div>
    <div class="form-group">
   <h3>Writer  <a href="${pageContext.request.contextPath}/@${boardVO.writer}"><small>${boardVO.writer}</small></a></h3>
    
      <label for="exampleInputEmail1" >Writer</label></br>
      
       <a href="${pageContext.request.contextPath}/@${boardVO.writer}"> <input type="text" name='title' class="form-control" 
         value="${boardVO.writer}" readonly="readonly"></a>
      </div>
    <div class="form-group">
    <c:if test="${ !empty comments  }">
		<label for="exampleInputEmail1">comments</label> 
		<c:forEach var="co" items="${comments }" varStatus="vs">

		<p>
		${co.id } &nbsp; &nbsp; &nbsp; ${co.reply } &nbsp; &nbsp; &nbsp; ${co.date}  
		</p> 

		</c:forEach>
	</c:if>
	</div>
	<c:if test="${logon != null  }">
		<label for="exampleInputEmail1">댓글쓰기</label> 
		  <textarea class="form-control" name="comments" id="comments" rows="3" cols="3" placeholder="댓글을 달아주세요." ></textarea>
                <br/>
		 <button type="button" id="comments-btn" name="comments" class="btn btn-default" >댓글쓰기</button>
	</c:if>
	<c:if test="${logon == null }">
<!-- 		<label for="exampleInputEmail1">댓글쓰기</label>  -->
<!-- 		  <textarea class="form-control" name="comments" id="commentslog" rows="3" cols="3" placeholder="댓글을 쓸수 있는 권한이 없습니다."  ></textarea> -->
<!--                 <br/> -->
<!-- 		 <button type="button"  name="comments" class="btn btn-default"  -->
		 onclick="javascript: location.assign('${pageContext.request.contextPath}/member/log?uri=board/readPage&no=${NO }')" >댓글쓰기</button>
	</c:if>
	</div>
	<div class="form-group">
	
  </div><!-- /.box-body -->

  <div class="box-footer">
   <c:if test="${sessionScope.logon== boardVO.writer}" >
    <button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
    <button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
    </c:if>
   <!--  <button type="submit" class="btn btn-primary goListBtn" id="pre">이전글 </button>
    <button type="submit" class="btn btn-primary goListBtn" id="next">다음글  </button> -->
    <button type="submit" class="btn btn-primary" id="goListBtn" >GO LIST </button>
    <c:if test="${sessionScope.logon!= boardVO.writer}" >
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">report</button> 
  </c:if>
<!--   <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">report</button>  -->
  </div>
  
  <div class="row">
		<div class="col-md-12">

<c:if test="${logon != null  }">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label> <input
						class="form-control" type="text" placeholder="USER ID"
						id="newReplyWriter" readonly="readonly" value="${logon }"> <label for="exampleInputEmail1">Reply
						Text</label> <input class="form-control" type="text"
						placeholder="REPLY TEXT" id="newReplyText">

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">ADD
						REPLY</button>
				</div>
			</div>
</c:if>

			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<button type="button" class="time-label" id="repliesDiv"><span class="bg-green">
						Replies List </span></button></li>
			</ul>
<!-- 			$(".timeline").on("click", ".replyLi", function(event){
	
	var reply = $(this);
	
	$("#replytext").val(reply.find('.timeline-body').text());
	$(".modal-title").html(reply.attr("data-rno"));
	
}); -->

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

		</div>
		<!-- /.col -->
	</div>
	
	<!-- Modal -->
 <div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    Modal content
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>      

<!-- 	<div id='modDiv' style="display: none;">
		<div class='modal-title'></div>
		<div>
			<input type='text' id='replytext'>
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">DELETE</button>
			<button type="button" id='closeBtn'>Close</button>
		</div>
	</div>
		 -->

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
    <c:if test="${cri.stype!=null }">
    
    <input type='hidden' name='stype' value ="${cri.stype}">
    
    </c:if>
    <input type='hidden' name='page' value ="${cri.page}">
    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
    <input type='hidden' name='writer' value ="${boardVO.writer}">
    <input type='hidden' name='searchType' value ="${cri.searchType}">
    <input type='hidden' name='keyword' value ="${cri.keyword}">
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
        <button type="submit" class="btn btn-danger" id="reportBtn">신고하기 </button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

<!--   <a class="btn btn-primary btn-xs mo" 
	    data-toggle="modal" data-target="#modifyModal" >Modify</a> -->

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{rno}}</strong> -<span class="rid">{{replyer}}</span></h3>
  <div class="timeline-body">{{replytext}}</div>
    <div class="timeline-footer modifyshow" >
{{#eqReplyer replyer}}
 <a class="btn btn-primary btn-xs mo" 
	    data-toggle="modal" data-target="#modifyModal" >Modify</a>
{{/eqReplyer}}
    </div>
</div>
 	

</li>
{{/each}}
</script>

<script>



Handlebars.registerHelper("eqReplyer", function(replyer,block) {
	var accum='';
	if(replyer =='${logon}'){
		accum+=block.fn();
	}
	return accum;
});
Handlebars.registerHelper("prettifyDate", function(timeValue) {
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date = dateObj.getDate();
	return year + "/" + month + "/" + date;
});

var printData = function(replyArr, target, templateObject) {

	var template = Handlebars.compile(templateObject.html());

	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
	
	/* var logon="${logon}";
	$(".rid").each(function(){
		if(logon==$(this).html()){
			$(".modifyshow").each(function(){
				$(this).show();
			});
			
		}
		else{
			$(".modifyshow").each(function(){
				$(this).hide();
			});
		}
			
		
		
	});
 */
	

}


var bno = ${boardVO.no};
console.log(bno);
var replyPage = 1;

function getPage(pageInfo) {

	$.getJSON(pageInfo, function(data) {
		printData(data.list, $("#repliesDiv"), $('#template'));
		printPaging(data.pageMaker, $(".pagination"));

		$("#modifyModal").modal('hide');

	});
}

var printPaging = function(pageMaker, target) {

	var str = "";

	if (pageMaker.prev) {
		str += "<li><a href='" + (pageMaker.startPage - 1)
				+ "'> << </a></li>";
	}

	for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
		var strClass = pageMaker.cri.page == i ? 'class=active' : '';
		str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
	}

	if (pageMaker.next) {
		str += "<li><a href='" + (pageMaker.endPage + 1)
				+ "'> >> </a></li>";
	}

	target.html(str);
};
$("#repliesDiv").on("click", function() {
console.log($(".timeline li").length );
	if ($(".timeline li").length > 1) {
	
		return;
	}
	
	getPage("/replies/" + bno + "/1");

});

$(".pagination").on("click", "li a", function(event){
	
	event.preventDefault();
	
	replyPage = $(this).attr("href");
	
	getPage("/replies/"+bno+"/"+replyPage);
	
});
$("#replyAddBtn").on("click",function(){
	 console.log("dfsd");
	 var replyerObj = $("#newReplyWriter");
	 var replytextObj = $("#newReplyText");
	 var replyer = replyerObj.val();
	 var replytext = replytextObj.val();
	console.log(replyer+" "+replytext+" ");
	  
	  $.ajax({
			type:'post',
			url:'/replies/',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'text',
			data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/"+bno+"/"+replyPage );
					
					replytextObj.val("");
				}
		}});
});

/* $(".timeline").on("click", ".replyLi button", function() {

	var reply = $(this).parent();

	var rno = reply.attr("data-rno");
	var replytext = reply.text();

	$(".modal-title").html(rno);
	$("#replytext").val(replytext);
	$("#modDiv").show("slow");

}); */
var id="";
  $(".timeline").on("click", ".replyLi", function(event){
	
	var reply = $(this);
	console.log(reply);
	id=reply.find('.rid').text();
	$("#replytext").val(reply.find('.timeline-body').text());
	$(".modal-title").html(reply.attr("data-rno"));
	
});  
$("#replyModBtn").on("click",function(){
	  var log="${logon}";
	  
	  if(id!=log){
		  alert('권한이 없습니다.');
		  $("#modifyModal").modal('hide');
		  
		  return;
	  }
	  var rno = $(".modal-title").html();
	  var replytext = $("#replytext").val();
	  
	  $.ajax({
			type:'put',
			url:'/replies/'+rno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			data:JSON.stringify({replytext:replytext}), 
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("수정 되었습니다.");
					getPage("/replies/"+bno+"/"+replyPage );
				}
		}});
});

$("#replyDelBtn").on("click",function(){
	 var log="${logon}";
	  
	  if(id!=log){
		  alert('권한이 없습니다.');
		  $("#modifyModal").modal('hide');
		  return;
	  }
	  var rno = $(".modal-title").html();
	  var replytext = $("#replytext").val();
	  
	  $.ajax({
			type:'delete',
			url:'/replies/'+rno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "DELETE" },
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("삭제 되었습니다.");
					getPage("/replies/"+bno+"/"+replyPage );
				}
		}});
});

</script>



<script>
$(document).ready(function(){

	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/board/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		formObj.attr("action", "/board/removePage");
		formObj.submit();
	});
	
	$("#goListBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/board/listPage");
		formObj.submit();
	});
	$("#reportBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/board/report");
		formObj.submit();
	});
	
	
});


/* $('#comments-btn').click(function() {
$.ajax({
    url: "/addComments",
    method: "post",
    data: {   
    	"preco": "${comments }",
        "text" : $("#comments").val(),
        "boardNo" : "${boardVO.no}",
        "id" : "${logon}"},
    success: function(rst) {
		if(rst.result) {
    		location.reload();
    		$("#comments").val("");
		}
    }, error: function() {
        alert('게시글 등록 실패');
    }
	});
});

 */
/* $('#pre').click(function() {
	$.ajax({
	    url: "/pre",
	    method: "get",
	    data: {   
	        "boardNo" : "${boardVO.no}",
	        "bookname" : "${boardVO.bookname}",
	        "id" : "${logon}"},
	    success: function(response) {
				if(response.result) {
				alert(response.prev);
				if(response.prev==null){
					alert('이전 글이 존재하지 않습니다.');
					location.assign("${pageContext.request.contextPath}/board/readPage?no="+${boardVO.no});
				}else{
					location.assign("${pageContext.request.contextPath}/board/readPage?no="+response.prev);
				}
	    		
			}
	    }, error: function() {
	        alert('게시글 등록 실패');
	    }
		});
});

$('#next').click(function() {
	$.ajax({
	    url: "/next",
	    method: "get",
	    data: {   
	        "boardNo" : "${boardVO.no}",
	        "bookname" : "${boardVO.bookname}",
	        "id" : "${logon}"},
	    success: function(response) {
				if(response.result) {
				if(response.next==null){
					alert('다음 글이 존재하지 않습니다.');
					location.assign("${pageContext.request.contextPath}/board/readPage?no="+${boardVO.no});
				}else{
					location.assign("${pageContext.request.contextPath}/board/readPage?no="+response.next);
				}
	    		
			}
	    }, error: function() {
	    	console.log("에러");
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




 --%>





   









