<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	div{width:500px; height:400px; border:1px solid red}
</style>
</head>
<body>
<div>
<h1>���� ��� ����</h1>
</div>

<!-- �̿��� form -->
<div>
<form action="/GuiltyPleasure/borad">
	<input type="hidden" name = "cmd" value="QREGI_BOARD_LIST"/>
	<input type="hidden" name = "power" value="user"/>
	<input type="submit" value="Ȯ��">
	<input type="reset" value= "���">
</form>
<!-- ������ form ���̵� �����ͼ� ���� �ϳ��� ���̰� �ٲ�ߵ� -->
<form action="/GuiltyPleasure/borad">
	<input type="hidden" name = "cmd" value="QREGI_BOARD_LIST"/>
	<input type="hidden" name = "power" value="master"/>
	<input type="submit" value="Ȯ��">
	<input type="reset" value= "���">
</div>
</body>
</html>