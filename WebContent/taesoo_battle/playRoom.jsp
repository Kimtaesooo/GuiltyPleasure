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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
<title>���ӹ�</title>
<script src=/GuiltyPleasure/ajax.js></script>
</head>
<body>
<jsp:useBean id="dao" class="dao.playmodule.BattlePlay"/>
<jsp:useBean id="dto" class="dto.Battle_Room"/>
<%
	String bangjang = request.getParameter("u_id");
	String br_num = request.getParameter("br_num");
	String me = (String)session.getAttribute("u_id");

	String[] gameUser = new String[2];
	gameUser[0] = bangjang;
	
	String ip = request.getRemoteAddr();

	List roominfo = dao.roomInfo(bangjang); // DB ����
	Battle_Room room = (Battle_Room)roominfo.get(0);
	
	// ����ܿ� �ٸ� ����������ϸ� �� �ο��� ī����
	if(!session.getAttribute("u_id").equals(bangjang)){
		gameUser[1] = (String)session.getAttribute("u_id");
		dao.updateRoom(bangjang);
	}
	System.out.println(gameUser[0]);
	System.out.println(gameUser[1]);
	
	if (room.getBr_people() == 2) {
%>
		<script> alert('�ο��� �� á���ϴ�.'); 	location.href="battleRoom.jsp";	</script>
<% }%>

<!-- AJAX �κ� -->
	<script>
		function gameStart() {
			var param = "";
			sendRequest("POST", "startBattle.jsp", param, callback);
		}
		function callback() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					var windowQuiz = document.getElementById("windowQuiz");
					windowQuiz.innerHTML = httpRequest.responseText;
				} else {
					alert(httpRequest.status);
				}
			}
		}

		function start() {

		}
		function callback2() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					var windowQuiz = document.getElementById("windowQuiz");
					windowQuiz.innerHTML = httpRequest.responseText;
				} else {
					alert(httpRequest.status);
				}
			}
		}
	
	</script>
	

	<br><br>
	<input type="hidden" value="<%=ip%>" id="ip">
	<input type="hidden" value="<%=gameUser[0]%>" id="bangjang">
	<input type="hidden" value="<%=gameUser[1]%>" id="gameUser">
	<input type="hidden" value="<%=br_num%>" id="br_num">
	<input type="hidden" value="<%=me%>" id="me">
	<input type="hidden" id="url" value="ws://localhost:8080">
	<p class="text-center">��Ʋ ���� ����</p>
	<br><br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1" id="exam">
			<textarea class="form-control" rows="16" id="windowQuiz" style="background-color:transparent;" readonly></textarea>
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
			<textarea class="form-control" rows="4" placeholder="������ Ȯ�� �ϴ� ��" id="connectionCheck" style="background-color:transparent;" readonly></textarea>
			<br>
			<textarea class="form-control" rows="15" id="messageWindow" style="background-color:transparent;" readonly></textarea>
			<br>
				<div class="col-xs-9">
					<input type="text" class="form-control" id="inputMessage" onkeyup="enterkey()">
				</div>
				<div class="col-xs-3">
					<input type="button" class="btn btn-default" value="����" onclick="send()"/>
				</div>
			<br><br><br>
			<%if(session.getAttribute("u_id").equals(bangjang)){%>
				<div class="col-xs-6">
					<a class="btn btn-danger btn-lg btn-block" href="battleRoom.jsp" role="button">�����ϱ�</a>
				</div>
				<div class="col-xs-6">
					<a class="btn btn-success btn-lg btn-block" role="button" onclick="gameStart();">����</a>
				</div>
			<%}else{%>
				<div class="col-xs-12">
					<a class="btn btn-danger btn-lg btn-block" href="battleRoom.jsp" role="button">�����ϱ�</a>
				</div>
			
			<%} %>
		</div>
	</div>
	
	
	
	
	<!-- ä�� �κ� -->
	<script>
		var textarea = document.getElementById("messageWindow");
		var connectionCheck = document.getElementById("connectionCheck");
		var ip = document.getElementById('ip').value;
		var webSocket = new WebSocket("ws://70.12.110.106:8080/GuiltyPleasure/websocket");
		var inputMessage = document.getElementById('inputMessage');
		var gameUser = document.getElementById('gameUser').value;
		var bangjang = document.getElementById('bangjang').value;
		var me = document.getElementById('me').value;
		var br_num = document.getElementById('br_num').value;

		webSocket.onerror = function(event) {
			onError(event)
		};
		webSocket.onopen = function(event) {
			onOpen(event)
		};
		webSocket.onmessage = function(event) {
			onMessage(event)
		};

		function onOpen(event) {
			textarea.value += "���� ����\n";
			connectionCheck.value += ip + "\n";
		}
		function onClose(session) {
			webSocket.onClose(event);
			document.myForm.action = "battleRoom.jsp";
			document.myForm.method = "post";
			document.myForm.submit();
		}
		function onError(event) {
			alert(event.data);
		}
		function onMessage(event) {
			var message = new String(event.data);
			var strArray = message.split(':');
			if(strArray[0]==br_num){
				textarea.value += strArray[1] + " : " + strArray[2] + "\n";
			}
		}
		
		function send() {
			if (inputMessage.value == "") {
			} else {
				textarea.value += me + " : " + inputMessage.value + "\n";
				webSocket.send(br_num + ":" + me +":"+inputMessage.value);
				inputMessage.value = "";
			}
		}

		function enterkey() {
			if (window.event.keyCode == 13) {
				send();
			}
		}
	</script>
	
	
	

</body>
</html>