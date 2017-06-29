<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:useBean id="dao" class="dao.rankmodule.rank"/>
<title>chat</title>
<%
	String id = (String)session.getAttribute("u_id");
	String nick = (String)session.getAttribute("u_nickname");
	int num=999;
	if(id!=null){
	num = dao.BattleMyRank(id);
	}
%>
</head>
<body>
<div class="btn-group dropup">
  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
	<img src="https://cdn3.iconfinder.com/data/icons/social-media-chat-1/512/MessageMe-32.png">
  </button>
  <ul class="dropdown-menu" role="menu">
<div id="chat"
style="overflow:scroll; width:250px; height:200px; 
padding:10px;">
��ü ä���Դϴ�. �夤��<br>
</div>
	<%if(id==null) {%>
	�α��� �� ä���� �����ؿ� ~
	<%}else{ %>
	<input type="text" size="30" id="inputMessage" onkeyup="enterkey()">
	<%} %>
  </ul>
</div>	
<input type="hidden" value="<%=id%>" id="id">
<input type="hidden" value="<%=nick%>" id="nick">

<input type="hidden" value="<%=num%>" id="num">
<script>

		var textarea = document.getElementById("chat");
		var id = document.getElementById("id").value;
		var nick = document.getElementById("nick").value;
		var num =  document.getElementById("num").value;
		var webSocket = new WebSocket("ws://70.12.110.113:8080/GuiltyPleasure/main_chat");
		var inputMessage = document.getElementById("inputMessage");
		var strArr;
		var rank="";
		webSocket.onerror = function(event) {
	      onError(event)
	    };
	    webSocket.onopen = function(event) {
	    	event = event + bangjang;
	      onOpen(event)
	    };
	    webSocket.onmessage = function(event) {
	      onMessage(event)
	    };
	    
	    function onOpen(event) {
	        textarea.innerHTML += "���� ����\n";
	        connectionCheck.value += ip+ "\n";
	    }
	    function onClose(session) {
	    	webSocket.onClose(event);
	    }
	    function onError(event) {
	      alert(event.data);
	    }
	    function onMessage(event) {
	    	
	    	strArr = event.data.split('div');
	        textarea.innerHTML += 
	        	"<h6>"+strArr[2]+" "+strArr[0]+" : "+strArr[1] +"</h6>";
	        textarea.scrollTop = textarea.scrollHeight;
	    }
	    function send() {
	    	if (inputMessage.value == ""){}
	    	else{    		
	    		if(num==1){
		    		rank = "<font color=blue size=5>1��</font>"
		    	}
	    		else if(num==2){
	    			rank = "<font color=red size=3>2��</font>"
	    		}
	    		else if(num==3){
	    			rank = "<font color=green size=2>3��</font>"
	    		}
	    		else if(num>0){
	    			rank = "<font>"+num+"��</font>"
	    		}
	    		else{
	    			rank = "�ʺ�"
	    		}
	        	textarea.innerHTML += "<h5 align=right>" + inputMessage.value + "</h5>";
	        	webSocket.send( nick+"div"+inputMessage.value+"div"+rank);
	        	inputMessage.value = "";
	         textarea.scrollTop = textarea.scrollHeight;
	
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