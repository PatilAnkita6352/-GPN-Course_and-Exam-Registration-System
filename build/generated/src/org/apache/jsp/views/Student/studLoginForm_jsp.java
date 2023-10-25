package org.apache.jsp.views.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class studLoginForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/views/Student/../../footer.jsp");
  }

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
      out.write("        <title>Student Login</title>\n");
      out.write("         <link rel=\"stylesheet\" type=\"text/css\" href=\"../../assets/css/bootstrap.min.css\">\n");
      out.write("          <script src=\"../../assets/css/font-awesome.min.css\"></script>\n");
      out.write("         <script src=\"../../assets/js/jquery1.min.js\"></script>\n");
      out.write("         <script src=\"../../assets/js/bootstrap1.min.js\"></script> \n");
      out.write("     \n");
      out.write("          <style>\n");
      out.write("            p{\n");
      out.write("                text-height: 20;              \n");
      out.write("            }\n");
      out.write("            .field-icon\n");
      out.write("            {\n");
      out.write("                float:right;\n");
      out.write("                margin-left:-5px;\n");
      out.write("                margin-right:5px;\n");
      out.write("                margin-top:-16px;\n");
      out.write("                position:relative;\n");
      out.write("                z-index: 2;\n");
      out.write("                height:30px; \n");
      out.write("                width:30px;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

          try{  
        if(((String)session.getAttribute("stud_user")).equals("student") )
            response.sendRedirect("views/Student/studPanel.jsp");
          }catch(Exception e){}
            
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../headerforallPanelviews.jsp", out, false);
      out.write("\n");
      out.write("        <br><div class=\"container\">");
try{
            if(!(request.getParameter("failResult").equals(null))){
      out.write("\n");
      out.write("            <div class=\"row\"><div class=\"col-lg-8\"> <p class=\"alert alert-danger\">   <a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>");
out.print(request.getParameter("failResult"));
      out.write("</p></div></div>\n");
      out.write("            ");
}
                }catch(Exception e){}
                
        
      out.write("</div>\n");
      out.write("        <h1>Student login</h1><br>\n");
      out.write("        <form action=\"../../Controller/studLogin.jsp\" method=\"post\" >\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-3\">\n");
      out.write("                        <label>Username :</label>\n");
      out.write("                        <input type=\"text\" name=\"username\" class=\"form-control\" required oninvalid=\"this.setCustomValidity('Username is required.')\"\n");
      out.write("                                  oninput=\"this.setCustomValidity('')\" > \n");
      out.write("                    </div>\n");
      out.write("               </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("           \n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-3\">\n");
      out.write("                        <label>Password :</label> \n");
      out.write("                        <input type=\"password\" name=\"password\" id=\"password-field\" class=\"form-control\" required pattern=\".{6,}\" oninvalid=\"this.setCustomValidity('Password must be of 6 characters.')\" oninput=\"this.setCustomValidity('')\">\n");
      out.write("                        <span toggle=\"#password-field\" class=\"field-icon toggle-password\"><img class=\"field-icon\" src=\"../../Images/passwordEye.png\"></span>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("             </div>\n");
      out.write("          \n");
      out.write("            <input type=\"submit\" class=\"btn btn-primary\" value=\"Login\">\n");
      out.write("           \n");
      out.write("        </form>\n");
      out.write("        ");
      out.write("\n");
      out.write("</div>\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/js/jquery.min.js\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/js/bootstrap.js\">\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            $(\".toggle-password\").click(function(){\n");
      out.write("                $(this).toggleClass(\"fa-eye fa-eye-slash\");\n");
      out.write("                var input=$($(this).attr(\"toggle\"));\n");
      out.write("                if(input.attr(\"type\")==\"password\"){\n");
      out.write("                    input.attr(\"type\",\"text\");\n");
      out.write("                }else\n");
      out.write("                {\n");
      out.write("                    input.attr(\"type\",\"password\");\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("            });\n");
      out.write("        </script>\n");
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
