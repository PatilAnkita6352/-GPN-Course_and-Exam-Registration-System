package org.apache.jsp.Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import beans.Student_data;
import java.util.ListIterator;
import mainController.AdminCon;
import java.util.List;

public final class examRegReset_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Controller/../views/headerforallPanel.jsp");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Exam Registration Reset</title>\n");
      out.write("         <link rel=\"stylesheet\" type=\"text/css\" href=\"../assets/css/bootstrap.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 String user=((String)session.getAttribute("admin_user"));
            if(!user.equals("admin"))
            {
               response.sendRedirect("../index.jsp");
            }
            else
           { 
          
      out.write("\n");
      out.write("           ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("         <link rel=\"stylesheet\" type=\"text/css\" href=\"../../assets/css/bootstrap.min.css\">  \n");
      out.write("        <title>Header</title>\n");
      out.write("        \n");
      out.write("            \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <!-- navbar start -->        \n");
      out.write("<nav class=\"navbar navbar-inverse\">  \n");
      out.write("    <div class=\"navbar-collapse\">\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row\"> \n");
      out.write("                <div class=\"pull-right\">\n");
      out.write("                    <div class=\"navbar-header\">\n");
      out.write("                        <a class=\"navbar-brand\" href=\"../logout.jsp\">Logout</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"pull-right\"> \n");
      out.write("                    <div class=\"navbar-header\">\n");
      out.write("                        <a class=\"navbar-brand\" href=\"../home.jsp\">Home</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div> \n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</nav> \n");
      out.write("        <div class=\"container\">\n");
      out.write("<!-- navbar end -->\n");
      out.write("    \n");
      out.write("\n");
      out.write("        ");

        
          String roll_no=request.getParameter("rollno");
          List list=AdminCon.studentDetails(roll_no);
         
          if(list!=null) 
           {
                ListIterator lit=list.listIterator();
               Student_data c;
                while(lit.hasNext()) {
                c=(Student_data)lit.next();
          
      out.write("\n");
      out.write("          <div class=\"container\">\n");
      out.write("              <h1>Student Information</h1><br>\n");
      out.write("              \n");
      out.write("              <h4><label>Roll number :</label> ");
      out.print( c.getRollno());
      out.write("<br><br>\n");
      out.write("        \n");
      out.write("                  <label>Name :</label> ");
      out.print( c.getS_name());
      out.write("<br><br>\n");
      out.write("                  <label>Branch :</label> ");
      out.print( c.getProgramme());
      out.write("<br><br>\n");
      out.write("                  <label>Phone Number :</label> ");
      out.print( c.getPhone_no());
      out.write("<br><br></h4>\n");
      out.write("    \n");
      out.write("\n");
      out.write("             ");
 }
             String path="./examReset.jsp?roll_no="+request.getParameter("rollno");
        
      out.write("\n");
      out.write("          \n");
      out.write("          <form action=\"./examReset.jsp\" method=\"POST\">\n");
      out.write("               <button type=\"submit\" class=\"btn btn-danger\" formaction=\"");
      out.print(path);
      out.write("\">Reset</button>\n");
      out.write("           </form>\n");
      out.write("          </div>\n");
      out.write("           ");
} else
                {
                     response.sendRedirect("../views/Admin/examRegReset.jsp?failResult=Record is not present");
                }
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
