<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String str = request.getParameter("move");
	response.sendRedirect(str);
%>