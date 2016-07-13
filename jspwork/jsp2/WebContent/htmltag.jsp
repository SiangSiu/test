<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<title>HTML 태그 사용하기</title>
</head>
<body>
<%
	int a =100;
	out.print("이곳에는 자바 코드를 사용할 수 있다.<BR>");
%>

HTML 태그를 사용해서 줄을 바꿀 수 있다.<br>

<%
 	out.print("변수 a의 값은 : " + a + "<P>");
	out.print("\'out.print()\' 메서드 내에서 HTML 태그 사용이 가능하다. <BR>");
%>

<%="<B> 출력문에서도 당연히 HTML 태그를 사용할 수 있다.</B>" %>
</body>
</html>