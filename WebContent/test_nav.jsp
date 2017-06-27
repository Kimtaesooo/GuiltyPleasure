<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
	$(
			function(){
				$("#btnPopup").click(
						function(){
							$("#theModal").modal();
						}
						);
			}
	);
</script>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String u_id ="";
	if(session.getAttribute("u_id")!=null){
		u_id = (String)session.getAttribute("u_id");
	}
%>
<title>Insert title here</title>

</head>
<body>
<div id="fh5co-offcanvass">
	<%if(u_id.length()==0) {%>
	<h2 class="fh5co-lead"><a href="${pageContext.request.contextPath}/CORDING/login/login.html">�α���</a></h2>
	<h2 class="fh5co-lead"><a href="/GuiltyPleasure/CORDING/login/resistration.html">ȸ������</a></h2>
	<h2 class="fh5co-lead"><a href="${pageContext.request.contextPath}/CORDING/login/idpw.jsp">���̵�/��й�ȣ ã��</a></h2>
	<%}else{ %>
	<h2 class="fh5co-lead"><%=u_id %>�� ȯ���մϴ�</h2>
	<h2 class="fh5co-lead"><a href="${pageContext.request.contextPath}/CORDING/login/logout.html">�α׾ƿ�</a>
	<a href="/GuiltyPleasure/myinfo?cmd=MYINFO">����������</a></h2>
	<%} %>
		<ul>
			<li class="active"><a href="${pageContext.request.contextPath}/test.jsp" >����</a></li>
			<li><a href="${pageContext.request.contextPath}/CORDING/Quiz/SingleStart.jsp" data-nav-section="features">�̱��÷���</a></li>
			<li><a href="${pageContext.request.contextPath}/taesoo_battle/battleRoom.jsp" data-nav-section="design">��Ʋ�÷���</a></li>
			<li><a href="${pageContext.request.contextPath}/CORDING/rank/rankBattle.jsp"" data-nav-section="design">��ŷ</a></li>
			<li><a href="${pageContext.request.contextPath}/CORDING/QuizRegi/QuizRegInfo.jsp" data-nav-section="testimonies">��������</a></li>
			<li><a href="/GuiltyPleasure/shop?cmd=SHOPLIST" data-nav-section="testimonies">����</a></li>
			<li><a href="${pageContext.request.contextPath}/CORDING/notice_board/n_list.jsp" data-nav-section="products">��������</a></li>
			<li><a href="CORDING/board/BoardList.jsp" data-nav-section="benefits">�����Խ���</a></li>
			<li><a href="${pageContext.request.contextPath}/CORDING/custom/customer_main.jsp" data-nav-section="pricing">������</a></li>
		</ul>
</div>
<div id="fh5co-menu" class="navbar">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#fh5co-navbar" aria-expanded="false" aria-controls="navbar"><span>Menu</span> <i></i></a>
					<a href="${pageContext.request.contextPath}/test.jsp" data-nav-section="home" class="navbar-brand"><span>Guilty Pleasure</span></a>
				</div>
			</div>
		</div>
</div>
</body>
</html>