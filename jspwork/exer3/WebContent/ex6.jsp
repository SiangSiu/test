<%@ page import="exer3.ex6" contentType="text/html; charset=euc-kr" %>
<jsp:useBean id="myEx6" class="exer3.ex6" scope="page"/>
<jsp:setProperty name="myEx6" property="sum"/>

<%
	out.print("�Է¹��� �� ������ ���� >> " + myEx6.getSum());
%>
