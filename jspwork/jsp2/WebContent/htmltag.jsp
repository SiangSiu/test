<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<title>HTML �±� ����ϱ�</title>
</head>
<body>
<%
	int a =100;
	out.print("�̰����� �ڹ� �ڵ带 ����� �� �ִ�.<BR>");
%>

HTML �±׸� ����ؼ� ���� �ٲ� �� �ִ�.<br>

<%
 	out.print("���� a�� ���� : " + a + "<P>");
	out.print("\'out.print()\' �޼��� ������ HTML �±� ����� �����ϴ�. <BR>");
%>

<%="<B> ��¹������� �翬�� HTML �±׸� ����� �� �ִ�.</B>" %>
</body>
</html>