/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.35
 * Generated at: 2016-06-23 06:42:21 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.chap10;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class freeboard_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=EUC-KR\">\r\n");
      out.write("<link href=\"filegb.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("function check(){\r\n");
      out.write("\twith(document.msgsearch){\r\n");
      out.write("\t\tif(sval.value.length==0){\r\n");
      out.write("\t\t\talert(\"검색어를 입력해 주세요.?!!\");\r\n");
      out.write("\t\t\tsval.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tdocument.msgsearch.submit();\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function rimgchg(p1, p2){\r\n");
      out.write("\tif(p2==1)\r\n");
      out.write("\t\tdocument.images[p1].src = \"image/open.gif\";\r\n");
      out.write("\telse\r\n");
      out.write("\t\tdocument.images[p1].src = \"image/arrow.gif\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function imgchg(p1,p2) {\r\n");
      out.write("\tif(p2==1)\r\n");
      out.write("\t\tdocument.images[p1].src = \"image/open.gif\";\r\n");
      out.write("\telse\r\n");
      out.write("\t\tdocument.images[p1].src = \"image/close.gif\";\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<title>게시판</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<p>\r\n");
      out.write("<p align=center><font color=#0000ff face=굴림 size=3><strong>자유 게시판</strong></font></p>\r\n");
      out.write("<p>\r\n");
      out.write("<center>\r\n");
      out.write("\t<table border=0 width=600 cellpadding=4 cellspacing=0>\r\n");
      out.write("\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t<td colspan=\"5\" height=\"1\" bgcolor=\"#1F4F8F\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr align=\"center\" bgcolor=\"#87E8FF\">\r\n");
      out.write("\t\t\t<td width=\"42\" bgcolor=\"#DFEDFF\"><font size=\"2\">번호</font></td>\r\n");
      out.write("\t\t\t<td width=\"340\" bgcolor=\"#DFEDFF\"><font size=\"2\">제목</font></td>\r\n");
      out.write("\t\t\t<td width=\"84\" bgcolor=\"#DFEDFF\"><font size=\"2\">등록자</font></td>\r\n");
      out.write("\t\t\t<td width=\"78\" bgcolor=\"#DFEDFF\"><font size=\"2\">날짜</font></td>\r\n");
      out.write("\t\t\t<td width=\"49\" bgcolor=\"#DFEDFF\"><font size=\"2\">조회</font></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t<td colspan=\"5\" bgcolor=\"#1F4F8F\" height=\"1\"></td>\r\n");
      out.write("\t\t</tr>\r\n");


Vector name=new Vector();
Vector email=new Vector();
Vector inputdate=new Vector();
Vector subject=new Vector();
Vector rcount=new Vector();

Vector step=new Vector();
Vector keyid=new Vector();

int where=1;
int totalgroup = 0;
int maxpages=2;
int startpage=1;
int endpage=startpage+maxpages-1;
int wheregroup=1;
if(request.getParameter("go") != null){
		where = Integer.parseInt(request.getParameter("go"));
		wheregroup = (where-1)/maxpages +1;
		startpage = (wheregroup-1)*maxpages+1;
		endpage = startpage+maxpages-1;
} else if(request.getParameter("gogroup") != null) {
	wheregroup = Integer.parseInt(request.getParameter("gogroup"));
	startpage=(wheregroup-1) * maxpages+1;
	where =startpage;
	endpage=startpage+maxpages-1;
}
int nextgroup = wheregroup+1;
int priorgroup = wheregroup-1;
int nextpage=where+1;
int priorpage = where-1;
int startrow=0;
int endrow=0;
int maxrows=5;
int totalrows=0;
int totalpages=0;

int id=0;


String em=null;
Connection con=null;
Statement st = null;
ResultSet rs = null;

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

try{
	st=con.createStatement();
	String sql = "select * from freeboard order by";
	sql = sql + " masterid desc, replynum, step, id";
	rs = st.executeQuery(sql);
	
	if(!(rs.next())) {
		out.println("게시판에 올린 글이 없습니다.");
	} else {
		do{
			keyid.addElement(new Integer(rs.getInt("id")));
			name.addElement(rs.getString("name"));
			email.addElement(rs.getString("email"));
			String idate = rs.getString("inputdate");
			idate = idate.substring(0,8);
			inputdate.addElement(idate);
			subject.addElement(rs.getString("subject"));
			rcount.addElement(new Integer(rs.getInt("readcount")));
			step.addElement(new Integer(rs.getInt("step")));
		}while(rs.next());
		totalrows = name.size();
		totalpages = (totalrows-1)/maxrows+1;
		startrow=(where-1)*maxrows;
		endrow=startrow+maxrows-1;
		if(endrow >= totalrows)
			endrow=totalrows-1;
		totalgroup = (totalpages-1)/maxpages +1;
		if(endpage > totalpages)
			endpage=totalpages;
		
		for(int j=startrow; j<=endrow; j++){
				String temp= (String)email.elementAt(j);
				if((temp == null) || (temp.equals("")))
					em =(String)name.elementAt(j);
				else
					em ="<a href=mailto:" + temp + ">" + name.elementAt(j) + "</a>";
				
					id = totalrows-j;
					
					if(j%2 ==0){

      out.write("\r\n");
      out.write("\t\t<tr onMouseOver=\"bgColor='#DFEDFF'\" onMouseOut=\"bgColor=''\">\r\n");

					}else{

      out.write("\r\n");
      out.write("\t\t<tr onMouseOver=\"bgColor='#DFEDFF'\" onMouseOut=\"bgColor=''\"> \r\n");
} 
      out.write("\r\n");
      out.write("\t\t\t<td align=center>");
      out.print(id );
      out.write("</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t");

			int stepi=((Integer)step.elementAt(j)).intValue();
			int imgcount = j-startrow;
			if(stepi > 0) {
				for(int count=0;count <stepi;count++)
					out.print("&nbsp;&nbsp;");
				out.println("<img name=icon"+imgcount+" src=image/arrow.gif>");
				out.print("<a href=freeboard_read.jsp?id=");
				out.print(keyid.elementAt(j)+"&page="+where);
				out.print(" onmouseover=\"rimgchg("+imgcount+",1)\"");
				out.print(" onmouseout=\"rimgchg("+imgcount+",2)\">");
			}	else {
				out.println("<img name=icon"+imgcount+" src=image/close.gif>");
				out.print("<a href=freeboard_read.jsp?id=");
				out.print(keyid.elementAt(j) + "&page=" + where );
				out.print(" onmouseover=\"imgchg("+imgcount+",1)\"");
				out.print(" onmouseout=\"imgchg("+imgcount+",2)\">");
			}
			out.println(subject.elementAt(j)+"</td>");
			
      out.write("\r\n");
      out.write("\t\t\t<td align=center>");
      out.print(em );
      out.write("</td>\r\n");
      out.write("\t\t\t<td align=center>");
      out.print(inputdate.elementAt(j) );
      out.write("</td>\r\n");
      out.write("\t\t\t<td align=center>");
      out.print(rcount.elementAt(j) );
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");

		
	}
	rs.close();
	}
	out.println("</table>");
	st.close();
	con.close();
} catch (SQLException e) {
	out.println(e);
}
if(wheregroup > 1) {
	out.println("[<a href=freeboard_list.jsp?gogroup=1>처음</a>]");
	out.println("[<a href=freeboard_list.jsp?gogroup="+priorgroup+">이전</a>]");
} else {
	out.println("[처음]");
	out.println("[이전]");
}
 if (name.size() !=0) { 
for(int jj=startpage; jj<=endpage; jj++){
	if(jj==where)
		out.println("["+jj+"]");
	else
		out.println("[<a href=freeboard_list.jsp?go="+jj+">"+ jj +"</a>]");
}
 }
if(wheregroup < totalgroup) {
	out.println("[<a href=freeboard_list.jsp?gogroup="+nextgroup+">다음</a>]");
	out.println("[<a href=freeboard_list.jsp?gogroup="+totalgroup+">마지막</a>]");
} else {
	out.println("[다음]");
	out.println("[마지막]");
}

out.println("전체 글수 : " + totalrows);


      out.write("\r\n");
      out.write("<!-- <table border=0 width=600 cellpadding=0 cellspacing=0>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=right valign=bottom>\r\n");
      out.write("\t\t\t<a href=\"freeboard_write.html\"><img src=\"image/write.gif\" width=\"66\" height=\"21\" border=0></a>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table> -->\r\n");
      out.write("<form method=\"post\" name=\"msgsearch\" action=\"freeboard_search.jsp\">\r\n");
      out.write("<table border=0 width=600 cellpadding=0 cellspacing=0>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=\"right\" width=\"241\">\r\n");
      out.write("\t\t\t<select name=stype>\r\n");
      out.write("\t\t\t\t<option value=1 >이름\r\n");
      out.write("\t\t\t\t<option value=2 >제목\r\n");
      out.write("\t\t\t\t<option value=3 >내용\r\n");
      out.write("\t\t\t\t<option value=4 >이름+제목\r\n");
      out.write("\t\t\t\t<option value=5 >이름+내용\r\n");
      out.write("\t\t\t\t<option value=6 >제목+내용\r\n");
      out.write("\t\t\t\t<option value=7 >이름+제목+내용\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t<td width=\"127\" align=\"center\">\r\n");
      out.write("\t\t\t<input type=text size=17 name=sval>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t<td width=\"115\">&nbsp;<a href=\"#\" onClick=\"check();\"><img src=\"image/search.gif\" border=0 align='center'></a></td>\r\n");
      out.write("\t\t<td align=right valign=bottom width=117><a href=\"freeboard_write.html\"><img src=\"image/write.gif\" border=\"0\"></a></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
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