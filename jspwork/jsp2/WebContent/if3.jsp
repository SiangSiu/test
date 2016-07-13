<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int score = 83, i;
	i = 83/10;
	
	if(i==10) {
		out.print("만점입니다. <BR>");
		out.print("수고하셨습니다. <BR>");
	} else if(i==9) {
		out.print("90점대입니다. <BR>");
		out.print("조금만 더 노력하세요. <BR>");
	} else if(i==8) {
		out.print("80점대입니다. <BR>");
		out.print("열심히 하세요. <BR>");
	} else {
		out.print("80점대 미만입니다. <BR>");
		out.print("많이 노력하세요. <BR>");
	}
	
%>