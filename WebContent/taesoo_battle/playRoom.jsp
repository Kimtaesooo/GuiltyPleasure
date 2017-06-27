<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="dto.Battle_Room"%>
<%@ page import="dao.playmodule.BattlePlay"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script	src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
<title>���ӹ�</title>
<script>
	window.addEventListener("onbeforeunload", closeChatRoom, false);
</script>
</head>
<body>
<jsp:useBean id="dao" class="dao.playmodule.BattlePlay"/>
<jsp:useBean id="dto" class="dto.Battle_Room"/>
<%
	String bangjang = request.getParameter("u_id"); // ������ ���̵�
	String gameUser = (String)session.getAttribute("u_id"); // �������� ���̵�
	String ip = request.getRemoteAddr();
	System.out.println(ip);
	//System.out.print(clientIP + " : ");

	// ���� �����
	if(bangjang == null || bangjang.equals("null")){
		bangjang = gameUser;
		gameUser = "";
	}
	System.out.println("���� : " + bangjang);
	System.out.println("�ÿ��̾� : " + gameUser);
	List roominfo = dao.roomInfo(bangjang);
	Battle_Room room = (Battle_Room)roominfo.get(0);
	if(room.getBr_people()==3){
%>
		<script> alert('�ο��� �� á���ϴ�.'); 	location.href="battleRoom.jsp";	</script>
<%	}
	
%>
	<br><br>
	<input type="hidden" value="<%=ip%>" id="ip">
	<input type="hidden" value="<%=gameUser%>" id="gameUser">
	<input type="hidden" value="<%=bangjang%>" id="bangjang">
	<input type="hidden" id="uri" value="ws://localhost:8080"> 

	<p class="text-center">��Ʋ ���� ����</p>
	<br>
	<br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1">
			<textarea class="form-control" rows="16" placeholder="���� ���� ��� �Ǵ� ��"
				readonly></textarea>
			<br><br><br>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					1���� ���<br><br><br><br><br>F1
				</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					2���� ���<br><br><br><br><br>F2
				</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					3���� ���<br><br><br><br><br>F3
				</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					4���� ���<br><br><br><br><br>F4
				</button>
			</div>
		</div>

		<div class="col-xs-3">
			<textarea class="form-control" rows="4" placeholder="������ Ȯ�� �ϴ� ��" id="connectionCheck" readonly></textarea>
			<br>
			<textarea class="form-control" rows="15" id="messageWindow" readonly></textarea>
			<br>
				<div class="col-xs-9">
					<input type="text" class="form-control" id="inputMessage" onkeyup="enterkey()">
				</div>
				<div class="col-xs-3">
					<input type="button" class="btn btn-default" value="����" onclick="send()"/>
				</div>
			<br><br><br>
				<div class="col-xs-12">
					<a class="btn btn-danger btn-lg btn-block" href="battleRoom.jsp" role="button">�����ϱ�</a>
				</div>
		</div>
	</div>

</body>
</html>