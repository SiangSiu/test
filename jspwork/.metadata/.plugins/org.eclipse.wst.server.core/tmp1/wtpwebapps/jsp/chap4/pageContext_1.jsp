<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	out.print("out.print() 메소드를 이용해서 출력합니다.<br>");

	pageContext.getOut().print("pageContext.getOut() 메소드를 통해서 출력합니다.<br>");
%>