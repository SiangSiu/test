/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.35
 * Generated at: 2016-07-05 05:16:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.chap12;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.text.*;

public final class product_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("java.text");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
 request.setCharacterEncoding("euc-kr"); 
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=EUC-KR\">\r\n");
      out.write("<title>상품 목록 </title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<p align=\"center\">\r\n");
      out.write("<font color=0000ff face=굴림 size=+1>\r\n");
      out.write("<strong> 상품 목록 </strong></font><p>\r\n");
      out.write("\r\n");
      out.write("<form method=post name=search action=\"product_list.jsp\">\r\n");
      out.write("<table border=0 width=\"95%\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=right>\r\n");
      out.write("\t\t\t<font size=-1>상품명으로 찾기</font>\r\n");
      out.write("\t\t\t<input type=text name= pname>\r\n");
      out.write("\t\t\t<input type=submit value=\"검색\">\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<th>\r\n");
      out.write("\t\t\t<font size=-1>\r\n");
      out.write("\t\t\t\t[<a href=\"main.html\">메인으로</a>]\r\n");
      out.write("\t\t\t\t<a href=\"product_list.jsp\">전체</a>\r\n");
      out.write("\t\t\t\t<a href=\"product_list.jsp?cat=11\">가구</a>\r\n");
      out.write("\t\t\t\t<a href=\"product_list.jsp?cat=22\">전기/전자</a>\r\n");
      out.write("\t\t\t\t<a href=\"product_list.jsp?cat=33\">부엌용품</a>\r\n");
      out.write("\t\t\t\t<a href=\"product_list.jsp?cat=44\">의류</a>\r\n");
      out.write("\t\t\t\t<a href=\"product_list.jsp?cat=55\">보석 및 악세사리</a>\r\n");
      out.write("\t\t\t\t<a href=\"product_list.jsp?cat=66\">헬스 기구</a>\r\n");
      out.write("\t\t\t\t<a href=\"product_list.jsp?cat=77\">컴퓨터 관련</a>\r\n");
      out.write("\t\t\t\t<a href=\"product_list.jsp?cat=88\">기타</a>\r\n");
      out.write("\t\t\t</font>\r\n");
      out.write("\t\t</th>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<center>\r\n");
      out.write("<table border=0 width=95% cellpadding=4 cellspacing=4 style=\"font-size:10pt\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<th width=5% bgcolor=#dfedff>\r\n");
      out.write("\t\t\t<font color=black face=굴림>\r\n");
      out.write("\t\t\t\t<nobr>번호</nobr>\r\n");
      out.write("\t\t\t</font>\r\n");
      out.write("\t\t</th>\r\n");
      out.write("\t\t<th width=25% bgcolor=#dfedff>\r\n");
      out.write("\t\t\t<font color=black face=굴림>\r\n");
      out.write("\t\t\t\t<nobr>상품명</nobr>\r\n");
      out.write("\t\t\t</font>\r\n");
      out.write("\t\t</th>\r\n");
      out.write("\t\t<th width=10% bgcolor=#dfedff>\r\n");
      out.write("\t\t\t<font color=black face=굴림>\r\n");
      out.write("\t\t\t\t<nobr>코드번호</nobr>\r\n");
      out.write("\t\t\t</font>\r\n");
      out.write("\t\t</th>\r\n");
      out.write("\t\t<th width=15% bgcolor=#dfedff>\r\n");
      out.write("\t\t\t<font color=black face=굴림>\r\n");
      out.write("\t\t\t\t<nobr>제조원</nobr>\r\n");
      out.write("\t\t\t</font>\r\n");
      out.write("\t\t</th>\r\n");
      out.write("\t\t<th width=10% bgcolor=#dfedff>\r\n");
      out.write("\t\t\t<font color=black face=굴림>\r\n");
      out.write("\t\t\t\t<nobr>판매시작일</nobr>\r\n");
      out.write("\t\t\t</font>\r\n");
      out.write("\t\t</th>\r\n");
      out.write("\t\t<th width=10% bgcolor=#dfedff>\r\n");
      out.write("\t\t\t<font color=black face=굴림>\r\n");
      out.write("\t\t\t\t<nobr>판매가(원)</nobr>\r\n");
      out.write("\t\t\t</font>\r\n");
      out.write("\t\t</th>\r\n");
      out.write("\t\t<th width=10% bgcolor=#dfedff>\r\n");
      out.write("\t\t\t<font color=black face=굴림>\r\n");
      out.write("\t\t\t\t<nobr>재고량</nobr>\r\n");
      out.write("\t\t\t</font>\r\n");
      out.write("\t\t</th>\r\n");
      out.write("\t\t<th width=15% bgcolor=#dfedff>\r\n");
      out.write("\t\t\t<font color=black face=굴림>\r\n");
      out.write("\t\t\t\t<nobr>분류</nobr>\r\n");
      out.write("\t\t\t</font>\r\n");
      out.write("\t\t</th>\r\n");
      out.write("\t</tr>\r\n");


String cond="";
String ca="";
String pn="";

if(request.getParameter("cat") != null) {
	if( !(request.getParameter("cat").equals(""))){
		ca=request.getParameter("cat");
		cond=" where category = '"+ ca+"'";
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
Vector cat = new Vector();
Vector dprice = new Vector();
Vector inputdate = new Vector();
Vector stock = new Vector();
String category = null;

long id=0;

NumberFormat nf = NumberFormat.getInstance();
String downprice = null;

int where=1;
int totalgroup=0;
int maxpages=2;
int startpage=1;
int endpage=startpage+maxpages-1;
int wheregroup=1;
if(request.getParameter("go")!=null) {
	where = Integer.parseInt(request.getParameter("go"));
	wheregroup = (where-1)/maxpages+1;
	startpage=(wheregroup-1)*maxpages+1;
	endpage=startpage+maxpages-1;
} else if(request.getParameter("gogroup")!=null){
	wheregroup = Integer.parseInt(request.getParameter("gogroup"));
	startpage=(wheregroup-1)*maxpages+1;
	where =startpage;
	endpage=startpage+maxpages-1;
	
}
int nextgroup=wheregroup+1;
int priorgroup=wheregroup-1;

int startrow=0;
int endrow=0;
int maxrows=5;
int totalrows=0;
int totalpages=0;
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
	String sql = "select * from product";
	sql = sql +cond+ " order by id";
	rs = st.executeQuery(sql);
	if(!(rs.next())){
		out.println("상품이 없습니다.");
	} else {
		do{
			keyid.addElement(new Long(rs.getLong("id")));
			cat.addElement(rs.getString("category"));
			pname.addElement(rs.getString("pname"));
			sname.addElement(rs.getString("sname"));
			dprice.addElement(new Integer(rs.getString("downprice")));
			String idate = rs.getString("inputdate");
			idate = idate.substring(0,8);
			inputdate.addElement(idate);
			stock.addElement(new Integer(rs.getInt("stock")));
		}while(rs.next());
		
		totalrows = pname.size();
		totalpages = (totalrows-1)/maxrows +1;
		startrow = (where-1)*maxrows;
		endrow = startrow+maxrows-1;
		if(endrow >= totalrows)
			endrow=totalrows-1;
		totalgroup = (totalpages-1)/maxpages +1;
		if(endpage>totalpages)
			endpage=totalpages;
		for(int j=startrow;j<=endrow;j++) {
			id=((Long)keyid.elementAt(j)).longValue();
			downprice=nf.format( ((Integer)dprice.elementAt(j)).intValue() );
			switch (Integer.parseInt((String)cat.elementAt(j))){
			case 11:
				category="가구";
				break;
			case 22:
				category="전기/전자";
				break;
			case 33:
				category="부엌용품";
				break;
			case 44:
				category="의류";
				break;
			case 55:
				category="보석 및 악세사리";
				break;
			case 66:
				category="헬스기구";
				break;
			case 77:
				category="컴퓨터관련";
				break;
			case 88:
				category="기타";
				break;
			default:
				break;
			}
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=5% bgcolor=#eeeeee>");
      out.print((j+1) );
      out.write("</th>\r\n");
      out.write("\t\t\t\t<td width=25% bgcolor=#eeeeee><a href=\"product_read.jsp?id=");
      out.print(id );
      out.write("&go=");
      out.print(where );
      out.write("&cat=");
      out.print(ca );
      out.write("&pname=");
      out.print(pn );
      out.write('"');
      out.write('>');
      out.print(pname.elementAt(j) );
      out.write("</a></td>\r\n");
      out.write("\t\t\t\t<td width=10% bgcolor=#eeeeee>");
      out.print(id );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=15% bgcolor=#eeeeee>");
      out.print(sname.elementAt(j) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=10% bgcolor=#eeeeee>");
      out.print(inputdate.elementAt(j) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=10% bgcolor=#eeeeee align=right>");
      out.print(downprice );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=10% bgcolor=#eeeeee align=right>");
      out.print(stock.elementAt(j) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=10% bgcolor=#eeeeee>");
      out.print(category );
      out.write("</td>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t");

		}
		rs.close();
		
      out.write("\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t");
 
		st.close();
		con.close();
		}
}catch(SQLException e){
	out.println(e);
}

if(wheregroup  > 1) {
	
      out.write("\r\n");
      out.write("\t[<a href=\"product_list.jsp?gogroup=1&cat");
      out.print(ca );
      out.write("&pname=");
      out.print(pn );
      out.write("\">처음</a>]\r\n");
      out.write("\t[<a href=\"product_list.jsp?gogroup=");
      out.print(priorgroup );
      out.write("&cat");
      out.print(ca );
      out.write("&pname=");
      out.print(pn );
      out.write("\">이전</a>]\r\n");
      out.write("\t");
 
}else {
	out.println("[처음]");
	out.println("[이전]");
}

if(totalrows != 0) {
	for(int jj=startpage; jj<=endpage; jj++){
		if(jj==where)
			out.println("["+jj+"]");
		else {
      out.write("\r\n");
      out.write("\t\t\t[<a href=\"product_list.jsp?go=");
      out.print(jj );
      out.write("&cat=");
      out.print(ca );
      out.write("&pname=");
      out.print(pn );
      out.write('"');
      out.write('>');
      out.print(jj );
      out.write("</a>]\r\n");
	}
	}
}

if(wheregroup < totalgroup) { 
      out.write("\r\n");
      out.write("\t[<a href=\"profuct_list.jsp?gogroup=");
      out.print(nextgroup );
      out.write("&cat=");
      out.print(ca );
      out.write("&pname=");
      out.print(pn );
      out.write("\">다음</a>]\t\r\n");
      out.write("\t[<a href=\"profuct_list.jsp?gogroup=");
      out.print(totalgroup );
      out.write("&cat=");
      out.print(ca );
      out.write("&pname=");
      out.print(pn );
      out.write("\">마지막</a>]\t\r\n");
      out.write("\r\n");
 
}else {
	out.println("[다음]");
	out.println("[마지막]");
}

out.println("전체상품수 : "+totalrows);



      out.write("\r\n");
      out.write("</center>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}