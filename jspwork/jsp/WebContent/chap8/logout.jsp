<%@ page info="logout" errorPage="error.jsp" %>
<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page language="java" import="java.io.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	session=request.getSession(false);
	session.invalidate();
%>
<script language="javascript">
<!--
parent.location.href="siangsiu.jsp";
//-->
</script>

</body>
</html>