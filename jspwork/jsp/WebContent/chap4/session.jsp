<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String userId = request.getParameter("id");
	String userPasswd = request.getParameter("passwd");
	
	String sessionId = session.getId();
	int sessionTime = session.getMaxInactiveInterval();
	
	out.print(userId + " �� ȯ���մϴ�.<P>");
	out.print("������ ���� ID : " + sessionId + "<p>");
	out.print("���� ���� �ð� : " + sessionTime);
	
%>