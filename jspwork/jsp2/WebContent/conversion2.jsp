<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int a=10, b=20, c;
	float fa=10.5f, fb=20.0f, fc;
	
	c=a+'A';
	out.print("c의 값은 : " + c + "<P>");
	
	c=a+b;
	out.print("c의 값은 : " + c + "<P>");
	
	fc=a+fb;
	out.print("fc의 값은 : " + c + "<P>");
	
	fc=fb+a;
	out.print("fc의 값은 : " + c + "<P>");
	
	fc=fa+fb;
	out.print("fc의 값은 : " + c + "<P>");
%>