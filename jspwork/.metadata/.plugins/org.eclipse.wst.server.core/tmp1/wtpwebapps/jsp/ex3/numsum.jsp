<%@ page import="mysum.numSum" contentType="text/html; charset=euc-kr" %>
<jsp:useBean id="mySum" class="mysum.numSum" scope="page"/>
<jsp:setProperty property="num" name="mySum"/>

<%


	out.print("������ ���� : " + mySum.getNum());
%>