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
				alert("컨텐츠(intro)를 구입하였습니다.");
				location.href="Controller?command=buy&id=<%=id%>&point=<%=dto.getPoint()-1000%>";
			}else{
				alert("포인트부족. 광고클릭");
			}
		}else{
			
		}
		if(idx == 1){
			if(<%=dto.getPoint()%>>=3000){
				alert("컨텐츠(java)를 구입하였습니다.");
				location.href="Controller?command=buy&id=<%=id%>&point=<%=dto.getPoint()-3000%>";
			}else{
				alert("포인트부족. 광고클릭");
			}
		}
		if(idx == 2){
			if(<%=dto.getPoint()%>>=5000){
				alert("컨텐츠(c++)를 구입하였습니다.");
				location.href="Controller?command=buy&id=<%=id%>&point=<%=dto.getPoint()-5000%>";
			}else{
				alert("포인트부족. 광고클릭");
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
				alert('1000원 적립되었습니다.');
				location.href="Controller?command=main&id=<%=id%>";
			},
			error: function(x,s,e){
				alert('ajax실패');
			}
		})
	})
	
	$('#logout').click(function(){
		alert("로그아웃 되었습니다.");		
	})
})
</script>
</head>
<body>
<div>
	<div class="container">
		<div class="top">
			<div style="font-size:50px; font-weight:600;">
				메인페이지
			</div>
			<div class="top-right">
				<div style="margin-right:10px;">
				<%=dto.getName()%>님 안녕하세요<br/>
				포인트 : <%=dto.getPoint()%>점
				</div>
				<div>
				<a href="Controller?command=login"><input id="logout" type="button" value="로그아웃"></a>
				</div>
			</div>	
		</div>
		<div id="middles">
			<div style="font-size:20px; font-weight:600; margin-bottom:10px;">
				구입할 컨텐츠를 선택하세요.
			</div>
			<div style="display:flex;">
				<img class="Mimg" src="2.png">
				<img class="Mimg" src="3.png">
				<img class="Mimg" src="1.png">
			</div>
		</div>
		<div id="bottoms" style="float:right; margin-top:30px;">
			<div style="border:1px solid gray">
				<div>광고</div>
				<img id="GG" src="korea_it.png">
			</div>
		</div>
	</div>
</div>
</body>
</html>