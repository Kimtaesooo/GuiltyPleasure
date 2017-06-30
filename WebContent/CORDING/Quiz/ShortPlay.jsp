<%@page import="dao.quizmodule.CheckQuiz"%>
<%@page import="dto.Quiz"%>
<%@page import="dto.QuizResult"%>
<%@page import="dao.quizmodule.QuizRegister"%>
<%@page import="dao.quizmodule.CheckQuiz"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Quiz"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script>
$(document).ready(function(){
	$("#board").css("background","black").css("color","white").css("font-size","xx-large");

});
</script>
<title>Insert title here</title>

<%

	int counter =(Integer)request.getAttribute("counter");
	request.setCharacterEncoding("euc-kr");
	Quiz quiz = (Quiz) request.getAttribute("quiz");
	CheckQuiz check = new CheckQuiz();
	//check.setQuizList(quiz);
	//ArrayList quizlist = check.getQuizList();
%>
<script>
var result = new Array();
	function answerCheck(){
	<%//��µ� ������ ���� �Ϻθ� Ŭ������ �����ؼ� ����
			//result.setU_id(session.getAttribute("u_id")); ���� ���̵� ���������%>	
		if(counter>0){
			text = document.getElementById("text").value;
			combocheck(text, counter);
			location.href="/GuiltyPleasure/quiz?cmd=QUIZ_RESULT&counter="+counter+"&result="+result+"&method=SHORT";
		}else	if(counter==0){
			text = document.getElementById("text").value;
			combocheck(text, counter);
			location.href="/GuiltyPleasure/quiz?cmd=QUIZ_RESULT&result="+result+"&step=FINAL"+"&method=SHORT";
		}else if(counter<0){
				clearInterval(tid);
			}
	}
	function combocheck(text, j){
		result[0] ="<%=quiz.getQ_code()%>"
		result[1]= "<%=quiz.getQ_type()%>"
		answer = "<%=quiz.getQ_answer()%>"
		if (text == answer) {
			alert("�����Դϴ� " + text + ". ���� ������ :" + j);
			result[2] = "o";
			result[3] = text;
			result[4] = answer
	} else if (text != answer) {
			alert("�����Դϴ�. ������ " + answer + "�Դϴ�.  ���� ������ :" + j);
			result[2] = "x";
			result[3] = text;
			result[4] = answer
	}
	}
	
	var counter = <%=counter%>
	time = 30;
	function timer(){
		var text = document.getElementById("time");
		text.innerHTML= time;
		time--;
		if(time < 0){
			clearInterval(tid);
			if(counter>1){
			counter--;
			result[0] ="<%=quiz.getQ_code()%>"
				result[1]= "<%=quiz.getQ_type()%>"
				result[2]="x"
				result[3]="�ð��ʰ�";
				location.href="/GuiltyPleasure/quiz?cmd=QUIZ_GET&counter="+counter+"&result="+result;
				//alert("���� ���� ����"+counter)
			}else if(counter =1){
				alert("���� ��")
				clearInterval(tid);
			}
		}
	}
	window.onload = function(){
		tid = setInterval('timer()', 1000);
	}
</script>
</head>
<body>
<jsp:include page="/test_nav.jsp"/>
	<br>
	<br>
		<h2>
			<p class="text-center">�̱� ���� ����</p>
		</h2>
	<br>
	<br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1">
			<textarea class="form-control" rows="5" id="board">${quiz.getQ_question()}</textarea>
		</div>
			<br><br><br>
			
			<div class="col-lg-12">
				<div class="col-lg-3">
	  			<input type="test"  id="text"> 
				<input type="button" id="input" onclick="answerCheck();" value="�Է�"> 
				</div>
  			</div>
		
		<div class="col-xs-3">
			<div>
				<h3>
					���ѽð� 
					<label id="time">0</label>
				</h3>	
			</div>
			<br>
			<table border="0">
			<tr><th><h2>COMBO</h2></th></tr>
			<tr><th align="center"><h2>
			<c:if test="${combo ne null}">
			</c:if>0</h2></th>
			</tr>
			</table>
			<br><br>
				  <div class="col-lg-4">
	  			<input type="button" value="�����ϱ�" class="btn btn-danger btn-lg"/>
  				</div>

		</div>
	</div>
</body>
</html>