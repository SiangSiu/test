<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String FormData = request.getParameter("data");

	out.print("�� ���������� ���� ������ : " + FormData);
%>