<%@ page import="MyEcho.Echo" contentType="text/html; charset=euc-kr" %>
<jsp:useBean id="myEcho" class="MyEcho.Echo" scope="page"/>
<jsp:setProperty name="myEcho" property="msg2"/>
<%

	out.print("Echo ����� ���� ���� : " + myEcho.getMsg2() + "<BR>");
%>