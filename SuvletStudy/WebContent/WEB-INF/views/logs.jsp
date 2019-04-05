<%@page import="com.vigteam.study.vo.LogVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- dev 브랜치에서 작성 -->

<!-- JavaScript 넣기 -->
<script language="javascript">
	function checkForm(frm){
		var name = frm.name.value;
		var log = frm.log.value;
		
		if(name.length == 0){
			alert('이름을 입력하세요');
			frm.name.focus();
		} else if(log.length == 0){
			alert('로그를 입력하세요');
			frm.log.focus();
		} else {
			frm.submit();	// 전송
		}
	}
</script>
</head>
<body>
	<h1>Logs</h1>
	
	<ul>
<%
List<LogVo> list = (List<LogVo>)request.getAttribute("list");
for(LogVo vo: list){
	%>
	<li><%=vo %></li>
	<%
}
%>
	</ul>
	
	<!-- HTML Form -->
	
	<!-- '''ServletStudy'''/logs 이렇게 뜨게끔(확실히 하는거) -->
  <form action="<%= request.getContextPath() %>/logs" 
	method="POST">
	<label for="name">이름</label>
	<input type="text" name="name"><br>
	<label for ="log">기록</label>
	<input type="text" name="log"><br>
	<!-- <input type="submit" value="전송"> -->
	<input type="button" value="전송" onclick="checkForm(this.form)">
	<!-- this는 button -->
  </form>
</body>
</html>