<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int i, sum;
	i = sum =0;
	
	while(i< 10) {
		i++;
		sum = sum+i;
		out.print("�ݺ�Ƚ�� : " + i + "  ���ݱ����� �� : "+ sum + "<BR>");
	}

%>