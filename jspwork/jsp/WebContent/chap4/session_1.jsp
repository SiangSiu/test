<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 	request.setCharacterEncoding("euc-kr");
	String userId = request.getParameter("id");
	String userPasswd = request.getParameter("passwd");
	
	String sessionId = session.getId();
	int sessionTime = session.getMaxInactiveInterval();
	
	out.print(userId + " �� ȯ���մϴ�."+ "<br>");
	out.print("������ ���� ID : " + sessionId + "<p>");
	out.print("���� ���� �ð� : " + sessionTime);
%>