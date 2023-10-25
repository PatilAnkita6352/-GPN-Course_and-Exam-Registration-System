package org.apache.jsp.Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import SessionFact.SessionFact;
import java.util.ListIterator;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import beans.Hod_data;
import org.hibernate.Query;
import beans.Courses;
import java.util.List;
import mainController.CourseCon;

public final class selectCourses_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/Controller/../headerforallPanel.jsp");
    _jspx_dependants.add("/Controller/../footer.jsp");
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
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../assets/css/bootstrap.min.css\">\n");
      out.write("        <title>Select Courses</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       \n");
      out.write("           \n");
      out.write("        ");
  
           String uname=((String)session.getAttribute("hod_uname"));
            if(uname.equals(null))
            {
               response.sendRedirect("hodLoginForm.jsp");
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
      out.write("                        <a class=\"navbar-brand\" href=\"../../logout.jsp\">Logout</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"pull-right\"> \n");
      out.write("                    <div class=\"navbar-header\">\n");
      out.write("                        <a class=\"navbar-brand\" href=\"../../home.jsp\">Home</a>\n");
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
      out.write("          \n");
      out.write("           <div class=\"container\">\n");
      out.write("                <h2>Offer courses</h2>\n");
      out.write("        <br>");
 String result=request.getParameter("result");
            try{if(!result.equals(null)){ 
      out.write(" <p class=\"text-success\">");
      out.print( result );
      out.write("</p> ");
 }}catch(Exception e){} 
      out.write("<br>\n");
      out.write("    <center>\n");
      out.write("        ");

                    String year=request.getParameter("year");
                    String term=request.getParameter("term");
                   //return the list of courses to be offer for registration
                    List l=CourseCon.getCourses(year,uname,term);
                    if(l.size()==0)
                    {
                    response.sendRedirect("../views/HOD/offerCourseForm.jsp?wrongResult=No courses available");
                    }
                    else
                    {
        
      out.write("\n");
      out.write("        <form action=\"saveOfferCourses.jsp\" method=\"POST\">\n");
      out.write("        <table border=\"1\" class=\"table\">\n");
      out.write("            <thead>\n");
      out.write("            <th>Sr.no</th>\n");
      out.write("            <th>Select Course</th>\n");
      out.write("            <th>Course Code</th>\n");
      out.write("            <th>Course Name</th>\n");
      out.write("            <th>Curriculum</th>\n");
      out.write(" \n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                \n");
      out.write("                ");
 
                    Courses c=new Courses();  
                    int i=0;
                    for(Object obj:l)
                    {
                        c=(Courses)obj;
                    
      out.write("\n");
      out.write("                     <tr>\n");
      out.write("                    <td>");
      out.print(++i);
      out.write("</td>\n");
      out.write("                    <td><input type=\"checkbox\" name=\"course[]\" value=\"");
      out.print( c.getCourse_code() );
      out.write("\" onchange=\"onBtn()\"></td>\n");
      out.write("                    <td>");
 out.print(c.getCourse_code()); 
      out.write("</td>\n");
      out.write("                    <td>");
 out.print(c.getCourse_name()); 
      out.write("</td>\n");
      out.write("                    <td>");
 out.print(c.getCurriculum());
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                        ");

                         }
        
      out.write("\n");
      out.write("         </tbody>\n");
      out.write("        </table>\n");
      out.write("         <a name=\"checkAll\" class=\"btn btn-primary\"  onclick=\"checkAll()\">Check All</a>\n");
      out.write("         <button class=\"btn btn-primary\" id=\"offer\">Offer</button>\n");
      out.write("        </form>\n");
      out.write("    </center>\n");
      out.write("    ");
  
        }
    }
    
      out.write("\n");
      out.write("    ");
      out.write("\n");
      out.write("</div>\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/js/jquery.min.js\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/js/bootstrap.js\">\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("           </div>\n");
      out.write("           <script type=\"text/javascript\">\n");
      out.write("                var courses=new Array();\n");
      out.write("                var ischecked=false;\n");
      out.write("                //Reading the available course array into javascript array named courses.\n");
      out.write("                courses=document.getElementsByName(\"course[]\");\n");
      out.write("                \n");
      out.write("                //Checking if any checkbox is checked to enable the save and register buttons.\n");
      out.write("                for(var i=0;i<courses.length;i++)\n");
      out.write("                {\n");
      out.write("                        if(courses[i].checked)\n");
      out.write("                        {\n");
      out.write("                                ischecked=true;\n");
      out.write("                                break;\n");
      out.write("                        }\n");
      out.write("                }\n");
      out.write("                document.getElementById('offer').disabled=!ischecked;\n");
      out.write("                \n");
      out.write("            \n");
      out.write("            function onBtn() \n");
      out.write("            {\n");
      out.write("                    var courses=new Array();\n");
      out.write("                    var ischecked=false; \n");
      out.write("                    courses=document.getElementsByName(\"course[]\");\n");
      out.write("                    for(var i=0;i<courses.length;i++)\n");
      out.write("                    {\n");
      out.write("                            if(courses[i].checked)\n");
      out.write("                            {\n");
      out.write("                                    ischecked=true;\n");
      out.write("                                    break;\n");
      out.write("                            }\n");
      out.write("                    }\n");
      out.write("                    document.getElementById('offer').disabled=!ischecked;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            function checkAll()\n");
      out.write("            {\n");
      out.write("                var count=0,flag=false;        \n");
      out.write("                for(var i=0;i<courses.length;i++)\n");
      out.write("                {\n");
      out.write("                    if(courses[i].checked==true)\n");
      out.write("                        count++;\n");
      out.write("                } \n");
      out.write("                if(count==courses.length)\n");
      out.write("                    flag=false;\n");
      out.write("                else\n");
      out.write("                    flag=true;\n");
      out.write("                for(var i=0;i<courses.length;i++)\n");
      out.write("                {\n");
      out.write("                    courses[i].checked=flag; \n");
      out.write("                }\n");
      out.write("                onBtn();\n");
      out.write("            }\n");
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
