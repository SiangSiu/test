<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border=1>
<tr>
	<th colspan = 9>
	<%
	out.print("결과는..");
	%>
	</th>
</tr>
<tr>
	<%
	int sum=3;
	int i=3;
	do {
		out.println("<td>");
		out.print(sum);
		out.println("</td>");
		sum+=i;
		i++;
	}while(i<=11);
	
	%>
</tr>
</table>

</body>
</html>