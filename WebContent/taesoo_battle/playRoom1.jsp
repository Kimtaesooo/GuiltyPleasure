<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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
			<textarea class="form-control" rows="16" placeholder="���� ���� ��� �Ǵ� ��"
				readonly></textarea>
			<br>
			<br>
			<br>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					1���� ���<br><br><br>F1
				</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					2���� ���<br><br><br>F2
				</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					3���� ���<br><br><br>F3
				</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					4���� ���<br><br><br>F4
				</button>
			</div>
		</div>

		<div class="col-xs-3">
			<textarea class="form-control" rows="4" placeholder="������ Ȯ�� �ϴ� ��"
				readonly></textarea>
			<br>
			<fieldset>
			<textarea class="form-control" rows="15" id="messageTextArea" readonly></textarea>
			<br>
				<div class="col-xs-9">
					<input type="text" class="form-control" id="textMessage">
				</div>
				<div class="col-xs-3">
					<input type="button" value="����" onclick="sendMessage()"/>
				</div>
			</fieldset>
		</div>
	</div>
	
	<script type="text/javascript">
        //WebSocketEx�� ������Ʈ �̸�
        //websocket Ŭ���� �̸�
        var webSocket = new WebSocket("ws://70.12.110.106:8080/GuiltyPleasure/bbb");
        var messageTextArea = document.getElementById("messageTextArea");
        //�� ������ ����Ǿ��� �� ȣ��Ǵ� �̺�Ʈ
        webSocket.onopen = function(message){
            messageTextArea.value += "Server connect...\n";
        };
        //�� ������ ������ �� ȣ��Ǵ� �̺�Ʈ
        webSocket.onclose = function(message){
            messageTextArea.value += "Server Disconnect...\n";
        };
        //�� ������ ������ ���� �� ȣ��Ǵ� �̺�Ʈ
        webSocket.onerror = function(message){
            messageTextArea.value += "error...\n";
        };
        //�� ���Ͽ��� �޽����� ������� �� ȣ��Ǵ� �̺�Ʈ
        webSocket.onmessage = function(message){
            messageTextArea.value += "Recieve From Server => "+message.data+"\n";
        };
        //Send ��ư�� ������ ����Ǵ� �Լ�
        function sendMessage(){
            var message = document.getElementById("textMessage");
            messageTextArea.value += "Send to Server => "+message.value+"\n";
            //���������� textMessage��ü�� ���� ������.
            webSocket.send(message.value);
            //textMessage��ü�� �� �ʱ�ȭ
            message.value = "";
        }
        //������ ����
        function disconnect(){
            webSocket.close();
        }
    </script>

</body>
</html>