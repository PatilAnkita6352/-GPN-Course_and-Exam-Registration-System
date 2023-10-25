package org.apache.jsp.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class studRegForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Student Register</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <!-- This form is not in use -->\n");
      out.write("        \n");
      out.write("        ");
if(session.getAttribute("uname")==null || session.getAttribute("user")==null){
            response.sendRedirect("../index.jsp");
        }else{
        
      out.write("\n");
      out.write("       <form action=\"../Controller/studReg.jsp\" method=\"post\">\n");
      out.write("            Roll no : <input type=\"number\" name=\"rollno\">\n");
      out.write("            <br><br>\n");
      out.write("            name : <input type=\"text\" name=\"s_name\">\n");
      out.write("            <br><br>\n");
      out.write("            Date of Birth : <input type=\"date\" name=\"dob\"/>\n");
      out.write("            <br><br>\n");
      out.write("            Phone no. : <input type=\"number\" name=\"phone_no\"/>\n");
      out.write("            <br><br>\n");
      out.write("            Username : <input type=\"text\" name=\"username\">\n");
      out.write("            <br><br>\n");
      out.write("            Password : <input type=\"password\" name=\"password\">\n");
      out.write("            <br><br>\n");
      out.write("            Branch : <input type=\"text\" name=\"programme\">\n");
      out.write("            <br><br>\n");
      out.write("            Email : <input type=\"text\" name=\"s_email\"><br><br>\n");
      out.write("            <br><br>\n");
      out.write("            <input type=\"submit\" value=\"submit\">  \n");
      out.write("        </form>\n");
      out.write("       ");
}
       
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
