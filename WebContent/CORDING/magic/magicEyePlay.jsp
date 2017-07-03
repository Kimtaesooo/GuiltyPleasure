<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	String u_id = (String)session.getAttribute("u_id");
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
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
	<!-- Theme Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/style.css">
<!-- nav�� �����κ� -->
	<!-- sweetalert.js -->
	<script src="${pageContext.request.contextPath}/design/sweetalert-master/js/sweetalert.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/sweetalert-master/css/sweetalert.css" />
<!-- magic���� js���� -->
<script src="magic.js"></script>
<style>
.fh5co-nav-toggle > span {color: #333;}	a {color: #333;}
.navbar-brand {color: #333;}#fh5co-offcanvass .fh5co-lead {font-size: 15px;color: #333;}
.navbar-brand > span {border: 2px solid #333;}
.navbar-brand:hover {color: #3c763d;}
a {color: #333;}
#fh5co-offcanvass {background: #d3d9da;color: #878c93;}
#fh5co-hero .fh5co-overlay { background: #f5f5f5;}
#fh5co-hero .fh5co-intro h2 {color: #333333;}
#fh5co-hero .fh5co-intro p {color: #333333;}
</style>
<!-- nav�� �����κ� ������� -->
<script>
var magic_val = 0
var u_id ="";
var magic_img=""
	function magic_eye(eye){
		magic_img = document.getElementById("magic_img");
		magic_val = document.getElementById("magic_val");
		magic_img.src ="/GuiltyPleasure/CORDING/magic/img/"+eye.value+"magiceye3d.jpg" //�������� �̹���
		magic_val.value = eye.value;
	}
	function magic_eye_answer()	{
		var answer = document.getElementById("magic_answer").value;
		u_id = "<%=u_id%>";
		if(magic_val.value != null){
		str = answerCheck(answer, magic_val.value);
			if(str==true){
				swal("�����Դϴ�.");
				savepoint(u_id);
			}else{
				swal("Ʋ�Ƚ��ϴ�.");
			}
		}else{
			swal("�׸��� �������ּ���")
		}
	}
	//�̺κ� ó��
	function savepoint(id){
		$.ajax({
			type:"POST",
			url :'/GuiltyPleasure/magic?cmd=MAGIC',
			data : {
				id : id
			},
			success:function(args){   
		    	alert("����Ʈ ȹ��");
		    },     
		    error:function(e){  
		    	alert("����Ʈ ȹ�� ����");
		    }  
		});
	}
	function test(){
		swal("Message");
	}
	swal("Message");
</script>
<body>
<jsp:include page="/test_nav.jsp"/>
<br><br><br><br><br><br><br>
		<div class="magiteye3d" align="center">
		<br><br>
		<input type="hidden" id="magic_val" value="">
				<img class ="center-block"  id="magic_img" src="" />
				<input type="text"  id="magic_answer" placeholder="���̴±׸� �Է�">
				<input type="button" onclick="magic_eye_answer();" value="�����Է�"></button>
		</div>
	<div class="col-lg-md-12" align="center">
	<table class="table table-bordered table-responsive" style="width:600px; height:200px;">
		<tr>
			<td class="table-hover" >
				<button value = "002" onclick="magic_eye(this);">��������1</button>
			</td>
			<td>
				<button value = "003" onclick="magic_eye(this);">��������2</button>
			</td>
				<td>
				<button value = "004" onclick="magic_eye(this);">��������3</button>
			</td>
				<td>
				<button value = "005" onclick="magic_eye(this);">��������4</button>
			</td>
				<td>
				<button value = "006" onclick="magic_eye(this);">��������5</button>
			</td>
		</tr>
		<tr>
				<td>
				<button value = "007" onclick="magic_eye(this);">��������6</button>
			</td>
				<td>
				<button value = "008" onclick="magic_eye(this);">��������7</button>
			</td>
				<td>
				<button value = "009" onclick="magic_eye(this);">��������8</button>
			</td>
				<td>
				<button value = "010" onclick="magic_eye(this);">��������9</button>
			</td>
				<td>
				<button value = "011" onclick="magic_eye(this);">��������10</button>
			</td>
		</tr>
		<tr>
				<td>
				<button value = "012" onclick="magic_eye(this);">��������11</button>
			</td>
				<td>
				<button value = "013" onclick="magic_eye(this);">��������12</button>
			</td>
				<td>
				<button value = "014" onclick="magic_eye(this);">��������13</button>
			</td>
				<td>
				<button value = "015" onclick="magic_eye(this);">��������14</button>
			</td>
			<td>
				<button value = "016" onclick="magic_eye(this);">��������15</button>
			</td>
		</tr>
		<tr>
				<td>
				<button value = "017" onclick="magic_eye(this);">��������16</button>
			</td>
				<td>
				<button value = "018" onclick="magic_eye(this);">��������17</button>
			</td>
				<td>
				<button value = "019" onclick="magic_eye(this);">��������18</button>
			</td>
				<td>
				<button value = "020" onclick="magic_eye(this);">��������19</button>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>