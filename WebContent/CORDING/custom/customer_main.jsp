<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../bootstrap332/css/bootstrap.min.css">
<script src="../../bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="../../bootstrap332/js/bootstrap.min.js"></script>


<script>
$(document).ready(function(){
	$(".a1").hide(0);
	$(".a2").hide(0);
	$(".a3").hide(0);
	$(".a4").hide(0);
	$(".a5").hide(0);
	
	$(".a1").click(function(){$(".a1").hide(1000);});
	$(".a2").click(function(){$(".a2").hide(1000);});
	$(".a3").click(function(){$(".a3").hide(1000);});
	$(".a4").click(function(){$(".a4").hide(1000);});
	$(".a5").click(function(){$(".a5").hide(1000);});
	
	$(".p1").click(function(){$(".a1").show(1000);});
	$(".p2").click(function(){$(".a2").show(1000);});
	$(".p3").click(function(){$(".a3").show(1000);});
	$(".p4").click(function(){$(".a4").show(1000);});
	$(".p5").click(function(){$(".a5").show(1000);});
});
</script>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

%>
<title>Main</title>
</head>
<body>
<jsp:include page="/top.jsp"/>
<jsp:include page="/nav.jsp"/>

<div class="container">   
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
				<br>
				<div class="jumbotron">
	  			<h1>���� FAQ</h1>
	  			<p>���Ե��� ���� ���� ������ ��Ƴ����ϴ� !!</p>
	  			<h5>Ŭ���� �亯�� ��Ÿ���ϴ�.</h5>
				</div>
				<div class="jumbotron">
				<div>
					<a class="p1"> Q.����Ʈ�� ��� ��� �ϳ���?? <span class="glyphicon glyphicon-menu-down"></span></a>
					<a><h4 class="a1">A.�������� �����ϰų� ��Ʋ�÷��̿� ���˴ϴ�. <span class="glyphicon glyphicon-menu-up"></span></h4></a>
				</div>
				
				<br>
				<div>
					<a class="p2"> Q.���̵� �𸣰ھ��?? <span class="glyphicon glyphicon-menu-down"></span></a>
					<a><h4 class="a2">A.���̵� ��й�ȣ ã�⸦ �̿��ϼ���. <span class="glyphicon glyphicon-menu-up"></span></h4></a>
				</div>
				<br>
				<div>
					<a class="p3"> Q.��Ʋ�÷��� ���� ��� ���� ��� �ǳ���?? <span class="glyphicon glyphicon-menu-down"></span></a>
					<a><h4 class="a3">A.�а� �þ�� ����Ʈ�� ���Դϴ�. <span class="glyphicon glyphicon-menu-up"></span></h4></a>
				</div>
				<br>
				<div>
					<a class="p4"> Q.���̵�/��й�ȣ ã�⸦ �̿��ص� ��ã�ڽ��ϴ�?? <span class="glyphicon glyphicon-menu-down"></span></a>
					<a><h4 class="a4">A.�����Ϳ� ���� ����ó�� ��ȭ�� �ּ���. <span class="glyphicon glyphicon-menu-up"></span></h4></a>
				</div>
				<br>
				<div>
					<a class="p5"> Q.��ŷ ������ ��� �ǳ���?? <span class="glyphicon glyphicon-menu-down"></span></a>
					<a><h4 class="a5">A.200�� �̻��� ������ �߿� ������̳� �·��� ���� ������ �����մϴ�. <span class="glyphicon glyphicon-menu-up"></span></h4></a>
				</div>
			</div>
			</div>
			
        </div>
</div>
</body>
</html>