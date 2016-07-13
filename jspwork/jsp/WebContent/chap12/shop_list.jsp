<%@ page contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쇼핑하기</title>
<script language="javascript">
	function view(temp) {
		if(temp.length > 0) {
			url ="http://localhost:8080/jsp/chap12/upload/" + temp;
			window.open(url, "win", "height=350, width=450,toolbar=0,menubar=0,scrollbars=1,resizable=1,status=0");
		}
	}

</script>
</head>
<body>
<p align=center>
	<font color=#0000ff face=굴림 size=3>
		<strong>쇼핑하기</strong>
	</font>
</p>

<form method=post name=search action="shop_list.jsp">
<table border=0 width=95%>
	<tr>
		<th align=right>
			<font size=-1>.상품명으로 찾기</font>
			<input type=text name=pname>
			<input type=submit value="검색">
		</th>
	</tr>
	<tr>
		<th>
			<font size=-1>
				[<a href="main.html">메인으로</a>]
				<a href="shop_list.jsp">전체</a>
				<a href="shop_list.jsp?cat=11">가구</a>
				<a href="shop_list.jsp?cat=22">전기/전자</a>
				<a href="shop_list.jsp?cat=33">부엌용품</a>
				<a href="shop_list.jsp?cat=44">의류</a>
				<a href="shop_list.jsp?cat=55">보석 및 악세사리</a>
				<a href="shop_list.jsp?cat=66">헬스 기구</a>
				<a href="shop_list.jsp?cat=77">컴퓨터 관련</a>
				<a href="shop_list.jsp?cat=88">기구</a>
			</font>
		</th>
	</tr>
</table>
</form>

<center>
<table width=95% sthle="font-size:10pt">
<%
String cond="";
String ca="";
String pn="";

if(request.getParameter("cat")!=null) {
	if(!(request.getParameter("cat").equals(""))){
		ca=request.getParameter("cat");
		cond = " where category ='"+ ca+"'";
	}
}

if(request.getParameter("pname") != null) {
	if(!(request.getParameter("pname").equals(""))){
		pn=request.getParameter("pname");
		cond = " where pname like '%" + pn+"%'";
	}
}


Vector pname = new Vector();
Vector sname = new Vector();
Vector keyid = new Vector();
Vector price = new Vector();
Vector dprice = new Vector();
Vector stock = new Vector();
Vector small = new Vector();
Vector large = new Vector();
Vector description = new Vector();

String url = "http://localhost:8080/jsp/chap12/upload/";

NumberFormat nf = NumberFormat.getInstance();

int stocki;
String pricestr=null;
String dpricestr=null;
String filename="";

int where=1;

if(request.getParameter("go")!=null)
	where = Integer.parseInt(request.getParameter("go"));

int nextpage = where+1;
int priorpage = where-1;
int startrow=0;
int endrow=0;
int maxrows=3;
int totalrows=0;
int totalpages=0;

long id = 0;

Connection con =null;
Statement st=null;
ResultSet rs = null;

try {
	Class.forName("org.gjt.mm.mysql.Driver");
//	Class.forName("oracle.jdbc.driver.OracleDriver");
	
}catch(ClassNotFoundException e){
	out.println(e.getMessage());
}

try {
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?useUnicode=true&characterEncoding=euckr","root","apmsetup");
	//con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "1234");
} catch(SQLException e) {
	out.println(e);
}

try {
	st = con.createStatement();
	String sql = "select * from product" ;
	sql = sql+ cond + " order by id desc";
	rs= st.executeQuery(sql);
	if(!(rs.next())){
		out.println("상품이 없습니다.");
	} else {
		do{
			keyid.addElement(new Long(rs.getLong("id")));
			pname.addElement(rs.getString("pname"));
			sname.addElement(rs.getString("sname"));
			price.addElement(new Integer(rs.getInt("price")));
			dprice.addElement(new Integer(rs.getString("downprice")));
			stock.addElement(new Integer(rs.getInt("stock")));
			description.addElement(rs.getString("description"));
			small.addElement(rs.getString("small"));
			large.addElement(rs.getString("large"));
		}while(rs.next());
	
		totalrows = pname.size();
		totalpages = (totalrows-1)/maxrows +1;
		
		startrow = (where-1)*maxrows;
		endrow = startrow+maxrows-1;
	
		if(endrow >= totalrows)
			endrow=totalrows-1;
		
		for(int j=startrow;j<=endrow;j++) {
			id=((Long)keyid.elementAt(j)).longValue();
			stocki=((Integer)stock.elementAt(j)).intValue();
			filename = url+(String)small.elementAt(j);
			pricestr = nf.format(price.elementAt(j));
			dpricestr=nf.format(dprice.elementAt(j));
			
			%>
			<tr>
				<th rowspan=4>
					<a href=javaScript:view("<%=large.elementAt(j) %>")><img border=0 width=70 height=70 src="<%=filename %>">
						<br>확대
					</a>
				</th>
				<td bgcolor="#dfedff">
					<font face="돋움체" color=black><%=pname.elementAt(j) %>(코드:<%=id %>)</font>
				</td>
			</tr>
			<tr>
				<td bgcolor=#eeeeee><%=description.elementAt(j) %></td>
			</tr>
			<tr>
				<td align=right>
					시중가 : <strike><%=pricestr %></strike>원&nbsp;&nbsp;
					판매가 : <%=dpricestr %>원
				</td>
			</tr>
			<form method=post name=search action="sale.jsp">
				<tr>
					<td align=right>
						제조(공급)원 : <%=sname.elementAt(j) %>&nbsp;&nbsp;
			
		<%	if(stocki>0) { %>
						주문수량
						<input type=text name=quantity size=2 value=1>개
						<input type=hidden name=id value=<%=id %>>
						<input type=hidden name=go value=<%=where %>>
						<input type=hidden name=cat value=<%=ca %>>
						<input type=hidden name=pname value=<%=pn %>>
						<input type=submit value="바구니에 담기">
	
				
	<% }else
				out.println("품절"); %>
					</td>
				</tr>
			</form>
	<% 		
		}
		rs.close();
	}
	
	%>
	</table>
	<%
	st.close();
	con.close();
} catch(SQLException e){
	out.println(e);
}
	

if(where< totalpages) { %>
[<a href="shop_list.jsp?go=<%=nextpage %>&cat=<%=ca %>&pname=<%=pn %>">다음</a>]	
[<a href="shop_list.jsp?go=<%=totalpages %>&cat=<%=ca %>&pname=<%=pn %>">마지막</a>]	

<% 
}else {
out.println("[다음]");
out.println("[마지막]");


}

out.println(where+"/"+totalpages);
out.println("전체 상품수 : "+ totalrows);
%>


</center>


</body>
</html>