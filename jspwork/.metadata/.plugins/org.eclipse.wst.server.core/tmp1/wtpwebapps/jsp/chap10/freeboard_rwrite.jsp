<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="filegb.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
function check(){
	with(document.msgrewrite){
		if(subject.value.length == 0){
			alert("제목을 입력 해주세요!!");
			subject.focus();
			return false;
		}
		
		if(name.value.length == 0){
			alert("이름을 입력 해주세요!!");
			name.focus();
			return false;
		}
		if(password.value.length == 0){
			alert("비밀번호을 입력 해주세요!!");
			password.focus();
			return false;
		}
		if(content.value.length == 0){
			alert("내용을 입력 해주세요!!");
			content.focus();
			return false;
		}
		document.msgrewrite.submit();
	}
}
//-->
</script>
</head>
<body>
<p>
<%
String sql=null;
Connection con=null;
Statement st = null;
ResultSet rs = null;
int pos=0;
String sub=null;
String cont=null;
int step=0;
int rnum=0;
int mid = 0;
int id = Integer.parseInt(request.getParameter("id"));

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
}catch (ClassNotFoundException e){
	out.println(e.getMessage());
}

try {
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "1234");
}catch(SQLException e){
	out.println(e);
}

try {
	sql="select * from freeboard where id="+id;
	st = con.createStatement();
	rs = st.executeQuery(sql);
	if(!(rs.next())) {
		out.println("해당 내용이 없습니다.");
	} else {
		cont =">" +rs.getString("content");
		while((pos=cont.indexOf("\n", pos))!= -1){
			String left=cont.substring(0, pos+1);
			String right=cont.substring(pos+1, cont.length());
			cont = left +">" + right;
			pos +=2;
		}
		sub = "Re:" + rs.getString("subject");
		step = rs.getInt("step");
		mid = rs.getInt("masterid");
		rnum = rs.getInt("replynum");

%>

<form name="msgrewrite" method=post action="freeboard_rsave.jsp?id=<%=id %>&page=<%=request.getParameter("page") %>">
	<table width="600" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td colspan="2" bgcolor="#1f4f8f" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#dfedff" height="20" class="notice">&nbsp;&nbsp;<font size="2">글 답변하기</font></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#1f4f8f" height="1"></td>
		</tr>
		<tr>
			<td width="124" height="30" align="center" bgcolor="#f4f4f4">이  름</td>
			<td width="494" style="padding:0 0 0 10">
				<input type=text name=name class= "input_style1">
			</td> 
		</tr>
		<tr>
			<td width="124" align="center" bgcolor="#f4f4f4">E-mail</td>
			<td width="494" style="padding:0 0 0 10" height="25">
				<input type=text name=email class= "input_style1">
			</td> 
		</tr>
		<tr>
			<td width="124" align="center" bgcolor="#f4f4f4">제  목</td>
			<td width="494" style="padding:0 0 0 10" height="25">
				<input type=text name=subject size=60 value="Re : <%=rs.getString("subject") %>" class= "input_style2">
			</td> 
		</tr>
		<tr>
			<td width="124" height="162" align="center" valign="top" bgcolor="#f4f4f4" style="padding-top:7;">내  용</td>
			<td width="494" valign="top" style="padding:5 0 5 10">
				<textarea rows="10" cols="65" name=content class="textarea_style1">

-----------------------------------------------------------------------
<%=cont%></textarea>
			</td> 
		</tr>
		<tr>
			<td width="124" align="center" bgcolor="#f4f4f4">암  호</td>
			<td width="494" style="padding:0 0 0 10" height="25" >
				<input type=password name=password class= "input_style1"><br>(정확한 비밀번호를 입력해야만 수정이 됩니다.)
			</td> 
		</tr>
		<tr>
			<td colspan="2" height="1" class="button"></td>
		</tr>
		<tr>
			<td colspan="2" height="1" bgcolor="#1f4f8f" ></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td width="64%">&nbsp;</td>
						<td width="12%"><a href="#" onClick="check();"><img src="image/ok.gif" border="0"></a></td>
						<td width="12%"><a href="#" onClick="history.go(-1)"><img src="image/cancle.gif" border="0"></a></td>
						<td width="12%"><a href="freeboard_list.jsp?go=<%=request.getParameter("page") %>"><img src="image/list.jpg" border="0"></a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<input type="hidden" name="step" value="<%=step %>">
	<input type="hidden" name="mid" value="<%=mid %>">
	<input type="hidden" name="rnum" value="<%=rnum %>">
</form>

<%
	}
	rs.close();
	st.close();
	con.close();
}catch (SQLException e) {
	out.println(e);
}


%>

</body>
</html>