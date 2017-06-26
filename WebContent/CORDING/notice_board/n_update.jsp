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
function check(){
	if(document.que.title.value == ""){
		alert("������ �Է����ּ���.");
		document.que.title.focus();
		return;
	}

	if(document.que.content.value == ""){
		alert("������ �Է����ּ���.");
		document.que.content.focus();
		return;
	}
	document.que.submit();
}
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
			<%if(session.getAttribute("u_id")!=null&&session.getAttribute("u_id").equals("master")){%>
			<div class="col-lg-12 panel panel-success">
				<br>
				<div class="jumbotron">
	  			<h1>�������� �ۼ�</h1>
				</div>
				<br>
				<div class="jumbotron">
				<form action="n_ques_proc.jsp" method="post" name="que">
				<div class="form-group">
				<label class="control-label" >����</label>
				<input class="form-control"  type="text" name="title" >
				<br>	
				<label class="control-label" >�߿䵵</label>
				<select class="form-control" id="type" name="type">
		          <option>�߿���</option>
		          <option>���߿���</option>
		        </select>
		        <br>
		        <label class="control-label" >����</label>
		        <textarea class="form-control" rows="10" id="content" name="content"></textarea>
		        </div>
		        <a href="javascript:check()" class="btn btn-primary">�۾���</a>
		        <button type="reset" class="btn btn-default">�ٽ��ۼ�</button>	 
		        </form>
		        </div>
		        
			</div>
			<%}else{ %>
				<div class="col-lg-12 panel panel-success">
				<br>
					<div class="jumbotron">
		  			<h2>�����ڸ� �̿밡���� ���� �Դϴ�.</h2>
					</div>
				</div>
			<%} %>
        </div>
</div>
</body>
</html>