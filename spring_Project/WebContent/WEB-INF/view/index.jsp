
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.bg-grey {
	background-color: #f6f6f6;
}

.logo {
	font-size: 200px;
}

@media screen and (max-width: 768px) {
	.col-sm-4 {
		text-align: center;
		margin: 25px 0;
	}
}

  .carousel-inner img {
      width: 40%; /* Set width to 100% */
      height: 40%;
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
  @media (max-width: 400px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  } 
  

  .col-sm-4 {
      padding: 110px;

  }
  

</style>
</head>
<body class="mainbody">
	<div class="alert alert-warning alert-dismissible" id="warn1"
		style="display: none">
		<a href="javascript:location.reload();" class="close"
			data-dismiss="alert" aria-label="close">&times;</a> <strong>���!</strong>
		�ٸ� ������ Ȥ�� �ǿ��� �α��εǾ����ϴ�. F5�� �����ּ���.
	</div>
	<div class="alert alert-warning alert-dismissible" id="warn2"
		style="display: none">
		<a href="javascript:location.reload();" class="close"
			data-dismiss="alert" aria-label="close">&times;</a> <strong>���!</strong>
		�ٸ� ������ Ȥ�� �ǿ��� �α׾ƿ��Ǿ����ϴ�. F5�� �����ּ���.
	</div>
	<div>
		<%-- 
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Main</a></li>
			<li><a data-toggle="tab" href="#menu1">Keyword</a></li>
		</ul>
	--%>
	
		<div class="tab-content">
		
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
      <div class="item active">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="New York" width="1200" height="700">
        <div class="carousel-caption">
          <h3>New York</h3>
          <p>The atmosphere in New York is lorem ipsum.</p>
        </div>      
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="Chicago" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Chicago</h3>
          <p>Thank you, Chicago - A night we won't forget.</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="Los Angeles" width="1200" height="700">
        <div class="carousel-caption">
          <h3>LA</h3>
          <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p>
        </div>      
      </div>
      
        <div class="item">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="Los Angeles" width="1200" height="700">
        <div class="carousel-caption">
          <h3>LA</h3>
          <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p>
        </div>      
      </div> 
      
       <div class="item">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="Los Angeles" width="1200" height="700">
        <div class="carousel-caption">
          <h3>LA</h3>
          <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p>
        </div>      
      </div> 
      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<!-- Container (Portfolio Section) -->
<div class="container-fluid text-center bg-grey">
  <h2>Portfolio</h2><br>
  <h4>What we have created</h4>
  <div class="row text-center">
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="Paris"  width="300" height="200">
        <p><strong>Paris</strong></p>
        <p>Yes, we built Paris</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="New York"  width="300" height="200">
        <p><strong>New York</strong></p>
        <p>We built New York</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="San Francisco" width="300" height="200">
        <p><strong>San Francisco</strong></p>
        <p>Yes, San Fran is ours</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="San Francisco" width="300" height="200">
        <p><strong>San Francisco</strong></p>
        <p>Yes, San Fran is ours</p>
      </div>
    </div>
  </div>
  
  <div class="row text-center">
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="Paris"  width="300" height="200">
        <p><strong>Paris</strong></p>
        <p>Yes, we built Paris</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="New York"  width="300" height="200">
        <p><strong>New York</strong></p>
        <p>We built New York</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="San Francisco" width="300" height="200">
        <p><strong>San Francisco</strong></p>
        <p>Yes, San Fran is ours</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="${pageContext.request.contextPath }/image/Desert.jpg" alt="San Francisco" width="300" height="200">
        <p><strong>San Francisco</strong></p>
        <p>Yes, San Fran is ours</p>
      </div>
    </div>
  </div>
</div>
		
			<div id="home" class="tab-pane fade in active">
				<div class="container-fluid text-center">
					<h2>NOW</h2>
					<br>  
					<br>
					<!-- First Photo Grid-->
					<div class="w3-row-padding w3-padding-16 w3-center" id="food">
						<c:forEach var="o" items="${boardNo}" varStatus="vs">
							<c:choose>
								<c:when test="${vs.count <= 8}">
									<div class="w3-quarter">
										<c:if test="${empty list}">
											<a href="/board/readPage?no=${o.NO}"><img
												src="${pageContext.request.contextPath }/image/Desert.jpg"
												alt="1" style="width: 80%"></a>
										</c:if>
										<c:forEach items="${list }" var="l" varStatus="vs">
											<c:if test="${vs.count <= 1}">
												<a href="/board/readPage?no=${o.NO}"><img src="${l[0] }"
													alt="1" style="width: 80%"></a>
											</c:if>
										</c:forEach>
										<h3>${o.TITLE }</h3>
										<p>${o.BOOKNAME }</p>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>

					</div>
				</div>
			</div>

			<br> <br> <br> <br> <br>
			<!-- Container (Services Section) -->
			<div class="container-fluid text-center">
				<h2>KEYWORD</h2>
				<br>
				<br>
				<br>
				<div class="row">
					<div class="col-sm-3">
						<h4>
							<a href="${pageContext.request.contextPath }/keyword?type=���迩��">���迩��</a>
						</h4>
					</div>
					<div class="col-sm-3">
						<h4>
							<a href="${pageContext.request.contextPath }/keyword?type=�۾���">�۾���</a>
						</h4>
					</div>
					<div class="col-sm-3">
						<h4>
							<a href="${pageContext.request.contextPath }/keyword?type=��ȭ������">��ȭ������</a>
						</h4>
					</div>
					<div class="col-sm-3">
						<h4>
							<a href="${pageContext.request.contextPath }/keyword?type=������̺�">������̺�</a>
						</h4>
					</div>

				</div>
				<br> <br>
				<div class="row">
					<div class="col-sm-3">
						<h4>
							<a
								href="${pageContext.request.contextPath }/keyword?type=������ ��������">������
								��������</a>
						</h4>
					</div>
					<div class="col-sm-3">
						<h4>
							<a href="${pageContext.request.contextPath }/keyword?type=���ࡤ����">���ࡤ����</a>
						</h4>
					</div>
					<div class="col-sm-3">
						<h4>
							<a href="${pageContext.request.contextPath }/keyword?type=�û硤�̽�">�û硤�̽�</a>
						</h4>
					</div>
					<div class="col-sm-3">
						<h4>
							<a href="${pageContext.request.contextPath }/keyword?type=�û硤�̽�">�����д� ����</a>
						</h4>
					</div>
				</div>
				<br> <br>
				<div class="row">
					<div class="col-sm-3">
						<h4>
							<a href="${pageContext.request.contextPath }/keyword?type=�����̾߱�">�����̾߱�</a>
						</h4>
					</div>
					<div class="col-sm-3">
						<h4>
							<a href="${pageContext.request.contextPath }/keyword?type=�丮��������">�丮��������</a>
						</h4>
					</div>
					<div class="col-sm-3">
						<h4>
							<a href="${pageContext.request.contextPath }/keyword?type=�ǰ����">�ǰ����</a>
						</h4>
					</div>
					<div class="col-sm-3">
						<h4>
							<a href="${pageContext.request.contextPath }/keyword?type=�ǰ����">�츮�� �ݷ�����</a>
						</h4>
					</div>

				</div>
			</div>





			<br> <br> <br> <br> <br>

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
								href="${pageContext.request.contextPath }/keyword?type=���迩��">���迩��</a></th>
							<th class="main_th"><a
								href="${pageContext.request.contextPath }/keyword?type=�۾���">�۾���</a></th>
							<th class="main_th"><a
								href="${pageContext.request.contextPath }/keyword?type=��ȭ������">��ȭ������</a></th>
							<td class="main_td"><a
								href="${pageContext.request.contextPath }/keyword?type=�׸�������">�׸�������</a></td>
							<td class="main_td"><a
								href="${pageContext.request.contextPath }/keyword?type=������ ��������">������
									��������</a></td>
							<td class="main_td"><a
								href="${pageContext.request.contextPath }/keyword?type=���ࡤ����">���ࡤ����</a></td>
						</tr>
						<tr class="main_tr">
							<th class="main_th"><a href="">�û硤�̽�</a></th>
							<th class="main_th"><a href="">��ŸƮ�� �����</a></th>
							<th class="main_th"><a href="">�ι��С�ö��</a></th>
							<td class="main_td"><a href="">ITƮ����</a></td>
							<td class="main_td"><a href="">�����̾߱�</a></td>
							<td class="main_td"><a href="">�����д� ����</a></td>
						</tr>
						<tr class="main_tr">
							<th class="main_th"><a href="">�������Կ�</a></th>
							<th class="main_th"><a href="">�丮��������</a></th>
							<th class="main_th"><a href="">�츮�� �ݷ�����</a></th>
							<td class="main_td"><a href="">�ǰ����</a></td>
							<td class="main_td"><a href="">������̺�</a></td>
							<td class="main_td"><a href="">������ ���丮</a></td>
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
<script><%-- WebSocket�� �ϱ� ���ؼ� scriptó���� �ʿ��ϴ�.--%>
	var ac = new WebSocket("ws://${pageContext.request.serverName}/logonWS");
	ac.onopen = function() {
		console.log(this);
	}
	ac.onmessage = function(rst) {
		if (rst.data == "�α���") {
			$("#warn1").show();
		}
		if (rst.data == "�α׾ƿ�") {
			$("#warn2").show();
		}
		console.log(rst);
	}
</script>