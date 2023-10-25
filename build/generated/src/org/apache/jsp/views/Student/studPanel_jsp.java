package org.apache.jsp.views.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import mainController.AdminCon;
import mainController.HodCon;
import java.text.SimpleDateFormat;
import beans.Course_reg;
import mainController.StudCon;
import beans.Student_data;
import beans.Courses;
import java.util.*;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.hibernate.Session;

public final class studPanel_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js\"></script>\n");
      out.write("        <script src=\"ajax\"></script>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Student Panel</title>\n");
      out.write("        \n");
      out.write("       \n");
      out.write("     <script src=\"../../assets/js/jquery1.min.js\"></script>\n");
      out.write("     <script src=\"../../assets/js/bootstrap1.min.js\"></script>\n");
      out.write("     \n");
      out.write("          <style>\n");
      out.write("            p{\n");
      out.write("                text-height: 20;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("     ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../headerforallPanelviews.jsp", out, false);
      out.write("\n");
      out.write("         ");
 
             session.setAttribute("profilepanel","studpanel");
            if(session.getAttribute("stud_uname")==null || session.getAttribute("stud_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("stud_user").equals("student")) 
           {   
                Student_data stud=(Student_data)StudCon.getStudentInfo((String)session.getAttribute("stud_uname"));
              
                
      out.write("\n");
      out.write("                <br><div class=\"container\">");
 
                     try{
            if(!(request.getParameter("result").equals(null))){
      out.write("\n");
      out.write("            <div class=\"row\"><div class=\"col-lg-8\"> <p class=\"alert alert-success\"> <a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>");
out.print(request.getParameter("result"));
      out.write("</p></div></div>\n");
      out.write("            ");
}
                }catch(Exception e){}
              try{
            if(!(request.getParameter("wrongResult").equals(null))){
      out.write("\n");
      out.write("            <div class=\"row\"><div class=\"col-lg-8\"> <p class=\"alert alert-danger\"><a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>");
out.print(request.getParameter("wrongResult"));
      out.write("</p></div></div>\n");
      out.write("            ");
}
                }catch(Exception e){}
                
        
      out.write("</div> \n");
      out.write("                <h2>Welcome ");
      out.print(stud.getS_name());
      out.write("</h2>\n");
      out.write("                <hr><br>\n");
      out.write("    <marquee style=\"background:gray;color: white\"width=\"100%\">");
try{if(!AdminCon.getNotice().equals(null)){out.print(AdminCon.getNotice());}}catch(Exception e){}
      out.write("</marquee><br>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-lg-6\">\n");
      out.write("                <div class=\"panel panel-primary\">\n");
      out.write("                    <div class=\"panel-heading\">\n");
      out.write("                <h4><u>Student details</u></h4>\n");
      out.write("                    </div>\n");
      out.write("                     <div class=\"panel-body\">\n");
      out.write("                <p> \n");
      out.write("                <font size=\"4\">  \n");
      out.write("                    Roll No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:");
      out.print(stud.getRollno());
      out.write("<br>\n");
      out.write("                    Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:");
      out.print(stud.getS_name());
      out.write("<br>\n");
      out.write("                    Programme &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:");
      out.print(stud.getProgramme());
      out.write("<br>\n");
      out.write("                    Term &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:");
      out.print(stud.getTerm());
      out.write("<br>\n");
      out.write("                    Year &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:");
      out.print(stud.getYear());
      out.write("<br>\n");
      out.write("                    Phone Number&nbsp;&nbsp;:");
      out.print(stud.getPhone_no());
      out.write("<br>\n");
      out.write("                    Email &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:");
      out.print(stud.getS_email());
      out.write("\n");
      out.write("                </font>\n");
      out.write("                </p> \n");
      out.write("                     </div>\n");
      out.write("                    </div>\n");
      out.write("                    </div>\n");
      out.write("                <div class=\"col-lg-6\">\n");
      out.write("               <div class=\"panel panel-primary\">\n");
      out.write("   \t\t\t<div class=\"panel-heading\">\n");
      out.write("   \t\t\t\t<h2>Student Panel</h2>\n");
      out.write("   \t\t\t</div>\n");
      out.write("                        <div class=\"panel-body\">\n");
      out.write("                            <form> \n");
      out.write("                                <button class=\"btn btn-primary\" formaction=\"studRegistration.jsp\">GO FOR REGISTRATION</button><br><br>\n");
      out.write("                                <button class=\"btn btn-primary\" formaction=\"editStudProfileForm.jsp\">UPDATE PROFILE</button><br><br>\n");
      out.write("                                <button class=\"btn btn-primary\" formaction=\"changeStudPwdForm.jsp\">CHANGE PASSWORD</button><br><br>\n");
      out.write("                            </form>\n");
      out.write("                        </div> \n");
      out.write("               </div>\n");
      out.write("                </div>\n");
      out.write("                </div> \n");
      out.write("               \n");
      out.write("               ");

           } 
            
      out.write("\n");
      out.write("    ");
      out.write("\n");
      out.write("</div>\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/js/jquery.min.js\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/js/bootstrap.js\">\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write(" \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("                    ");
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
