<%@page import="dto.U_Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String id = session.getAttribute("u_id").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����� ���� ���</title>

<jsp:useBean id="uq" class="dto.U_Quiz"></jsp:useBean>
<script>
//�Խ��ǿ��� �Խù��� Ŭ���� �װԽù��� �ش�Ǵ� id���� servlet���� ������ �Լ�
	function qinform(id){
		location.href="/GuiltyPleasure/borad?cmd=QREGI_BOARD_GET&id="+id;
	}
</script>
<%
	ArrayList list = (ArrayList)request.getAttribute("Boardlist");
%>
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
</style>
<!-- nav�� �����κ� ������� -->
</head>
<body>
<jsp:include page="/test_nav.jsp"/>
<br><br><br><br><br>
<h2 align="center">
<%if(id.equals("master")){ %>���� ��� ���� ���<%}else{ %>���� ������ ���� ���<%} %>
</h2>
<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
	<td align=center colspan=2>
		<table border=1 width=70% cellpadding=2 cellspacing=0>
			<tr align=center bgcolor=#D0D0D0 height=120%>
				<td> ��ȣ </td>
				<td width="60%"> ���� </td>
				<td > ó������ </td>
			</tr>
			<%
				if(list.size()==0){
					%>
						<tr>
					<td colspan="5" align="center">����� ������ �����ϴ�</td>
						</tr>
					<%
				}else{
					for(int i =0; i<list.size(); i++){
						uq = (U_Quiz)list.get(i);
					%>
						<tr align="center" onclick="qinform('<%=uq.getUq_num()%>')">
							<td><%=i+1%></td>
							<td><a><%=uq.getUq_question() %></a></td>
							<td><%=uq.getUq_adopt() %></td>
						<tr>
					<%
					}
				}
			%>
	
		</table>
	</td>
</tr>
</table>
<div class="col-md-12" align="center">
<br>
<form method="POST"  action ="CORDING/QuizRegi/QuizReg.jsp">
	<%if(!id.equals("master")){ %><input type ="submit"  value="���� ����"><%} %>
</form>
</div>
</body>
</html>