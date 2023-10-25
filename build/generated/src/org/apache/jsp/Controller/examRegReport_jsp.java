package org.apache.jsp.Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import mainController.AdminCon;
import beans.Admin_data;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.hibernate.Session;

public final class examRegReport_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Exam Registration Report</title>\n");
      out.write("   <link rel=\"stylesheet\" type=\"text/css\" href=\"../assets/css/bootstrap.min.css\">\n");
      out.write("   \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 String uname=((String)session.getAttribute("admin_uname"));
            if(uname.equals(null))
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

            Session s;
            Query qr;
            SessionFactory sf;
            List list1=new ArrayList();
            Admin_data ad=AdminCon.getAdminInfo();
            sf=SessionFact.SessionFact.getSessionFact();
            s=sf.openSession();
            String programme=request.getParameter("branch");
            int year=Integer.parseInt(request.getParameter("year"));
            int shift=Integer.parseInt(request.getParameter("shift"));
            
            List list=AdminCon.examRegReport(programme, shift, year, ad.getReg_term_year());
            if(list.size()!=0)
            {
            
      out.write("\n");
      out.write("             <center> <h1><u>Exam Registration Report</u></h1>\n");
      out.write("        <br><h2>\n");
      out.write("            ");

             out.println("Program is "+programme);
             
      out.write("\n");
      out.write("             <br>\n");
      out.write("             ");

             out.println("Year is "+year);
         
      out.write("\n");
      out.write("        </h2>\n");
      out.write("        <div class=\"container\">\n");
      out.write("             <table border=\"2\" class=\"table\">\n");
      out.write("            <thead>\n");
      out.write("            \n");
      out.write("            <th>Sr.no</th> \n");
      out.write("            <th>Roll_No</th>\n");
      out.write("            <th colspan=\"");
      out.print(ad.getMax_reg_courses());
      out.write("\">Course Code</th>\n");
      out.write("          \n");
      out.write("            \n");
      out.write("            </thead>\n");
      out.write("            ");
  int j=1;
     
                     for(int i=0;i<list.size();i++)
                    {
                    Query query = s.createQuery("SELECT course_code FROM Exam_reg WHERE regno =:rollno and ex_reg_year =:year and ex_reg_date=:reg_term_year and ex_exmt=:ex_exmt and ex_cancel=:ex_cancel");
                    query.setInteger("ex_exmt", 0);
                    query.setInteger("ex_cancel", 0);
                    query.setInteger("year", year);
                    query.setString("rollno",(String)list.get(i));
                    query.setString("reg_term_year", ad.getReg_term_year());
                    
                    //query.list() will give all course code that are registered of that roll number.
                    list1=query.list();
                  
            
      out.write("\n");
      out.write("                \n");
      out.write("                <tr> \n");
      out.write("                \n");
      out.write("                <td>");
      out.print( j++);
      out.write("</td>\n");
      out.write("               \n");
      out.write("                <td>");
      out.print(list.get(i));
      out.write("</td>\n");
      out.write("                ");
for( int j1=0;j1<list1.size();j1++)
                {
                
      out.write("\n");
      out.write("                  <td>");
      out.print(list1.get(j1));
      out.write("</td> \n");
      out.write("                \n");
      out.write("                ");
}
      out.write("\n");
      out.write("   \n");
      out.write("                </tr> \n");
      out.write("             \n");
      out.write("                ");
}
      out.write("\n");
      out.write("\n");
      out.write("        </table> \n");
      out.write("        </div>\n");
      out.write("    ");
}
    else
    {
        response.sendRedirect("../views/Admin/examRegReport.jsp?failResult=record not found");
    }}
    
      out.write("\n");
      out.write("    </center>\n");
      out.write("            \n");
      out.write("           \n");
      out.write("       \n");
      out.write("   \n");
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
