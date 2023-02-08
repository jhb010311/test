<%@page import="com.hb.dto.memberDto"%>
<%@page import="com.hb.dao.memberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String id = request.getParameter("id");
memberDao dao = new memberDao();
memberDto dto = dao.getMemberDto(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.container {
	width:1000px;
}
.top {
 display:flex;
 justify-content : space-between;
 margin-bottom: 30px;
}
.top-right {
 display:flex;
}
</style>
<script>
$(function(){
	$('.Mimg').click(function(){
		let idx = $(this).index();	
		if(idx == 0){
			if(<%=dto.getPoint()%>>=1000){
				alert("������(intro)�� �����Ͽ����ϴ�.");
				location.href="Controller?command=buy&id=<%=id%>&point=<%=dto.getPoint()-1000%>";
			}else{
				alert("����Ʈ����. ����Ŭ��");
			}
		}else{
			
		}
		if(idx == 1){
			if(<%=dto.getPoint()%>>=3000){
				alert("������(java)�� �����Ͽ����ϴ�.");
				location.href="Controller?command=buy&id=<%=id%>&point=<%=dto.getPoint()-3000%>";
			}else{
				alert("����Ʈ����. ����Ŭ��");
			}
		}
		if(idx == 2){
			if(<%=dto.getPoint()%>>=5000){
				alert("������(c++)�� �����Ͽ����ϴ�.");
				location.href="Controller?command=buy&id=<%=id%>&point=<%=dto.getPoint()-5000%>";
			}else{
				alert("����Ʈ����. ����Ŭ��");
			}
		}
	})
	
	$('#GG').click(function(){
		$.ajax({
			url:"pointplus",
			data: {
				id:<%="'"+id+"'"%>,
				point:<%=dto.getPoint()%>,
			},
			
			success: function(result){
				alert('1000�� �����Ǿ����ϴ�.');
				location.href="Controller?command=main&id=<%=id%>";
			},
			error: function(x,s,e){
				alert('ajax����');
			}
		})
	})
	
	$('#logout').click(function(){
		alert("�α׾ƿ� �Ǿ����ϴ�.");		
	})
})
</script>
</head>
<body>
<div>
	<div class="container">
		<div class="top">
			<div style="font-size:50px; font-weight:600;">
				����������
			</div>
			<div class="top-right">
				<div style="margin-right:10px;">
				<%=dto.getName()%>�� �ȳ��ϼ���<br/>
				����Ʈ : <%=dto.getPoint()%>��
				</div>
				<div>
				<a href="Controller?command=login"><input id="logout" type="button" value="�α׾ƿ�"></a>
				</div>
			</div>	
		</div>
		<div id="middles">
			<div style="font-size:20px; font-weight:600; margin-bottom:10px;">
				������ �������� �����ϼ���.
			</div>
			<div style="display:flex;">
				<img class="Mimg" src="2.png">
				<img class="Mimg" src="3.png">
				<img class="Mimg" src="1.png">
			</div>
		</div>
		<div id="bottoms" style="float:right; margin-top:30px;">
			<div style="border:1px solid gray">
				<div>����</div>
				<img id="GG" src="korea_it.png">
			</div>
		</div>
	</div>
</div>
</body>
</html>