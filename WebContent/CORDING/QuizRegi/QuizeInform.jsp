<%@page import="dto.U_Quiz"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>quiz���</title>
<%
	U_Quiz uq = (U_Quiz) request.getAttribute("uq");
	String u_id = (String) session.getAttribute("u_id");
%>
<script>
	function Check() {
		alert("üũ�� �����մϴ�");
		if ($("#problem").val() == "") {
			alert("������ �Է��ϼ���");
			return false;
		} else if ($("#genre option:selected").val() == "") {
			alert("������ �����ϼ���");
			return false;
		} else if ($("#answer").val() == "") {
			alert("������ �Է��ϼ���")
			return false;
		} else if ($("#wrong1").val() == "") {
			alert("����1�� �Է��ϼ���")
			return false;
		} else if ($("form #wrong2").val() == "") {
			alert("����2�� �Է��ϼ���")
			return false;
		} else if ($("#wrong3").val() = "") {
			alert("����3�� �Է��ϼ���")
			return false;
		} else {
			return true;
		}
	}
</script>
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
<!-- nav�� �����κ� -->
<style>
.fh5co-nav-toggle>span {
	color: #333;
}

a {
	color: #333;
}

.navbar-brand {
	color: #333;
}

#fh5co-offcanvass .fh5co-lead {
	font-size: 15px;
	color: #333;
}

.navbar-brand>span {
	border: 2px solid #333;
}

.navbar-brand:hover {
	color: #3c763d;
}

a {
	color: #333;
}

#fh5co-offcanvass {
	background: #d3d9da;
	color: #878c93;
}

button, input, optgroup, select, textarea {
	height: 30px;
}
</style>
<!-- nav�� �����κ� ������� -->
</head>
<body>
	<jsp:include page="/test_nav.jsp" />
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="col-lg-12 panel panel-success">
			<div class="form-group">
				<label for="textProblem"><h2>���� ����</h2></label>
				<form method="POST" action="" onSubmit="return Check()">
					<input type="hidden" name="cmd" value="QUIZ_REGI" />
					<div class="container">
						<div class="row">
							<div class="col-md-5">
								<div class="form-group">
									<label for="textProblem">����</label>
									<textarea name="textProblem"
										id="problem" class="form-control"><%=uq.getUq_question()%></textarea>
								</div>
								
								<select name="genre" id="genre">
									<option value="">���� ���� ����</option>
									<option value="�ͼ���">�ͼ���</option>
									<option value="���">���</option>
									<option value="��Ÿ">��Ÿ</option>
								</select>
								<br><br>
								<div class="form-group">
									<label for="textAnswer">����</label> <input type="text"
										value="<%=uq.getUq_answer()%>" name="textAnswer" id="answer"
										class="form-control" />
								
								</div>
								<input type="text" class="form-control"
									value="<%=uq.getUq_wa_a()%>" id="wrong1" name="w1" /> 
								<br>
								<input
									type="text" class="form-control" value="<%=uq.getUq_wa_b()%>"
									id="wrong2" name="w2" /> 
								<br>
								<input type="text"
									class="form-control" value="<%=uq.getUq_wa_c()%>" id="wrong3"
									name="w3" />
								<div id="confirm"></div>
								<br>
								<input type="submit" value="����" /> 
								&nbsp;
								<input type="reset" value="���" />
								<%if(u_id.equals("master")){%>
									<input type="submit" value="������ ���� ���" />
								<%} %>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>