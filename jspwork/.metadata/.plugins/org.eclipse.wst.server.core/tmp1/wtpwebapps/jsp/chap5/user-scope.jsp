<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="info" scope="request" class="key.user"/>
<jsp:setProperty name="info" property="name"/>
<jsp:setProperty name="info" property="num" param="id"/>
<HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<CENTER>
	<table border=0 width=300>
		<FORM method="post">
			<TR>
				<th bgcolor=#996699 colspan=2>
					<FONT color=white size=+1>JSP Beans 테스트</FONT>
				</th>
			</TR>
			<TR>
				<th width=20% bgcolor=#BB6699 width=40%>
					<FONT color=white size=-1>이름</FONT>
				</th>
				<td bgcolor=#99ccff width=60%>
					<input type=text name="name" value=<%=info.getname()%> size=10>
				</td>
			</TR>
			<TR>
				<th width=40% bgcolor=#BB6699>
					<FONT color=white size=-1>학번</FONT>
				</th>
				<td bgcolor=#99ccff>
					<input type=text name="id" value=<%=info.getnum()%> size=10>
				</td>
			</TR>
			<TR>
				<td colspan=2>
				<input type=submit value=" 보내기" >
				<input type=reset value="다시쓰기" >
				</td>
			</TR>
		</FORM>
	</table>
</CENTER>
<jsp:include page="setget-scope.jsp"/>
</body>
</HTML>