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
	}else if($('#name').val().length == 0) {
		alert('�̸��� �Է��ϼ���');
		return false;
	}else{
		alert('ȸ������ �Ǿ����ϴ�.');
		return true;
	}
}
</script>
</head>
<body>
<form action="Controller?command=signupInsert" method="post" onsubmit="return check()">
	ID: <input type="text" name="id" id="id"><br/>
	PW: <input type="password" name="pw" id="pw"><br/>
	Name: <input type="text" name="name" id="name"><br/>
	<button>�����ϱ�</button>
</form>
</body>
</html>