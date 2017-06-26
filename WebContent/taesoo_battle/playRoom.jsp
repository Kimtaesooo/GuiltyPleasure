<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="dto.Battle_Room"%>
<%@ page import="dao.playmodule.BattlePlay"%>	
<%@ page import="ts_playmodule.*"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script	src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
<title>���ӹ�</title>
</head>
<body>
<jsp:useBean id="dao" class="dao.playmodule.BattlePlay"/>
<jsp:useBean id="dto" class="dto.Battle_Room"/>
<%
	String bangjang = request.getParameter("u_id"); // ������ ���̵�
	String gameUser = (String)session.getAttribute("u_id"); // �������� ���̵�
	String clientIP = request.getRemoteAddr();
	String bangjangIp = "";
	//System.out.print(clientIP + " : ");
	
	// ���� �����
	if(bangjang == null || bangjang.equals("null")){
		bangjang = gameUser;
		gameUser = "";		
		bangjangIp = bangjang + request.getRemoteAddr();
	}
	System.out.println("���� : " + bangjang);
	System.out.println("�ÿ��̾� : " + gameUser);
	if(dao.roomInfo(bangjang)==2){
%>
		<script> alert('�ο��� �� á���ϴ�.'); 	location.href="battleRoom.jsp";	</script>
<%	}
	System.out.println("��Ʋ �� ������ ���� : " + session);
/*
	GameRoom gameRoom = new GameRoom(bangjang);
	if(gameUser != null){
		gameRoom.EnterRoom(gameUser);
	}
	
	
	RoomManager roomManager = new RoomManager();
	GameUser gameUser = new GameUser();
	roomManager.CreateRoom(GameUser bangjang);
*/
	
	
	
%>



	<br><br>
	<input type="hidden" value="<%=clientIP%>" id="ip">
	<input type="hidden" value="<%=gameUser%>" id="gameUser">
	<input type="hidden" value="<%=bangjang%>" id="bangjang">
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
	
	<script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var connectionCheck = document.getElementById("connectionCheck");
        var webSocket = new WebSocket('ws://70.12.110.106:8080/GuiltyPleasure/websocket');
        var inputMessage = document.getElementById('inputMessage');
        var ip = document.getElementById('ip').value;
        var gameUser = document.getElementById('gameUser').value;
        var bangjang = document.getElementById('bangjang').value;
        
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(bangjang, event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    
    function onMessage(event) {
        textarea.value += event.data + "\n";
    }
    function onOpen(event) {
        textarea.value += "���� ����\n";
        connectionCheck.value += ip + "\n";
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
    	if (inputMessage.value == ""){}
    	else{
    		
        	textarea.value += "�� : " + inputMessage.value + "\n";
        	webSocket.send(gameUser+ " : " + inputMessage.value, "abcd ");
        	inputMessage.value = "";
    	}
    }
    function onClose(session) {
    	webSocket.onClose(event);
    	document.myForm.action="battleRoom.jsp";
    	document.myForm.method="post";
    	document.myForm.submit();
    }
    
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
  </script>
</body>
</html>