<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>quiz���</title>
<script src="../../js/jquery-3.2.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js">
</script>
<script src="../../js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../bootstrap332/css/bootstrap.min.css">
</head>
<script>
function Check(){
	alert("üũ�� �����մϴ�");
	if($("#problem").val()==""){
		alert("������ �Է��ϼ���");
		return false;
	}else if($("#genre option:selected").val()==""){
		alert("������ �����ϼ���");
		return false;
	}else if($("#answer").val()==""){
		alert("������ �Է��ϼ���")
		return false;
	}else if($("#wrong1").val()==""){
		alert("����1�� �Է��ϼ���")
		return false;
	}else if($("form #wrong2").val() == ""){
		alert("����2�� �Է��ϼ���")
		return false;
	}else if($("#wrong3").val()=""){
		alert("����3�� �Է��ϼ���")
		return false;
	}else{
		return true;
	}
}
</script>
<body>
<form method="POST" action="../../../GuiltyPleasure/QuizRegister"  onSubmit="return Check()">
<input type="hidden" name="cmd" value="QUIZ_REGI"/>
	<div class="container">
	<div class="row">
		<div class="col-md-5">
				<div class="form-group">
					<label for="textProblem">����</label> <textarea
						placeholder="�����Է�"  name="textProblem" id="problem" class="form-control" ></textarea>
				</div>
			<select name="genre" id="genre">
				<option value="">���� ���� ����</option>
				<option value="�ͼ���">�ͼ���</option>
				<option value="���">���</option>
				<option value="��Ÿ">��Ÿ</option>
			</select>
				<div class="form-group">
					<label for="textAnswer">����</label> 
					<input type="text" placeholder="���� �Է�"  name="textAnswer"  id="answer"  class="form-control" />
				</div>
				<input type="text" class="form-control"  placeholder="����1"  id ="wrong1"  name="w1"/>
				<input type="text" class="form-control"  placeholder="����2"  id ="wrong2"  name="w2"/>
				<input type="text" class="form-control"  placeholder="����3"  id ="wrong3"  name="w3"/>
			<div id="confirm">
			</div>
				<input type= "submit" value="���� ����" />
				<input type ="reset" value="���" />
		</div>
		</div>
	</div>
</form>
</body>
</html>