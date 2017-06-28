<%@page import="java.util.List"%>
<%@page import="dto.Board"%>
<%@page import="dao.boardmodule.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard" />
<jsp:useBean id="dto" class="dto.Board" />
<jsp:useBean id="userdao" class="dao.UserInfoDAO"/>
<jsp:useBean id="userdto" class="dto.UserInfoDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�����Խ���</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.waypoints.min.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.magnific-popup.min.js"></script>
	<!-- Owl Carousel -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/owl.carousel.min.js"></script>
	<!-- toCount -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.countTo.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/main.js"></script>
<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/icomoon.css">
	<!-- Simple Line Icons-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/simple-line-icons.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/magnific-popup.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.theme.default.min.css">
	<!-- Salvattore -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/salvattore.css">
	<!-- Theme Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/style.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
<!-- nav�� �����κ� -->
<style>
.fh5co-nav-toggle > span {color: #333;}	a {color: #333;}
.navbar-brand {color: #333;}#fh5co-offcanvass .fh5co-lead {font-size: 15px;color: #333;}
.navbar-brand > span {border: 2px solid #333;}
.navbar-brand:hover {color: #3c763d;}
a {color: #333;}
#fh5co-offcanvass {background: #d3d9da;color: #878c93;}
<!-- nav�� �����κ� ������� -->
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
	
	function fnwrite(){
		if($("#u_id").val().length ==0){
			alert('�α��� �� ��� �����մϴ�.');
			return ;
		}
		if($("#enroll").val()!= 'null'){
			alert("�۾��Ⱑ ������ ���� �Դϴ�.");
			return ;
		}
		window.location='BoardWrite.jsp';
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		String reload = request.getParameter("reload");

		List list = dao.getBoardList(keyword, keyfield);
		String u_id = "";
		if(session.getAttribute("u_id")!=null){
			u_id = (String)session.getAttribute("u_id");
		}
		
		userdto = userdao.searchUserInfo(u_id);
		
		// ����¡ ��� �߰�
		int totalRecord = list.size(); //��ü ���� ����
		int numPerPage = 10; //�� ������ �� ������ ���� ����
		int totalPage = 0;
		int nowPage = 0; //���� ���� ������(���� �ִ�) ������ ��ȣ
		int beginPerPage = 0; //�� �������� ���۹�ȣ
		int pagePerBlock = 3; //�� ���� ���� ��������
		int totalBlock = 0; // ���� �� ��ȣ
		int nowBlock = 0; // �������� ���� ��ȣ, �Ȱ��� ���� �ߺ��Ǽ� �����ִ� ���� ����

		totalPage = (int) Math.ceil((double) totalRecord / numPerPage);//���� - > �Ǽ� -> ���������� ��ȯ

		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		if (request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

		beginPerPage = nowPage * numPerPage;
	%>
<jsp:include page="../../test_nav.jsp" />
<input type="hidden" id="u_id" value="<%=u_id %>" />
<input type="hidden" id="enroll" value="<%=userdto.getNo_enroll() %>" />
<br><br><br><br>
	<div class="row">
		<div class="col-md-2"></div>

		<div class="col-md-8">

			<div class="row">
				<div class="col-md-4">
					<table align=center border=0 width=100%>
						<tr>
							<td align=left>Total : <%=list.size()%> ( <font color=red>
									<%=nowPage + 1%> / <%=totalPage%> pages
							</font>)
							</td>
						</tr>
					</table>
				</div>
			</div>

			
				<table class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<td width="73">��ȣ</td>
							<td width="379">����</td>
							<td width="73">�ۼ���</td>
							<td width="164">�ۼ���</td>
							<td width="58">��ȸ��</td>
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
					<a
						href="BoardList.jsp?nowBlock=<%=nowBlock - 1%>&nowPage=<%=pagePerBlock * (nowBlock - 1)%>">����<%=pagePerBlock%>��
					</a>
					<%}%>
					:::
					<%
 	for (int i = 0; i < pagePerBlock; i++) {
 		if ((nowBlock * pagePerBlock) + i == totalPage)
 			break;
 %>
					<a
						href="BoardList.jsp?nowPage=<%=(nowBlock * pagePerBlock) + i%>&nowBlock=<%=nowBlock%>"><%=(nowBlock * pagePerBlock) + i + 1%></a>&nbsp;
					<%
									}%>:::
					<%
									if (totalBlock > nowBlock + 1) {
								%>
					<a
						href="BoardList.jsp?nowBlock=<%=nowBlock + 1%>&nowPage=<%=pagePerBlock * (nowBlock + 1)%>">����<%=pagePerBlock%>��
					</a>
					<%} %>
				</div>
			

			
				<div class="col-md-7" >
				
			
		</div>
		<div class="col-md-3" align="right">
			
			<%
									if (session.getAttribute("u_id") != null) {
								%>
			<button type="button" class="btn btn-primary"
				onclick="javascript:fnwrite()">�۾���</button>
			<%
 	}
 %>
			<button type="button" class="btn btn-default"
				onclick="window.location='BoardList.jsp'">���</button>
		</div>
			</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<form action="BoardList.jsp" name="search" method="post">
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
		
		<div class="col-md-2" align="right">
			
		</div>
		<div class="col-md-2"></div>
	</div>
	<form name="frmRead" method="post" action="BoardRead.jsp">
		<input type="hidden" name="b_num" /> <input type="hidden"
			name="keyfield" value="<%=keyfield%>" /> <input type="hidden"
			name="keyword" value="<%=keyword %>" />
	</form>
</div>
</body>
</html>