<%@page import="dto.Battle_Chating"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="chat.css" />
<title>Insert title here</title>
</head>
<body>
<script src="ajax.js"></script>
<jsp:useBean id="dto" class="dto.Battle_Chating"></jsp:useBean>
<%JSONObject json  = null;%>
<script>
function fnProcess(){
	
	var param ="cmd=CHATING";
	sendRequest("POST","/GuiltyPleasure/battle", param, callback);
}

function callback(){
	var json;
	if(httpRequest.readyState==4){
		if(httpRequest.status == 200){
			json = httpRequest.responseText;
		//	alert(json);

			// ä�ó��� �����ֱ�
			chatManager.show(json.data);
			
			// ä�ó��� ��������
			chatManager.proc();
		}else{
			alert(httpRequest.status);
		}
	}
}

var chatManager = new function(){
	// ä�ó��� ��������
	this.proc = function()
	{
	    // Ajax ���
	 
	}

	// ä�ó��� �����ֱ�
	this.show = function(data)
	{
	    var o = document.getElementById('area');
	    o.value = data;
	
	}
	
}

// interval���� ������ �ð����� ���� - [����]
// setInterval(this.proc, interval);

//������ �ε��� ����ġ�� ä�ó��� �������� ���� [�߰�]
</script>
	
	<textarea rows="50" cols="50" id="area">
		
	</textarea>
	<input name="name" id="name" type="text" />
	<input name="msg" id="msg" type="text" />
	<input name="btn" id="btn" type="button" value="�Է�"  onclick="fnProcess()"/>
	
</body>
</html>