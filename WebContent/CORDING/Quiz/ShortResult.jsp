<%@page import="java.util.ArrayList"%>
<%@page import="dto.QuizResult"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>�ְ��� ���</title>
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
<style>
.fh5co-nav-toggle > span {color: #333;}	a {color: #333;}
.navbar-brand {color: #333;}#fh5co-offcanvass .fh5co-lead {font-size: 15px;color: #333;}
.navbar-brand > span {border: 2px solid #333;}
.navbar-brand:hover {color: #3c763d;}
a {color: #333;}
#fh5co-offcanvass {background: #d3d9da;color: #878c93;}
.fh5co-counter-label {
  font-size: 20px;
}
</style>
</head>
<%
request.setCharacterEncoding("euc-kr");
ArrayList list = (ArrayList)request.getAttribute("list");
QuizResult result;
ArrayList sList = new ArrayList();
ArrayList aList = new ArrayList();
int csum =0 , wsum = 0;
for(int i =0; i<list.size(); i++){
	result = (QuizResult)list.get(i);
	csum+=result.getCa_sum();
	wsum+=result.getWa_sum();
	sList.add(result.getSelect());
	aList.add(result.getAnswer());
}
	System.out.println(sList.get(1));
%>
<body> 
<jsp:include page="/test_nav.jsp"/>
<br><br><br>
<H1 align="center">���� ���</H1>
<br>
	<div id="fh5co-counter" class="fh5co-bg-section"
		style="background-image: BLACK; background-attachment: fixed;">
		<div class="fh5co-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="fh5co-hero-wrap">
						<div
							class="fh5co-hero-intro text-center to-animate counter-animate">
							<div class="col-md-4 text-center">
								<span class="fh5co-counter-label"><%=session.getAttribute("u_id")%>���� ����</span>
							</div>
							<div class="col-md-4 text-center">
								<span class="fh5co-counter js-counter" data-from="0"
									data-to="<%=csum%>" data-speed="2000" data-refresh-interval="50"></span>
								<span class="fh5co-counter-label">�����</span>
							</div>
							<div class="col-md-4 text-center">
								<span class="fh5co-counter js-counter" data-from="0"
									data-to="<%=wsum%>" data-speed="2000" data-refresh-interval=" 50"></span>
								<span class="fh5co-counter-label">�����</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>