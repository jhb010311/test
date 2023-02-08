<%@page import="com.hb.dto.memberDto"%>
<%@page import="com.hb.dao.memberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%
memberDao dao = new memberDao();
ArrayList<memberDto> dto = dao.getAllMemberDto();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.container {
	width:409px;
}
table {
	border-collapse : collapse;
}
td,th {
	border: 1px solid gray;
	padding:8px;
}
</style>
</head>
<body>
<div class="container">
	<div style="display:flex; justify-content:space-between; margin-bottom:20px;">
		<div>
			회원관리
		</div>
		<div>
			<a href="Controller?command=login"><input type="button" value="로그인"></a>
		</div>
	</div>
	<table>
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>NAME</th>
			<th>POINT</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
		for(int i=0; i<=dto.size()-1; i++){
		%>
		<tr>
			<td><%=dto.get(i).getId()%></td>
			<td><%=dto.get(i).getPw()%></td>
			<td><%=dto.get(i).getName()%></td>
			<td><%=dto.get(i).getPoint()%></td>
			<td><input type="button" value="수정하기" class="edit"></td>
			<td><input type="button" value="삭제" class="delete"></td>
		</tr>
		<%
		}
		%>
	</table>
	<div>
		<div>
		스케쥴러 관리
		</div>
		<div style="display:flex;">
			<input type="button" value="스케쥴러 (20초마다 포인즈1씩 증가)실행 시작">
			<input type="button" value="스케쥴러 실행종료">
		</div>
	</div>
</div>
</body>
</html>