<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	String FormData = request.getParameter("data");
	
	out.print("�� ���������� ���� ������ : "+ FormData);
%>