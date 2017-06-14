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

</script>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

%>
<title>����</title>
</head>
<body>
<jsp:include page="/top.jsp"/>
<jsp:include page="/nav.jsp"/>

<div class="container">   
        <div class="row col-lg-12">
        	<div class="col-lg-4">
        	<a href="customer_main.jsp" class="btn btn-success">����</a>
        	<a href="customer_list.jsp" class="btn btn-info">���� ����</a>
			</div>
			
			<div class="col-lg-8" align="right">
			<a href="#" class="btn btn-warning active" >�����ϱ�</a>	
			</div>
			<br>
			<br>
			<%if(session.getAttribute("u_id")!=null){%>
			<div class="col-lg-12 panel panel-success">
				<br>
				<div class="jumbotron">
	  			<h1>�����ϱ�</h1>
	  			<p>�ڼ��� �ۼ��� �ּž� ������ ��Ȯ�� �亯�� �����մϴ� !</p>
				</div>
				<br>
				<div class="jumbotron">
				<form action="customer_ques_proc.jsp" method="post">
				<div class="form-group">
				<label class="control-label" >����</label>
				<input class="form-control"  type="text" name="title" >
				<br>	
				<label class="control-label" >�з�</label>
				<select class="form-control" id="type" name="type">
		          <option>ȯ��/��ȯ</option>
		          <option>�ý��� ���</option>
		          <option>����</option>
		          <option>�̱��÷���</option>
		          <option>��Ʋ�÷���</option>
		          <option>����</option>
		          <option>��ŷ</option>
		          <option>����</option>
		          <option>����/Ż��</option>
		          <option>����Ʈ ����</option>
		          <option>��Ÿ</option>
		        </select>
		        <br>
		        <label class="control-label" >����</label>
		        <textarea class="form-control" rows="10" id="content" name="content"></textarea>
		        </div>
		        <button type="submit" class="btn btn-primary">Ȯ��</button>
		        <button type="reset" class="btn btn-default">�ٽ��ۼ�</button>	 
		        </form>
		        </div>
		        
			</div>
			<%}else{ %>
				<div class="col-lg-12 panel panel-success">
				<br>
					<div class="jumbotron">
		  			<h2>�α��� �� �̿밡���� ���� �Դϴ�.</h2>
		  			<p><a>ȸ������</a> Ȥ�� <a>�α���</a>�� ���ּ���</p>
					</div>
				</div>
			<%} %>
        </div>
</div>
</body>
</html>