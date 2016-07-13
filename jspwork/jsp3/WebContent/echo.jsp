<%@ page import="MyEcho.Echo" contentType="text/html; charset=euc-kr" %>
<jsp:useBean id="myEcho" class="MyEcho.Echo" scope="page"/>
<jsp:setProperty name="myEcho" property="msg2"/>
<%

	out.print("Echo 빈즈에서 받은 내용 : " + myEcho.getMsg2() + "<BR>");
%>