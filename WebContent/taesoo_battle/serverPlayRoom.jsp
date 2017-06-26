<%@page import="java.util.List"%>
<%@page import="java.net.Socket"%>
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
<script>
	window.addEventListener("onbeforeunload", closeChatRoom, false);
</script>
</head>
<body>
<jsp:useBean id="dao" class="dao.playmodule.BattlePlay"/>
<jsp:useBean id="dto" class="dto.Battle_Room"/>
<%
	String bangjang = (String)session.getAttribute("u_id"); // �������� ���̵�
	String gameUser = "";
	List roominfo = dao.roomInfo(bangjang);
	Battle_Room room = (Battle_Room)roominfo.get(0);
	//System.out.print(ServerIP + " : ");
	Socket sock;
	// ���� �����
	
	/*
	// ���ӷ��� ����Ʈ�� ����� �����ϸ� ���� �����ϰ� ¡�� �Լ��� �����Ѵ�.
	RoomManager roomManger = new RoomManager();
	GameUser user = new GameUser(bangjang);
	GameRoom room = new GameRoom();
	user.EnterRoom(room);
	room.EnterRoom(user);
	roomManger.CreateRoom(user);
	*/
	System.out.println("���� : " + bangjang);
	System.out.println("�ÿ��̾� : " + gameUser);
	if(room.getBr_people()==2){
%>
		<script> alert('�ο��� �� á���ϴ�.'); 	location.href="battleRoom.jsp";	</script>
<%	}
	
%>
	<br><br>
	<input type="hidden" value="<%=room.getBr_ip()%>" id="ip">
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
	
	<script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var connectionCheck = document.getElementById("connectionCheck");
        var webSocket = new WebSocket('ws://localhost:8080/GuiltyPleasure/websocket');
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
        	webSocket.send(bangjang+ " : " + inputMessage.value, "abcd ");
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