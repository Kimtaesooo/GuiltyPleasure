<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

%>
<title>Main</title>
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

<div class="container" id="fh5co-main">   
        <div class="row col-lg-12">
        	<div class="col-lg-4">
        	<a href="#" class="btn btn-success active">����</a>
        	<a href="customer_list.jsp" class="btn btn-info">���� ����</a>
			</div>
			<div class="col-lg-8" align="right">
			<a href="customer_ques.jsp" class="btn btn-warning" >�����ϱ�</a>	
			</div>
			<br><br>
			<div class="col-lg-12 panel panel-success">
				<div id="fh5co-faqs"  data-section="faqs">
					<div class="container">
						<div class="row">
							<div class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
								<h2 class="fh5co-lead animate-single faqs-animate-1">���� ���� ������ ��Ƴ����ϴ�.</h2>
								<p class="fh5co-sub animate-single faqs-animate-2">Ŭ���ؼ� �亯�� Ȯ���غ����� !</p>
							</div>
						</div>
					</div>
					<div class="faq-accordion to-animate">
							<span class="faq-accordion-icon-toggle"><i class="icon-arrow-down"></i></span>
							<h3>Q.����Ʈ�� ��� ��� �ϳ���??</h3>
							<div class="faq-body">
								<p>A.�������� �����ϰų� ��Ʋ�÷��̿� ���˴ϴ�.</p>
							</div>
					</div>
					<div class="faq-accordion to-animate">
							<span class="faq-accordion-icon-toggle"><i class="icon-arrow-down"></i></span>
							<h3>Q.���̵� �𸣰ھ��.</h3>
							<div class="faq-body">
								<p>A.���̵� ��й�ȣ ã�⸦ �̿��ϼ���.</p>
							</div>
					</div>
					<div class="faq-accordion to-animate">
							<span class="faq-accordion-icon-toggle"><i class="icon-arrow-down"></i></span>
							<h3>Q.��Ʋ�÷��� ���� ��� ���� ��� �ǳ���??</h3>
							<div class="faq-body">
								<p>A.�а� �þ�� ����Ʈ�� ���Դϴ�.</p>
							</div>
					</div>
					<div class="faq-accordion to-animate">
							<span class="faq-accordion-icon-toggle"><i class="icon-arrow-down"></i></span>
							<h3> Q.���̵�/��й�ȣ ã�⸦ �̿��ص� ��ã�ڽ��ϴ�.</h3>
							<div class="faq-body">
								<p>A.�����Ϳ� ���� ����ó�� ��ȭ�� �ּ���.</p>
							</div>
					</div>
					<div class="faq-accordion to-animate">
							<span class="faq-accordion-icon-toggle"><i class="icon-arrow-down"></i></span>
							<h3> Q.��ŷ ������ ��� �ǳ���??</h3>
							<div class="faq-body">
								<p>A.200�� �̻��� ������ �߿� ������̳� �·��� ���� ������ �����մϴ�.</p>
							</div>
					</div>

				</div>
			</div>	
        </div>
</div>
</body>
</html>