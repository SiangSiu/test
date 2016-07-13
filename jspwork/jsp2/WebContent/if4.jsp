<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int score = 70;

	if(score >= 70) {
		if(score == 100) {
			out.print("«’∞›«œºÃΩ¿¥œ¥Ÿ. <BR>");
			out.print("∏∏¡°¿‘¥œ¥Ÿ. <BR>");
		} else {
			out.print("«’∞›«œºÃΩ¿¥œ¥Ÿ. <BR>");
			out.print("BUT ∏∏¡°¿∫ æ∆¥‘.. <BR>");
		}
	} else {
		out.print("∫“«’∞›«ﬂ¿Ω.. §–§– §≤§≤ ¿ﬂ∞°∑≈ §–§– »Ê»Ê»Ê");
	}
%>