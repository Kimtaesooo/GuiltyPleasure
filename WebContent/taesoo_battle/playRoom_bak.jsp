<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<br><br>
	<p class="text-center">��Ʋ ���� ����</p>
	<br>
	<br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1">
			<textarea class="form-control" rows="16" placeholder="���� ���� ��� �Ǵ� ��"readonly></textarea>
			<br><br><br>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					1���� ���<br><br><br>F1</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					2���� ���<br><br><br>F2</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					3���� ���<br><br><br>F3</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					4���� ���<br><br><br>F4</button>
			</div>
		</div>

		<div class="col-xs-3">
			<textarea class="form-control" rows="4" placeholder="������ Ȯ�� �ϴ� ��"
				readonly></textarea>
			<br>
			<fieldset>
			<textarea class="form-control" rows="15" id="messageWindow" readonly></textarea>
			<br>
				<div class="col-xs-9">
					<input type="text" class="form-control" id="inputMessage">
				</div>
				<div class="col-xs-3">
					<input type="submit" value="����" onclick="send()"/>
				</div>
			</fieldset>
		</div>
	</div>

</body>
</html>