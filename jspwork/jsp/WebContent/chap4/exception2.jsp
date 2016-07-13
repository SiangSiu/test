<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage="true" %>

<%
	out.print("에러 메시지 : " + exception.getMessage() + "<br>");
%>