/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.35
 * Generated at: 2016-06-27 11:23:52 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.chap11;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class databoard_005fread_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>글 읽기</title>\r\n");
      out.write("<link href=\"filegb.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

String sql=null;
Connection con= null;
PreparedStatement st = null;
ResultSet rs = null;
int cnt=0;
int id = Integer.parseInt(request.getParameter("id"));
String url = "http://localhost:8080/jsp/chap11/upload/";

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
	sql = "select * from databoard where id=? ";
	st= con.prepareStatement(sql);
	st.setInt(1, id);
	rs = st.executeQuery();
	
	if(!(rs.next())) {
		out.println("해당 내용이 없습니다.");
	} else {
		String finame = rs.getString("filename");
		if((finame != null)&&(!(finame.equals("")))) {
			finame = "<a href = down.jsp?file="+finame+">"+finame+"</a>";
			finame = finame +"(" + rs.getInt("filesize") + " Bytes)";
		}
		sql = "update databoard set readcount = readcount + 1 where id= ?" ;
		st =  con.prepareStatement(sql);
		st.setInt(1,id);
		st.executeUpdate();
		sql = "select * from databoard where id=?";
		st = con.prepareStatement(sql);
		st.setInt(1, id);
		
		rs = st.executeQuery();
		rs.next();
		

      out.write("\r\n");
      out.write("\r\n");
      out.write("<table width=\"600\" cellspacing=\"0\" cellpadding=\"2\" align=\"center\" >\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td height=\"22\">&nbsp;</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr align=\"center\">\r\n");
      out.write("\t\t<td height=\"1\" bgcolor=\"#1f4f8f\" ></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr align=\"center\" bgcolor=\"#dfedff\">\r\n");
      out.write("\t\t<td class=\"button\" bgcolor=\"#dfedff\">\r\n");
      out.write("\t\t<div align=\"left\"><font size=\"2\">");
      out.print(rs.getString("subject") );
      out.write("</font></div></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr align=\"center\" bgcolor=\"#ffffff\">\r\n");
      out.write("\t\t<td align=\"center\" bgcolor=\"#f4f4f4\">\r\n");
      out.write("\t\t<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"4\" height=\"1\">\r\n");
      out.write("\t\t\t\t<tr bgcolor=\"#f4f4f4\">\r\n");
      out.write("\t\t\t\t\t<td width=\"13%\" height=\"7\"></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"38%\" height=\"7\">글쓴이: ");
      out.print(rs.getString("name") );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"38%\" height=\"7\">파일이름 : ");
      out.print(finame );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"11%\" height=\"7\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr bgcolor=\"#f4f4f4\">\r\n");
      out.write("\t\t\t\t\t<td width=\"13%\"></td>\r\n");
      out.write("\t\t\t\t\t<td width=\"51%\">작성일: ");
      out.print(rs.getString("inputdate") );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"25%\">조회: ");
      out.print(rs.getInt("readcount") );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"11%\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr align=\"center\">\r\n");
      out.write("\t\t<td bgcolor=\"#1f4f8f\" height=\"1\"></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr align=\"center\">\r\n");
      out.write("\t\t<td style=\"padding:10 0 0 0\">\r\n");
      out.write("\t\t<div align=\"left\"><br>\r\n");
      out.write("\t\t\t<font size=\"3\" color=\"#333333\"><pre>");
      out.print(rs.getString("content") );
      out.write("</pre></font>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr align=\"center\">\r\n");
      out.write("\t\t<td class=\"button\" height=\"1\">\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr align=\"center\">\r\n");
      out.write("\t\t<td bgcolor=\"#1f4f8f\" height=\"1\"></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"600\" border=\"0\" cellpadding=\"0\" cellspacing=\"5\" align=\"center\" >\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td width=\"56\"><a href=\"databoard_upd.jsp?id=");
      out.print(request.getParameter("id") );
      out.write("&page=");
      out.print(request.getParameter("page") );
      out.write("\"><img src=\"image/edit.jpg\" border=0 width=\"66\" height=\"21\"></a></td>\r\n");
      out.write("\t\t<td width=\"56\"><a href=\"databoard_del.jsp?id=");
      out.print(request.getParameter("id") );
      out.write("&page=");
      out.print(request.getParameter("page") );
      out.write("\"><img src=\"image/del.jpg\" border=0 width=\"66\" height=\"21\"></a></td>\r\n");
      out.write("\t\t<td width=\"66\"><a href=\"databoard_rwrite.jsp?id=");
      out.print(request.getParameter("id") );
      out.write("&page=");
      out.print(request.getParameter("page") );
      out.write("\"><img src=\"image/reply.jpg\" border=0 width=\"66\" height=\"21\"></a></td>\r\n");
      out.write("\t\t<td width=\"406\">&nbsp;</td>\r\n");
      out.write("\t\t<td width=\"16\"><a href=\"databoard_list.jsp?id=");
      out.print(request.getParameter("id") );
      out.write("&page=");
      out.print(request.getParameter("page") );
      out.write("\"><img src=\"image/list.jpg\" border=0 width=\"66\" height=\"21\"></a></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");

	}
	rs.close();
	st.close();
	con.close();
}catch (SQLException e){
	out.println(e);
}

      out.write("\r\n");
      out.write("\r\n");
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