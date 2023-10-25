package org.apache.jsp.views.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import mainController.StudentCoursesCon;
import beans.StudentCourses;
import java.util.List;

public final class demo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <style>\n");
      out.write("            .disable{\n");
      out.write("                pointer-events: none;\n");
      out.write("                opacity: 0.5;\n");
      out.write("            } \n");
      out.write("        </style> \n");
      out.write("        <script>\n");
      out.write("            function show(j)\n");
      out.write("            {\n");
      out.write("                ch[j]=1000;\n");
      out.write("                document.write(\"aaaaaaaaaaaaaa\");\n");
      out.write("            } \n");
      out.write("        </script>\n");
      out.write("    </head> \n");
      out.write("    <body> \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        ");

                /*StudentCourses studCourses=StudentCoursesCon.getStudCourseResult("166126","CM6798");
                studCourses.setPracticalIsPass(true);
                out.print("OLD THEROy"+studCourses.isTheoryIsPass());
                studCourses.setTheoryIsPass(true);
                out.print("NEW THEROy"+studCourses.isTheoryIsPass());*/
                //out.print("_____________isPracticalIsPass__________________"+studCourses.isPracticalIsPass());
        
      out.write("\n");
      out.write("        \n");
      out.write("        ");

        Session s;
        SessionFactory sf;
        String rollNo="166126";String courseCode="CM6798";
    
        List li=null;
        try
        {
            sf=SessionFact.SessionFact.getSessionFact();
            s=sf.openSession();
            //System.out.print("__________________Reached to getStudCourseResult method \nRoll no. = "+rollNo+"\nCourseCode = "+courseCode);
            //li=s.createQuery("from StudentCourses where studentId=:rollNo and courseCode=:courseCode").setString("rollNo",rollNo).setString("courseCode", courseCode).list(); 
            li=s.createQuery("from StudentCourses where studentId='166126' and courseCode='CM6798'").list();//.setString("rollNo",rollNo).setString("courseCode", courseCode).list(); 
            s.close();
            //sf.close();
            
        }
        catch(Exception e){out.print("__________________getStudCourseResult() exception"+e);}
        //System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nn\n\n\n\n\n\n\n________returning from getStudCourseResult()________________");
        /*if(li.size()>0)
            return (StudentCourses)li.get(0);
        else 
            return null;*/
        try{out.print("SIZE________"+li.size());}catch(Exception e){out.println("EX__________"+e);}
        //StudentCourses a=(StudentCourses)li.get(0);
        //out.print(a.getStudentId()+"   ___________________    "+a.getCourseCode());
        //return new StudentCourses();
        
      out.write("\n");
      out.write("        \n");
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
