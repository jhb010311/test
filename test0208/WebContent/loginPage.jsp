<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function check() {
	if($('#id').val().length == 0){
		alert('���̵� �Է��ϼ���');
		return false;
	}else if($('#pw').val().length == 0){
		alert('��й�ȣ �Է��ϼ���');
		return false;
	}else{
		return true;
	}
}
</script>
<style>
button {
	width:200px;
}

</style>
</head>
<body>
<form action="Controller?command=loginCheck" method="post" onsubmit="return check()">
	ID: <input type="text" name="id"><br/>
	PW: <input type="password" name="pw"><br/>
	<button>�α���</button><br/>
</form>
<a href="Controller?command=signup"><button type="button">ȸ������</button></a>
</body>
</html>