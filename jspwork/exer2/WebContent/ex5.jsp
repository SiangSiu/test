<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>안녕?????????????????????????/</title>
</head>
<body>
<% 
 int[][] arr = {
		{3,5,4,4,3},
		{2,3,5,4,5},
		{4,4,5,2,1}
};
 

%>
<%!
	public String converter(int i){
	String str;
	
	if(i==1){
		str="C";
	}else if(i>1&&i<4){
		str="B";
	}else {
		str="A";
	}
	
	
	return str;
}
%>
<table border=1>
<tr>
	<th>
	<% out.print("회"); %>
	</th>
	<th colspan = 5>
	<% out.print("점수(등급)"); %>
	</th>
</tr>
<%
for(int i=0; i<arr.length; i++){
	out.println("<tr>");
	out.println("<td>");
	out.print(i+1 +"회전");
	out.println("</td>");
	
	for(int j =0; j<arr[i].length; j++) {
		out.println("<td>");
		out.print(arr[i][j] + "(" + converter(arr[i][j])+ ")");
		out.println("</td>");
	}
	
	out.println("</tr>");
}

%>

</table>

</body>
</html>