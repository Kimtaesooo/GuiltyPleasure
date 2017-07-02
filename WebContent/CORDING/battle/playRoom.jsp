<%@page import="dao.battlemodule.BattlePlay"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Battle_Play"%>
<%@ page import="dto.Battle_Room"%>
<%@ page import="java.util.List"%>
<%@page import="java.net.Socket"%>
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
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
<title>���ӹ�</title>
<script src=/GuiltyPleasure/ajax.js></script>
</head>
<body>
	<jsp:useBean id="roomDto" class="dto.Battle_Room" />
	<jsp:useBean id="playDto" class="dto.Battle_Play" />
	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		// ���� : Ŭ���ؼ� br_num, u_id(�� ������) �޾ƿ´�. ����(������) : �� ���鶧 br_num, u_id ���� �����´�.
		String br_num = request.getParameter("br_num");
		String bangjang = request.getParameter("bangjang");
		String gameuser = "";
		String me = (String) session.getAttribute("u_id");
		String q_type = request.getParameter("br_type");
		String ip = request.getRemoteAddr();

		List roominfo = new ArrayList();
		List playinfo = new ArrayList();
		BattlePlay dao = new BattlePlay();

		roominfo = dao.roomInfo2(br_num);
		Battle_Room battleroom = (Battle_Room) roominfo.get(0);

		playinfo = dao.playInfo(br_num);
		Battle_Play battleplay = (Battle_Play) playinfo.get(0);

		String user01 = battleplay.getUser01(); // ����
		String user02 = battleplay.getUser02(); // ��������
		int people = battleroom.getBr_people();

		if (battleroom.getBr_people() == 1) {
			if (!session.getAttribute("u_id").equals(bangjang)) {
				gameuser = (String) session.getAttribute("u_id");
				// Br_people �ο� �� ����
				dao.updatePlayRoom(br_num, gameuser);
			}
		}
		if (battleroom.getBr_people() == 2) {
			if (!session.getAttribute("u_id").equals(user01) && !session.getAttribute("u_id").equals(user02)) {
	%>
	<script>
		alert('�ο��� �� á���ϴ�.');
		location.href = "battleRoom.jsp";
	</script>
	<%
		}
		}
	%>



	<input type="hidden" value="<%=user01%>" id="user01">
	<input type="hidden" value="<%=user02%>" id="user02">
	<input type="hidden" value="<%=br_num%>" id="br_num">
	<input type="hidden" value="<%=q_type%>" id="q_type">
	<input type="hidden" value="<%=me%>" id="me">
	<input type="hidden" value="<%=ip%>" id="ip">
	<input type="hidden" value="<%=people%>" id="people">
	<br>
	<br>
	<p class="text-center">��Ʋ ���� ����</p>
	<br>
	<br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1" id="exam">
			<textarea class="form-control" rows="16" id="windowQuiz"
				style="background-color: transparent;" readonly>
������ ���� ������ ������ �ڵ����� ���� ������ �Ѿ�ϴ�.
������ ������ �� ������ ������ �� Ǯ������ ��ٷ��� �մϴ�.
���� ���� �� ������ ���� ������ ��� ���ߴ� ������ �̱��, ������ ����Ʈ�� ����ϴ�.
�׽�Ʈ���̹Ƿ� �ߺ��� ������ ���� �� �ֽ��ϴ�.
			</textarea>
			<br> <br> <br>
			<div class="col-md-3">
				<a class="btn btn-success btn-lg btn-block" role="button"
					id="button1" onclick="buttonA()">Ű�е�1</a>
			</div>
			<div class="col-md-3">
				<a class="btn btn-success btn-lg btn-block" role="button"
					id="button2" onclick="buttonB();">Ű�е�2</a>
			</div>
			<div class="col-md-3">
				<a class="btn btn-success btn-lg btn-block" role="button"
					id="button3" onclick="buttonC();">Ű�е�3</a>
			</div>
			<div class="col-md-3">
				<a class="btn btn-success btn-lg btn-block" role="button"
					id="button4" onclick="buttonD();">Ű�е�4</a>
			</div>
		</div>

		<div class="col-xs-3">
			<textarea class="form-control" rows="4" placeholder="������ Ȯ�� �ϴ� ��"
				id="connectionCheck" style="background-color: transparent;" readonly></textarea>
			<br>
			<textarea class="form-control" rows="15" id="messageWindow"
				style="background-color: transparent;" readonly></textarea>
			<br>
			<div class="col-xs-9">
				<input type="text" class="form-control" id="inputMessage"
					onkeyup="enterkey();">
			</div>
			<div class="col-xs-3">
				<input type="button" class="btn btn-default" value="����"
					onclick="messagesend();" />
			</div>
			<br> <br> <br>
			<%
				if (session.getAttribute("u_id").equals(user01)) {
			%>
			<div class="col-xs-6">
				<a class="btn btn-danger btn-lg btn-block" href="battleRoom.jsp"
					role="button">�����ϱ�</a>
			</div>
			<div class="col-xs-6">
				<a class="btn btn-success btn-lg btn-block" role="button"
					onclick="gamestart();">����</a>
			</div>
			<%
				} else {
			%>
			<div class="col-xs-12">
				<a class="btn btn-danger btn-lg btn-block" href="battleRoom.jsp"
					role="button">�����ϱ�</a>
			</div>

			<%
				}
			%>
		</div>
	</div>




	<!-- ä�� �κ� -->
	<script>
		var textarea = document.getElementById("messageWindow");
		var connectionCheck = document.getElementById("connectionCheck");
		var ip = document.getElementById('ip').value;
		var webSocket = new WebSocket("ws://192.168.200.104:8080/GuiltyPleasure/battlesocket");
		var inputMessage = document.getElementById('inputMessage');
		var user01 = document.getElementById('user01').value;
		var user02 = document.getElementById('user02').value;
		var br_num = document.getElementById('br_num').value;
		var q_type = document.getElementById('q_type').value;
		var me = document.getElementById('me').value;
		var people = document.getElementById('people').value;
		var button1 = document.getElementById('button1');
		var button2 = document.getElementById('button2');
		var button3 = document.getElementById('button3');
		var button4 = document.getElementById('button4');
		var but1value;
		var but2value;
		var but3value;
		var but4value;
		var code;

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
			webSocket.send("sessionValue:" + br_num + ":" + me);
			textarea.value += "���� ����\n";
			connectionCheck.value += ip + "\n";
		}
		function onClose(session) {
			webSocket.onClose(event);
			document.myForm.submit();
		}
		function onError(event) {
			alert(event.data);
		}
		function onMessage(event) {
			var message = new String(event.data);
			var strArray = message.split(':');

			// ä��
			if (strArray[0] == "messageSend" && strArray[1] == br_num) {
				textarea.value += strArray[2] + " : " + strArray[3] + "\n";
			}

			// ������ ���� ���� ��ư�� ������ �޼����� ���� ��
			// message = "getget:" +br_num+":"+code+":"+question+":"+answer+":"+wa1+":"+wa2+":"+wa3+":";
			// 0.���й��� 1.���ȣ 2.�ڵ� 3.���� 4.���� 5.����1 6.����2 7.����3
			if (strArray[0] == "getget" && strArray[1] == br_num) {
				code = strArray[2];
				windowQuiz.value = strArray[3];
				button1.innerHTML = strArray[4];
				button2.innerHTML = strArray[5];
				button3.innerHTML = strArray[6];
				button4.innerHTML = strArray[7];
				but1value = strArray[4];
				but2value = strArray[5];
				but3value = strArray[6];
				but4value = strArray[7];

			}

			// ���� �����ο� ������ �� �޴� �޽���
			// message = "people_cnt_check:"+br_num+":�ο��� �����մϴ�.:";
			if (strArray[0] == "people_cnt_check" && strArray[1] == br_num) {
				windowQuiz.value = strArray[2];
			}

			// message = "wrong:"+br_num+":Ʋ�Ƚ��ϴ�. ������ ������ Ǯ ���� ��ٷ� �ּ���:����������";
			if (strArray[0] == "wrong" && strArray[1] == br_num) {
				windowQuiz.value = strArray[2];
				button1.innerHTML = strArray[3];
				button2.innerHTML = strArray[3];
				button3.innerHTML = strArray[3];
				button4.innerHTML = strArray[3];
				but1value = strArray[3];
				but2value = strArray[3];
				but3value = strArray[3];
				but4value = strArray[3];
			}

			// ������ ������ ���缭 ���� ������ �Ѿ�� �� ��
			// message = "next:"+br_num+":";
			if (strArray[0] == "next" && strArray[1] == br_num) {
				nextsend();
			}
			
			// ���� ������ �� ä���� ��
			// message = "exit:" + br_num + ":";
			if (strArray[0] == "exit" && strArray[1] == br_num) {
				exit();
			}
		}

		function messagesend() {
			if (inputMessage.value == "") {
			} else {
				textarea.value += me + " : " + inputMessage.value + "\n";
				webSocket.send("messageSend:" + br_num + ":" + me + ":"
						+ inputMessage.value);
				inputMessage.value = "";
			}
		}

		// ������ ���� ���� ��ư�� ������ ��
		function gamestart() {
			webSocket.send("gameStart:" + br_num + ":" + me + ":" + q_type);
		}

		// ������ ���� ������ ���� ������ �Ѿ�� ���� ��ư
		function nextsend() {
			webSocket.send("nextSend:" + br_num + ":" + me + ":" + q_type);
		}
		
		// ������ ������ ������.
		function exit() {
			webSocket.close();
			window.location.href="/GuiltyPleasure/battle?cmd=EXIT&br_num="+br_num+"";
		}

		// ������ ���� ������ ��
		function buttonA() {
			webSocket.send("button:" + br_num + ":" + me + ":" + code + ":"
					+ but1value);
		}
		// ������ ���� ������ ��
		function buttonB() {
			webSocket.send("button:" + br_num + ":" + me + ":" + code + ":"
					+ but2value);
		}
		// ������ ���� ������ ��
		function buttonC() {
			webSocket.send("button:" + br_num + ":" + me + ":" + code + ":"
					+ but3value);
		}

		// ������ ���� ������ ��
		function buttonD() {
			webSocket.send("button:" + br_num + ":" + me + ":" + code + ":"
					+ but4value);
		}

		function enterkey() {
			if (window.event.keyCode == 13) {
				messagesend();
			}
		}

		// Ű �� ������Ű��
		window.onkeydown = function() {
			var kcode = event.keyCode;
			if (kcode == 116)
				event.returnValue = false;

			if (kcode == 97 || kcode == 35) {
				buttonA();
			}
			if (kcode == 98 || kcode == 40) {
				buttonB();
			}
			if (kcode == 99 || kcode == 34) {
				buttonC();
			}
			if (kcode == 100 || kcode == 37) {
				buttonD();
			}
		}
	</script>




</body>
</html>