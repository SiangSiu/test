<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.io.*,java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script language="javascript">
function check(){
	with(document.msgdel){
		if(password.value.length == 0){
			alert("비밀번호를 입력해주세요!!");
			password.focus();
			return false;
		}
		document.msgdel.submit();
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="freeboard.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>
<form name="msgdel" method=post action=freeboard_deldb.jsp>
	<input type=hidden name=id value="<%=request.getParameter("id") %>">
	<input type=hidden name=page value="<%=request.getParameter("page") %>">
	<table width="70%" cellspacing="0" cellpadding="2">
		<tr>
			<td colspan="2" bgcolor="#1f4f8f" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#dfefdd" height="20" class="notice"><b>글 삭제하기</b></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#1f4f8f" height="1"></td>
		</tr>
		<tr>
			<td width="124" height="30" bgcolor="#f4f4f4" align="center" class="style2">비밀번호</td>
			<td width="494"><input type=password name=password class="input_style1"></td>
		</tr>
		<tr>
			<td colspan="2" height="1" class="button"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#1f4f8f" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<table width="100%" border="0" cellpadding="4" cellspacing="4">
					<tr>
						<td width="84%">&nbsp;</td>
						<td width="8%"><a href="freeboard_list.jsp?go=<%=request.getParameter("page") %>"><img src="image/list.jpg" width="46" heicht="19" border="0"></a></td>
						<td width="8%"><a href="#" onClick="check();"><img src="image/del.jpg" width="46" height="19" border="0"></a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>