
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	<div align="center">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Main</a></li>
			<li><a data-toggle="tab" href="#menu1">Brunch Keyword</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">

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
			<div id="menu1" class="tab-pane fade">
				<div class="main_keywords">
					<h3 class="txt_brunch tit_brunch">BRUNCH KEYWORD</h3>
					<p class="desc_brunch">
						<span class="txt_brunch">Ű����� �з��� �پ��� �� ����</span>
					</p>

					<div class="keyword_list_wrap">
						<div class="keyword_list #home_keyword"></div>
					</div>

					<div class="cl_b"></div>


					<table class="main_keyword">
						<tr class="main_tr">
							<th class="main_th"><a href="${pageContext.request.contextPath }/keyword?type=���迩��">���迩��</a></th>
							<th class="main_th"><a href="${pageContext.request.contextPath }/keyword?type=�۾���">�۾���</a></th>
							<th class="main_th"><a href="${pageContext.request.contextPath }/keyword?type=��ȭ������">��ȭ������</a></th>
							<td class="main_td"><a href="${pageContext.request.contextPath }/keyword?type=�׸�������">�׸�������</a></td>
							<td class="main_td"><a href="${pageContext.request.contextPath }/keyword?type=������ ��������">������ ��������</a></td>
							<td class="main_td"><a href="${pageContext.request.contextPath }/keyword?type=���ࡤ����">���ࡤ����</a></td>
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