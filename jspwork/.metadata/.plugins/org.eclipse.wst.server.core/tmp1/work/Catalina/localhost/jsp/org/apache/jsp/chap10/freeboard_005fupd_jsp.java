/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.35
 * Generated at: 2016-06-22 05:39:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.chap10;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class freeboard_005fupd_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!--\r\n");
      out.write("function check(){\r\n");
      out.write("\twith(document.msgwrite){\r\n");
      out.write("\t\tif(subject.value.length == 0){\r\n");
      out.write("\t\t\talert(\"제목을 입력 해주세요!!\");\r\n");
      out.write("\t\t\tsubject.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(name.value.length == 0){\r\n");
      out.write("\t\t\talert(\"이름을 입력 해주세요!!\");\r\n");
      out.write("\t\t\tname.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(password.value.length == 0){\r\n");
      out.write("\t\t\talert(\"비밀번호을 입력 해주세요!!\");\r\n");
      out.write("\t\t\tpassword.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(content.value.length == 0){\r\n");
      out.write("\t\t\talert(\"내용을 입력 해주세요!!\");\r\n");
      out.write("\t\t\tcontent.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tdocument.msgwrite.submit();\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("//-->\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<p>\r\n");

String sql=null;
Connection con=null;
PreparedStatement st=null;
ResultSet rs = null;
int cnt=0;
int id = Integer.parseInt(request.getParameter("id"));
String p= request.getParameter("page");

try {
	Class.forName("org.gjt.mm.mysql.Driver");
}catch (ClassNotFoundException e){
	out.println(e);
}

try {
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fboard?useUnicode=true&characterEncoding=euckr", "root", "apmsetup");
} catch(SQLException e) {
	out.println(e);
}

try {
	sql="select * from freeboard where id=? ";
	st = con.prepareStatement(sql);
	st.setInt(1, id);
	rs = st.executeQuery();
	if(!(rs.next())) {
		out.println("해당 내용이 없습니다.");
	} else {


      out.write("\r\n");
      out.write("\r\n");
      out.write("<form name=\"msgwrite\" method=post action=\"freeboard_upddb.jsp?id=");
      out.print(id );
      out.write("&page=");
      out.print(p );
      out.write("\">\r\n");
      out.write("\t<table width=\"600\" cellspacing=\"0\" cellpadding=\"2\" align=\"center\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"2\" bgcolor=\"#1f4f8f\" height=\"1\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"2\" bgcolor=\"#dfedff\" height=\"20\" class=\"notice\">&nbsp;&nbsp;<font size=\"2\">글 수정하기</font></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"2\" bgcolor=\"#1f4f8f\" height=\"1\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"124\" height=\"30\" align=\"center\" bgcolor=\"#f4f4f4\">이  름</td>\r\n");
      out.write("\t\t\t<td width=\"494\" style=\"padding:0 0 0 10\">\r\n");
      out.write("\t\t\t\t<input type=text name=name value=\"");
      out.print(rs.getString("name"));
      out.write("\" class= \"input_style1\">\r\n");
      out.write("\t\t\t</td> \r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"124\" align=\"center\" bgcolor=\"#f4f4f4\">E-mail</td>\r\n");
      out.write("\t\t\t<td width=\"494\" style=\"padding:0 0 0 10\" height=\"25\">\r\n");
      out.write("\t\t\t\t<input type=text name=email value=\"");
      out.print(rs.getString("email"));
      out.write("\" class= \"input_style1\">\r\n");
      out.write("\t\t\t</td> \r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"124\" align=\"center\" bgcolor=\"#f4f4f4\">제  목</td>\r\n");
      out.write("\t\t\t<td width=\"494\" style=\"padding:0 0 0 10\" height=\"25\">\r\n");
      out.write("\t\t\t\t<input type=text name=subject size=60 value=\"");
      out.print(rs.getString("subject"));
      out.write("\" class= \"input_style2\">\r\n");
      out.write("\t\t\t</td> \r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"124\" height=\"162\" align=\"center\" valign=\"tob\" bgcolor=\"#f4f4f4\" style=\"padding-top:7;\">내  용</td>\r\n");
      out.write("\t\t\t<td width=\"494\" valign=\"top\" style=\"padding:5 0 5 10\">\r\n");
      out.write("\t\t\t\t<textarea rows=\"10\" cols=\"65\" name=content class=\"textarea_style1\">");
      out.print(rs.getString("content") );
      out.write(" </textarea>\r\n");
      out.write("\t\t\t</td> \r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"124\" align=\"center\" bgcolor=\"#f4f4f4\">암  호</td>\r\n");
      out.write("\t\t\t<td width=\"494\" style=\"padding:0 0 0 10\" height=\"25\" >\r\n");
      out.write("\t\t\t\t<input type=password name=password class= \"input_style1\"><br>(정확한 비밀번호를 입력해야만 수정이 됩니다.)\r\n");
      out.write("\t\t\t</td> \r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"2\" height=\"1\" class=\"button\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"2\" height=\"1\" bgcolor=\"#1f4f8f\" ></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"2\" height=\"10\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"2\" align=\"right\">\r\n");
      out.write("\t\t\t\t<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" >\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"64%\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"12%\"><a href=\"#\" onClick=\"check();\"><img src=\"image/ok.gif\" border=\"0\"></a></td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"12%\"><a href=\"#\" onClick=\"history.go(-1)\"><img src=\"image/cancle.gif\" border=\"0\"></a></td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"12%\"><a href=\"#\" onClick=\"freeboard_list.jsp?go=");
      out.print(request.getParameter("page") );
      out.write("\"><img src=\"image/list.jpg\" border=\"0\"></a></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");

	}
	rs.close();
	st.close();
	con.close();
}catch (SQLException e) {
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