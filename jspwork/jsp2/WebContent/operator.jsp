<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int a=5, b=5, x,y;

	out.print("변수 a의 값은 : " + a + "<P>");
	out.print("변수 b의 값은 : " + b + "<P>");
	
	x = a++;
	y = ++b;
	
	out.print("a++; 연산 시점에서 변수 a의 값은 : " + x + "<P>");
	out.print("++b; 연산 시점에서 변수 b의 값은 : " + y + "<P>");

	out.print("a++; 후에 변수 a의 값은 : " + a + "<P>");
	out.print("++b; 후에 변수 b의 값은 : " + b + "<P>");
%>