<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int score = 70;

	if(score >= 70) {
		if(score == 100) {
			out.print("�հ��ϼ̽��ϴ�. <BR>");
			out.print("�����Դϴ�. <BR>");
		} else {
			out.print("�հ��ϼ̽��ϴ�. <BR>");
			out.print("BUT ������ �ƴ�.. <BR>");
		}
	} else {
		out.print("���հ�����.. �Ф� ���� �߰��� �Ф� ������");
	}
%>