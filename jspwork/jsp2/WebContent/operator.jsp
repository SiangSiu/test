<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int a=5, b=5, x,y;

	out.print("���� a�� ���� : " + a + "<P>");
	out.print("���� b�� ���� : " + b + "<P>");
	
	x = a++;
	y = ++b;
	
	out.print("a++; ���� �������� ���� a�� ���� : " + x + "<P>");
	out.print("++b; ���� �������� ���� b�� ���� : " + y + "<P>");

	out.print("a++; �Ŀ� ���� a�� ���� : " + a + "<P>");
	out.print("++b; �Ŀ� ���� b�� ���� : " + b + "<P>");
%>