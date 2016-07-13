<%@ page import="MyStar.Star" contentType="text/html; charset=euc-kr" %>
<jsp:useBean id="myStar" class="MyStar.Star" scope="page"/>
<jsp:setProperty name="myStar" property="num"/>

<%
	out.println("별표를 찍어주겠어");
	out.println("<BR>");
	

	for(int i=0; i<myStar.getNum(); i++){
		for(int j=0; j<=i;j++){
			out.print("*");
		}
		out.println("<BR>");
	}

	
	myStar.stars();
	
%>