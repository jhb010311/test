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
			ȸ������
		</div>
		<div>
			<a href="Controller?command=login"><input type="button" value="�α���"></a>
		</div>
	</div>
	<table>
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>NAME</th>
			<th>POINT</th>
			<th>����</th>
			<th>����</th>
		</tr>
		<%
		for(int i=0; i<=dto.size()-1; i++){
		%>
		<tr>
			<td><%=dto.get(i).getId()%></td>
			<td><%=dto.get(i).getPw()%></td>
			<td><%=dto.get(i).getName()%></td>
			<td><%=dto.get(i).getPoint()%></td>
			<td><input type="button" value="�����ϱ�" class="edit"></td>
			<td><input type="button" value="����" class="delete"></td>
		</tr>
		<%
		}
		%>
	</table>
	<div>
		<div>
		�����췯 ����
		</div>
		<div style="display:flex;">
			<input type="button" value="�����췯 (20�ʸ��� ������1�� ����)���� ����">
			<input type="button" value="�����췯 ��������">
		</div>
	</div>
</div>
</body>
</html>