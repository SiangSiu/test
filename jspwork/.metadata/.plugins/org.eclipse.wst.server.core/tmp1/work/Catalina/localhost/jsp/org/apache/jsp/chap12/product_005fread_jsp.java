/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.35
 * Generated at: 2016-07-05 05:17:01 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.chap12;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class product_005fread_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>상품 설명(이미지) 보기</title>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction view(temp) {\r\n");
      out.write("\t\tfilename = \"http://localhost:8080/jsp/chap12/upload/\" +temp;\r\n");
      out.write("\t\ti = window.open(filename, \"win\", \"height=350,width=450,toolbar=0,menubar=0, scrollbars=1, resizable=1,status=0\");\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

String ca="";
String pn="";

if(request.getParameter("cat")!=null)
	if(!(request.getParameter("cat").equals("")))
		ca=request.getParameter("cat");
if(request.getParameter("pname") != null)
	if(!(request.getParameter("pname").equals("")))
		pn=request.getParameter("pname");

String sql =null;
Connection con = null;
Statement st = null;
ResultSet rs = null;
long id = Long.parseLong(request.getParameter("id"));
 
String url = "http://localhost:8080/jsp/chap12/upload/";

String small=null;


      out.write("\r\n");
      out.write("[<a href=\"product_list.jsp?go=");
      out.print(request.getParameter("go") );
      out.write("&cat");
      out.print(ca );
      out.write("&pname=");
      out.print(pn );
      out.write("\">상품 목록으로</a>]\r\n");

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

try{
	st = con.createStatement();
	sql = "select * from product where id="+id;
	rs = st.executeQuery(sql);
	if(!(rs.next())) {
		out.println("해당 내용이 없습니다.");
	} else {
		small=url+rs.getString("small");
		
      out.write("\r\n");
      out.write("\t\t<table width=500 border=0 >\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th rowspan=3>\r\n");
      out.write("\t\t\t\t\t<a href=javaScript:view(\"");
      out.print(rs.getString("large") );
      out.write("\")>\r\n");
      out.write("\t\t\t\t\t<img width=100 height=100 src=\"");
      out.print(small );
      out.write("\">\r\n");
      out.write("\t\t\t\t\t<br>확대</a>\r\n");
      out.write("\t\t\t\t</th>\r\n");
      out.write("\t\t\t\t<th bgcolor=#003399>\r\n");
      out.write("\t\t\t\t\t<font face=굴림 color=white>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(rs.getString("pname") );
      out.write('(');
      out.print(rs.getLong("id") );
      out.write(")--작성자:");
      out.print(rs.getString("wname") );
      out.write("\r\n");
      out.write("\t\t\t\t\t</font>\r\n");
      out.write("\t\t\t\t</th>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<u>상세 설명 : </u><br>\r\n");
      out.write("\t\t\t\t\t");
      out.print(rs.getString("description") );
      out.write("\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td align=right>\r\n");
      out.write("\t\t\t\t\t제조(공급)원:");
      out.print(rs.getString("sname") );
      out.write("<br>\r\n");
      out.write("\t\t\t\t\t시중가:<strike>");
      out.print(rs.getString("price") );
      out.write("</strike>원\r\n");
      out.write("\t\t\t\t\t판매가:");
      out.print(rs.getString("downprice") );
      out.write("원\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t");

	}
	rs.close();
	st.close();
	con.close();
}catch(SQLException e) {
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
