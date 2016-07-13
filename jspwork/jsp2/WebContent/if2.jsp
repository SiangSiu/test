<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int a =10, b = 20;
	
	if(a>=b)
		out.print("a가 b보다 크다. <BR>");
	else
		out.print("a가 b보다 작다. <BR>");	
	
	out.print("if문을 벗어났습니다.");
%>