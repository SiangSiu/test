<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	int sum=0;
	for(int i=1; i<=100; i++) {
		if(i%5!=0){
			continue;
		}
		sum+=i;
	}
	out.println("1�������� 100������ 5�� ����� ���� : " + sum);
%>
