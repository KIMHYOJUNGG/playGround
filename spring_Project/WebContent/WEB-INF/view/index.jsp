<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
.bg-grey {
	background-color: white;
}

.logo-small {
	color: #f4511e;
	font-size: 50px;
}

.logo {
	color: #f4511e;
	font-size: 200px;
}

@media screen and (max-width: 768px) {
	.col-sm-3 {
		text-align: center;
		margin: 90px 0;
	}
}
</style>
<body class="mainbody">
	<div class="alert alert-warning alert-dismissible" id="warn1"
		style="display: none">
		<a href="javascript:location.reload();" class="close"
			data-dismiss="alert" aria-label="close">&times;</a> <strong>경고!</strong>
		다른 윈도우 혹은 탭에서 로그인되었습니다. F5를 눌러주세요.
	</div>
	<div class="alert alert-warning alert-dismissible" id="warn2"
		style="display: none">
		<a href="javascript:location.reload();" class="close"
			data-dismiss="alert" aria-label="close">&times;</a> <strong>경고!</strong>
		다른 윈도우 혹은 탭에서 로그아웃되었습니다. F5를 눌러주세요.
	</div>
	<div>
		<%-- 
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Main</a></li>
			<li><a data-toggle="tab" href="#menu1">Keyword</a></li>
		</ul>
	
 --%>


		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">

				<c:forEach var="o" items="${boardNo}" varStatus="vs">
					<c:choose>
						<c:when test="${vs.count <= 5}">
							<c:if test="${vs.count == 1 }">
								<div class="item active">
									<c:if test="${o.IMAGE == null}">
										<a href="/board/readPage?no=${o.NO}"><img
											src="${pageContext.request.contextPath }/image/Desert.jpg"
											alt="1" width="1200" height="700"></a>
									</c:if>
									<a href="/board/readPage?no=${o.NO}"><img
										src="
												${o.IMAGE }" alt="Paris" width="1200"
										height="700"></a>
									<div class="carousel-caption">
										<h3>${o.TITLE }</h3>
										<p>${o.BOOKNAME }</p>
									</div>
								</div>
							</c:if>
							<c:if test="${vs.count != 1 }">
								<div class="item">
									<c:if test="${o.IMAGE == null}">
										<a href="/board/readPage?no=${o.NO}"><img
											src="${pageContext.request.contextPath }/image/Desert.jpg"
											alt="1" width="1200" height="700"></a>
									</c:if>
									<a href="/board/readPage?no=${o.NO}"><img
										src="
												${o.IMAGE }" alt="Paris" width="1200"
										height="700"></a>
									<div class="carousel-caption">
										<h3>${o.TITLE }</h3>
										<p>${o.BOOKNAME }</p>
									</div>
								</div>
							</c:if>
						</c:when>
					</c:choose>
				</c:forEach>

			</div>
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- Container (Portfolio Section) -->
		<div class="container-fluid text-center bg-grey">
			<h2>Now</h2>
			<h4>What we have created</h4>
			<c:forEach var="o" items="${boardNo}" varStatus="vs">
				<c:if test="${vs.count %4 == 1}">
					<div class="row text-center">
				</c:if>
				<div class="col-sm-3">
					<div class="thumbnail">
						<c:if test="${o.IMAGE == null}">
							<a href="/board/readPage?no=${o.NO}"><img
								src="${pageContext.request.contextPath }/image/Desert.jpg"
								alt="1" style="width: 300px; height: 200px;"></a>
						</c:if>
						<a href="/board/readPage?no=${o.NO}"><img src="${o.IMAGE }"
							alt="Paris" style="width: 400px; height: 300px;"></a>
						<p>
							<strong>${o.TITLE }</strong>
						</p>
						<p>${o.BOOKNAME }</p>
					</div>
				</div>
				<c:if test="${vs.count %4 == 0 or vs.last}">
		</div>
		</c:if>
		</c:forEach>
	</div>
	</div>
	<!-- Container (Services Section) -->
	<div class="container-fluid text-center">
		<h2>KEYWORD</h2>
		<br> <br> <br>
		<div class="row">
			<div class="col-sm-3">
					<h4>
						<a href="${pageContext.request.contextPath }/board/listPage?stype=세계여행">세계여행</a>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<a href="${pageContext.request.contextPath }/board/listPage?stype=글쓰기">글쓰기</a>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<a href="${pageContext.request.contextPath }/board/listPage?stype=문화·예술">문화·예술</a>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<a href="${pageContext.request.contextPath }/board/listPage?stype=그림·웹툰">그림·웹툰</a>
					</h4>
				</div>

			</div>
			<br> <br>
			<div class="row">
				<div class="col-sm-3">
					<h4>
						<a
							href="${pageContext.request.contextPath }/board/listPage?stype=직장인%20현실조언">직장인
							현실조언</a>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<a href="${pageContext.request.contextPath }/board/listPage?stype=건축·설계">건축·설계</a>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<a href="${pageContext.request.contextPath }/board/listPage?stype=시사·이슈">시사·이슈</a>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<a href="${pageContext.request.contextPath }/board/listPage?stype=쉽게읽는%20역사">쉽게읽는
							역사</a>
					</h4>
				</div>
			</div>
			<br> <br>
			<div class="row">
				<div class="col-sm-3">
					<h4>
						<a href="${pageContext.request.contextPath }/board/listPage?stype=육아이야기">육아이야기</a>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<a href="${pageContext.request.contextPath }/board/listPage?stype=요리·레시피">요리·레시피</a>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<a href="${pageContext.request.contextPath }/board/listPage?stype=건강·운동">건강·운동</a>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<a href="${pageContext.request.contextPath }/board/listPage?stype=우리집%20반려동물">우리집
							반려동물</a>
					</h4>
				</div>

		</div>
	</div>





	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- Container (Services Section) -->
	<div class="container-fluid text-center">
		<h2>SERVICES</h2>
		<h4>What we offer</h4>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-off"></span>
				<h4>POWER</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-heart"></span>
				<h4>LOVE</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-lock"></span>
				<h4>JOB DONE</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
		</div>
		<br> <br>
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-leaf"></span>
				<h4>GREEN</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-certificate"></span>
				<h4>CERTIFIED</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-wrench"></span>
				<h4 style="color: #303030;">HARD WORK</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
		</div>
	</div>


	<%--
			<div id="menu1" class="tab-pane fade">
				<div class="main_keywords">

					<div class="keyword_list_wrap">
						<div class="keyword_list #home_keyword"></div>
					</div>

					<div class="cl_b"></div>

					<table class="main_keyword">
						<tr class="main_tr">
							<th class="main_th"><a
								href="${pageContext.request.contextPath }/keyword?type=세계여행">세계여행</a></th>
							<th class="main_th"><a
								href="${pageContext.request.contextPath }/keyword?type=글쓰기">글쓰기</a></th>
							<th class="main_th"><a
								href="${pageContext.request.contextPath }/keyword?type=문화·예술">문화·예술</a></th>
							<td class="main_td"><a
								href="${pageContext.request.contextPath }/keyword?type=그림·웹툰">그림·웹툰</a></td>
							<td class="main_td"><a
								href="${pageContext.request.contextPath }/keyword?type=직장인 현실조언">직장인
									현실조언</a></td>
							<td class="main_td"><a
								href="${pageContext.request.contextPath }/keyword?type=건축·설계">건축·설계</a></td>
						</tr>
						<tr class="main_tr">
							<th class="main_th"><a href="">시사·이슈</a></th>
							<th class="main_th"><a href="">스타트업 경험담</a></th>
							<th class="main_th"><a href="">인문학·철학</a></th>
							<td class="main_td"><a href="">IT트렌드</a></td>
							<td class="main_td"><a href="">육아이야기</a></td>
							<td class="main_td"><a href="">쉽게읽는 역사</a></td>
						</tr>
						<tr class="main_tr">
							<th class="main_th"><a href="">사진·촬영</a></th>
							<th class="main_th"><a href="">요리·레시피</a></th>
							<th class="main_th"><a href="">우리집 반려동물</a></th>
							<td class="main_td"><a href="">건강·운동</a></td>
							<td class="main_td"><a href="">사랑·이별</a></td>
							<td class="main_td"><a href="">디자인 스토리</a></td>
						</tr>
					</table>

				</div>
			</div>
--%>

	</div>
	</div>
	</div>
	</div>


</body>
<script><%-- WebSocket을 하기 위해선 script처리가 필요하다.--%>
	var ac = new WebSocket("ws://${pageContext.request.serverName}/logonWS");
	ac.onopen = function() {
		console.log(this);
	}
	ac.onmessage = function(rst) {
		if (rst.data == "로그인") {
			$("#warn1").show();
		}
		if (rst.data == "로그아웃") {
			$("#warn2").show();
		}
		console.log(rst);
	}
</script>
<%-- 

				<!-- First Photo Grid-->
				<div class="w3-row-padding w3-padding-16 w3-center" id="food">
					<c:forEach var="o" items="${boardNo}" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count <= 8}">
								<div class="w3-quarter">
									<c:if test="${o.IMAGE == null}">
										<a href="/board/readPage?no=${o.NO}"><img
											src="${pageContext.request.contextPath }/image/Desert.jpg"
											alt="1" style="width: 80%"></a>
									</c:if>
									<a href="/board/readPage?no=${o.NO}"><img
											src="${o.IMAGE }"
											alt="1" style="width: 80%"></a>
									<h3>${o.TITLE }</h3>
									<p>${o.BOOKNAME }</p>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>

				</div>


	
</body>
--%>

