<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var webSocket = new WebSocket("ws://1270.0.1:8080/GuiltyPleasure/websocket");
		var messageTextArea = document.getElementById("messageTextArea");
		
		//�������� ����Ǿ��� �� ȣ��Ǵ� �̺�Ʈ
		webSocket.onopen = function(message) {
			messageTextArea.value += "���� ����";
		};
		
		webSocket.onclose = function(message) {
			messageTextArea.value += "���� ����";
		};
		
		webSocket.onerror = function(message){
			messageTextArea.value += "���� �߻�";
		};
		
		//�� ���Ͽ��� �޽����� ��������� ȣ��Ǵ� �̺�Ʈ
		webSocket.onmessage = function(message){
			messageTextArea.value += "�����κ��� ���� �޼���" + message.data +"\n";
		};
		
		function sendMessage(){
			var message = document.getElementById("textMessag");
			messageTextArea.value += "������ �޽��� ������" + message.value +"\n";
			webSocket.send(message.value);
			//textMessage ��ü�� �� �ʱ�ȭ;
			message.value="";
		}
		
		function disconnect(){
			webSocket.close();
		}
	</script>
	<form>
		<input id="textMessage" type="text" />
		<input type="button" onclick="sendMessage()" value="������"/>
		<input type="button" onclick="disconnect()" value="������"/>
	</form>
	<br/>
	
	<textarea id= "messageTextArea"rows="10" cols="50"></textarea>
</body>
</html>