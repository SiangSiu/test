<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int a=10, b=20, c;
	float fa=10.5f, fb=20.0f, fc;
	
	c=a+'A';
	out.print("c�� ���� : " + c + "<P>");
	
	c=a+b;
	out.print("c�� ���� : " + c + "<P>");
	
	fc=a+fb;
	out.print("fc�� ���� : " + c + "<P>");
	
	fc=fb+a;
	out.print("fc�� ���� : " + c + "<P>");
	
	fc=fa+fb;
	out.print("fc�� ���� : " + c + "<P>");
%>