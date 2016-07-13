<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int sum1=0;
int sum2=0;
for(int i=1; i<=100; i++){
	if(i%2==0){
		sum1+=i;
	}else {
		sum2+=i;
	}
}
%>

<table border=1>
<tr>
	<th  colspan = 2>
	<%
	out.print("결과는..");
	%>
	</th>
</tr>
<tbody>
	<tr>
		<td>
		<% out.print("짝수의 합은 " + sum1 + "입니다."); %>
		</td>
		<td>
		<%	out.print("홀수의 합은 " + sum2 + "입니다.");%>
		</td>
	</tr>
</tbody>
</table>

</body>
</html>