<%@page import="java.util.List"%>
<%@page import="dto.Board"%>
<%@page import="dao.boardmodule.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�����Խ���</title>
<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.waypoints.min.js"></script>
<!-- Magnific Popup -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.magnific-popup.min.js"></script>
<!-- Owl Carousel -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/owl.carousel.min.js"></script>
<!-- toCount -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.countTo.js"></script>
<!-- Main JS -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/main.js"></script>
<!-- Animate.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/icomoon.css">
<!-- Simple Line Icons-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/simple-line-icons.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/magnific-popup.css">
<!-- Owl Carousel -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.theme.default.min.css">
<!-- Salvattore -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/salvattore.css">
<!-- Theme Style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/style.css">
<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<style>
#fh5co-hero {
	padding-top: 2em;
	padding-bottom: 2em;
	background: white;
}

.navbar-brand {
	color: white;
	float: left;
	padding: 10px 20px;
	font-size: 18px;
	line-height: 20px;
	height: 60px;
}

.fh5co-nav-toggle>span {
	color: white;
}

.fh5co-nav-toggle.active i::before, .fh5co-nav-toggle.active i::after {
	background: white;
}

.fh5co-nav-toggle i {
	background: white;
}

.fh5co-nav-toggle i::before, .fh5co-nav-toggle i::after {
	background: white;
}

.navbar-brand>span {
	border: 2px solid white;
}

.navbar-brand:hover {
	color: #4fd2c2;
}

.fh5co-section-heading .fh5co-lead {
	font-size: 20px;
}
.fh5co-section-heading .fh5co-sub {
	font-size:15px;
}
</style>
<style>
.table-hover>tbody>tr:hover {
	background-color: #EEEEEE
}
</style>
<script>
	function check() {
		if (document.search.keyword.value == "") {
			alert("�˻�� �Է��ϼ���.");
			document.search.keyword.focus();
			return;
		}
		document.search.submit();
	}

	function fnRead(b_num) {
		document.frmRead.b_num.value = b_num;
		document.frmRead.submit();
	}
	// 1.����¡ ��ȣ ������ ȣ��
	function goList(b, p){
		/*2.���� �±׿� �� ���� */
		document.getElementById("nowBlock").value = b;
		document.getElementById("nowPage").value = p;
		/*3.��ȸ �۾�*/
		document.search.submit();
	}
</script>
</head>
<body>
	<jsp:include page="/test_nav.jsp" />
	<br><br><br><br><br><br>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard" />
<jsp:useBean id="dto" class="dto.Board" />
<%
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		
		List<Board> list = (List<Board>)request.getAttribute("BoardList");
		
		// ����¡ ��� �߰�
		int totalRecord = list==null?0:list.size(); //��ü ���� ����
		int numPerPage = 10; //�� ������ �� ������ ���� ����
		int totalPage = 0;
		int nowPage = 0; //���� ���� ������(���� �ִ�) ������ ��ȣ
		int beginPerPage = 0; //�� �������� ���۹�ȣ
		int pagePerBlock = 3; //�� ���� ���� ��������
		int totalBlock = 0; // ���� �� ��ȣ
		int nowBlock = 0; // �������� ���� ��ȣ, �Ȱ��� ���� �ߺ��Ǽ� �����ִ� ���� ����

		totalPage = (int) Math.ceil((double) totalRecord / numPerPage);//���� - > �Ǽ� -> ���������� ��ȯ
		/*7. ����¡ ���� �ް� ó��*/
		if (request.getParameter("nowPage") != null && request.getParameter("nowPage").length() >0)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		if (request.getParameter("nowBlock") != null && request.getParameter("nowBlock").length() >0)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

		beginPerPage = nowPage * numPerPage;
%>
<div class="row">
	<div style="padding-top:0px; height:90px; background-color: #4fd2c2">
		<div class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
			<h2 class="fh5co-lead animate-single product-animate-1 fadeIn animated">���� �Խ���</h2>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-4">
					<table align=center border=0 width=100%>
						<tr>
							<td align=left>Total : <%=totalRecord%> ( <font>
									<%=nowPage + 1%> / <%=totalPage%> pages
							</font>)
							</td>
						</tr>
					</table>
				</div>
			<div class="col-md-4"></div>
			<div class="col-md-4"></div>
		</div>
			<table class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<td width="73" align="center">��ȣ</td>
						<td width="379" align="center">����</td>
						<td width="73" align="center">�ۼ���</td>
						<td width="164" align="center">�ۼ���</td>
						<td width="58" align="center">��ȸ��</td>
					</tr>
				</thead>
				<%
					if (list.size() == 0) {
				%>
				<tbody>
					<tr height="25" align="center">
						<td></td>
						<td>�����Ͱ� �����ϴ�.</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
				<%
					} else {
						for (int i = beginPerPage; i < numPerPage + beginPerPage; i++) {
							if (i == totalRecord)
								break;
							Board board = (Board) list.get(i);
				%>
				<tbody>
					<tr height="25" align="center">
						<td><%=i + 1%></td>
						<td><a href="javascript:fnRead('<%=board.getB_num()%>')"><%=board.getB_title()%></a></td>
						<td><%=board.getU_nickname()%></td>
						<td><%=board.getB_regdate()%></td>
						<td><%=board.getB_count()%></td>
					</tr>
				</tbody>
				<%
					}
				}
					%>
			</table>
			<div class="row">
				<div class="col-md-2">
					<%
							if (nowBlock > 0) {
					%>
					<a href="/GuiltyPleasure/Board?cmd=BOARDLIST?nowBlock='<%=nowBlock-1%>'&nowPage='<%=pagePerBlock*(nowBlock-1)%>'">����<%=pagePerBlock%>��</a>
					<%}%>:::
					<%
 					for (int i = 0; i < pagePerBlock; i++) {
 						if ((nowBlock * pagePerBlock) + i == totalPage)
 							break;
 					%>
					<a href="javascript:goList('<%=nowBlock %>', '<%=i %>')"><%=(nowBlock*pagePerBlock)+i+1%></a>&nbsp;
					<%}%>:::
					<%
						if (totalBlock > nowBlock + 1) {
					%>
					<a href="/GuiltyPleasure/Board?cmd=BOARDLIST?nowBlock=<%=nowBlock+1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>">����<%=pagePerBlock%>��</a>
					<%}%>
				</div>
				<div class="col-md-7"></div>
				<div class="col-md-3" align="right">
					<%
						if (session.getAttribute("u_id") != null) {
					%>
					<button type="button" class="btn btn-primary" onclick="window.location='/GuiltyPleasure/Board?cmd=BOARDWRITE'">�۾���</button>
					<%}%>
					<button type="button" class="btn btn-default" onclick="window.location='/GuiltyPleasure/Board?cmd=BOARDLIST'">���</button>
				</div>
			</div>
		</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<form action="/GuiltyPleasure/Board" name="search" method="post">
					<input type="hidden" name="cmd" value="BOARDLIST"/>
					<input type="hidden" name="nowBlock" id="nowBlock" />
					<input type="hidden" name="nowPage" id="nowPage"/>
					<div class="form-group">
						<div class="col-xs-4">
							<select class="form-control" name="keyfield">
								<option value="u_nickname"
									<%if (keyfield != null && keyfield.equals("u_nickname")) {%>
									selected="selected" <%}%>>�ۼ���
								<option value="b_title"
									<%if (keyfield != null && keyfield.equals("b_title")) {%>
									selected="selected" <%}%>>����
								<option value="b_content"
									<%if (keyfield != null && keyfield.equals("b_content")) {%>
									selected="selected" <%}%>>����
							</select>
						</div>
						<input type="hidden" name="page" value="0">
						<div class="input-group">
							<input type="search" name="keyword" class="form-control"
								<%if ("null".equals(keyword) || keyword == null) {keyword = "";}%>
								value=<%=keyword%>>
							<div class="input-group-btn">
								<button class="btn btn-info" onClick="check()">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		<div class="col-md-2" align="right"></div>
	<div class="col-md-2"></div>
</div>
	<form name="frmRead" method="post" action="/GuiltyPleasure/Board">
		<input type="hidden" name="cmd" value="BOARDREAD"/>
		<input type="hidden" name="b_num" /> <input type="hidden" name="keyfield" value="<%=keyfield%>" /> 
		<input type="hidden" name="keyword" value="<%=keyword %>" />
	</form>
</body>
</html>