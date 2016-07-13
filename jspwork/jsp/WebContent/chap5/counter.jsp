<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <<jsp:useBean id="cnt" scope="application" class="key.counter"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>호호호호</title>
</head>
<body> 
<%
	int count = 0;
	session = request.getSession();
	session.setMaxInactiveInterval(1);
	String first = (String)session.getValue("checkfirst");
	
	if(first != null){ 
		count=cnt.getCount();
	}else {
		cnt.setCount();
		count = cnt.getCount();
		session.putValue("chechfirst", "first");
	}
	out.println("현재까지 방문자 수 : "+ count);
%>
</body>
</html>