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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$("#board").css("background","black").css("color","white").css("font-size","xx-large");

});
</script>
<script>
var isFirst = false;
$(document).keyup(function (e) {
	if(e.which == 49) isFirst=false;
	}).keydown(function (e) {
	    if(e.which == 49) isFirst=true;
	    if( isFirst == true) {
	    	answerCheck(1);
	 	return false;
	 }
});
var isSecond = false;
$(document).keyup(function (e) {
	if(e.which == 50) isSecond=false;
	}).keydown(function (e) {
	    if(e.which == 50) isSecond=true;
	    if( isSecond == true) {
	    	answerCheck(2);
	 	return false;
	 }
});
var isThird = false;
$(document).keyup(function (e) {
	if(e.which == 51) isThird=false;
	}).keydown(function (e) {
	    if(e.which == 51) isThird=true;
	    if( isThird == true) {
	    	answerCheck(3);
	 	return false;
	 }
});
var isFourth = false;
$(document).keyup(function (e) {
	if(e.which == 52) isFourth=false;
	}).keydown(function (e) {
	    if(e.which == 52) isFourth=true;
	    if( isFourth == true) {
	    	answerCheck(4);
	 	return false;
	 }
});
</script>
<title>Insert title here</title>
<%
	int counter =(int)request.getAttribute("counter");
	request.setCharacterEncoding("euc-kr");
	Quiz quiz = (Quiz) request.getAttribute("quiz");
	CheckQuiz check = new CheckQuiz();
	check.setQuizList(quiz);
	ArrayList quizlist = check.getQuizList();
%>
<script>
var result = new Array();
	function answerCheck(i){
	<%//��µ� ������ ���� �Ϻθ� Ŭ������ �����ؼ� ����
			//result.setU_id(session.getAttribute("u_id")); ���� ���̵� ���������%>	
		if(counter>0){
			select = document.getElementById("text"+i).value;
			combocheck(select, counter);
			location.href="/GuiltyPleasure/quiz?cmd=QUIZ_RESULT&counter="+counter+"&result="+result;
		}else	if(counter==0){
			select = document.getElementById("text"+i).value;
			combocheck(select, counter);
			location.href="/GuiltyPleasure/quiz?cmd=QUIZ_RESULT&result="+result+"&step=FINAL";
		}else if(counter<0){
				clearInterval(tid);
			}
	}
	function combocheck(select, j){
		result[0] ="<%=quiz.getQ_code()%>"
		result[1]= "<%=quiz.getQ_type()%>"
		answer = "<%=quiz.getQ_answer()%>"
		if (select == answer) {
		//	alert("�����Դϴ� " + select + ". ���� ������ :" + j);
			result[2] = "o";
	} else if (select != answer) {
		//	alert("�����Դϴ�.  " + select + " ���� ������ :" + j);
			result[2] = "x";
	}
	}
</script>
<script>
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
<!-- 
	<h1>�̱� �÷��� ����</h1>

	<div style="float: left; width: 60%">
		ù��° ����
		<div style="width: 60%; height: 300px">
			���� ������ ������ ��
			<h2>${quiz.getQ_question()}</h2>
		</div>
		<div style="width: 60%; height: 100px">
			���� ���Ⱑ ������ ��
		<div>
		<input type="button" value="<%=quizlist.get(0)%>" id="text1"onclick="answerCheck(1);" /> 
		<input type="button" value="<%=quizlist.get(1)%>" id="text2" onclick="answerCheck(2);" />
		<input type="button" value="<%=quizlist.get(2)%>" id="text3" onclick="answerCheck(3);" />
		<input type="button" value="<%=quizlist.get(3)%>" id="text4" onclick="answerCheck(4);" />
		</div>
		
		<div style="float: right; width: 50%">
			<input type="button" value="�����ϱ�"/>
		</div>
		</div>
		<div id="time" style="float: left; width: 50%">
		</div>
	</div>
	<div style="border: 2px solid; float: right; width: 30%; height: 300px">
		�ι�° �����Դϴ�.
		<c:if test="${combo ne null}">
			�޺��� ����մϴ�.
		</c:if>
	</div>
-->
		<br>
	<br>
		<h2>
			<p class="text-center">�̱� ���� ����</p>
		</h2>
	<br>
	<br>
	<br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1">
			<textarea class="form-control" rows="6" id="board">${quiz.getQ_question()}</textarea>
			<br><br><br>
			<p>
			<div class="col-lg-12">
				<div class="col-lg-3">
	  			<input type="button" class="btn btn-primary btn-lg" value="<%=quizlist.get(0)%>" id="text1"onclick="answerCheck(1);" /> 
				</div>
				<div class="col-lg-3">
				<input type="button" class="btn btn-primary btn-lg" value="<%=quizlist.get(1)%>" id="text2" onclick="answerCheck(2);" />
				</div>
				<div class="col-lg-3">
				<input type="button" class="btn btn-primary btn-lg" value="<%=quizlist.get(2)%>" id="text3" onclick="answerCheck(3);" />
				</div>
				<div class="col-lg-3">
				<input type="button" class="btn btn-primary btn-lg" value="<%=quizlist.get(3)%>" id="text4" onclick="answerCheck(4);" />
	  			</div>

  			</div>

			</p>
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
			<br><br><br><br><br><br><br>
				  <div class="col-lg-4">
	  			<input type="button" value="�����ϱ�" class="btn btn-danger btn-lg"/>
  				</div>

		</div>
	</div>
</body>
</html>