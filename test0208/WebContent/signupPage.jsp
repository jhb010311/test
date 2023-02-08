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
		alert('아이디 입력하세요');
		return false;
	}else if($('#pw').val().length == 0){
		alert('비밀번호 입력하세요');
		return false;
	}else if($('#name').val().length == 0) {
		alert('이름을 입력하세요');
		return false;
	}else{
		alert('회원가입 되었습니다.');
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
	<button>가입하기</button>
</form>
</body>
</html>