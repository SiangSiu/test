<%@ page info="Error Page" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Error Page</title>
<link rel="StyleSheet" href="style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table width="60%" border="1" cellspacing="0" cellpadding="0" align="center"
				bordercolorlight="#000000" bordercolordark="#FFFFFF">
				<tr>
					<td bgcolor="#CCCCFF" align="center" height="25"><font color="#FF0000">
					����(ERROR)</font></td>
				</tr>
				<tr>
					<td align="center">
						<table border="0" cellspacing="0" cellpadding="10">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>�ý��ۿ� ������ �߻��Ͽ����ϴ�. ����� �ٽ� �̿��� �ּ���.</td>
							</tr>
							<tr>
								<td>�������� : <%=exception.getMessage()%></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>

</table>

</body>
</html>