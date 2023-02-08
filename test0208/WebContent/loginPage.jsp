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
	<button>로그인</button><br/>
</form>
<a href="Controller?command=signup"><button type="button">회원가입</button></a>
</body>
</html>