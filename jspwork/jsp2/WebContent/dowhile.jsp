<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int i, sum;
	i = sum = 0;
	
	do {
		i++;
		sum = sum +i;
		
		out.print("반복횟수 : " + i + "   지금까지의 합 : " + sum + "<BR>");
	}while(i>10);

%>
