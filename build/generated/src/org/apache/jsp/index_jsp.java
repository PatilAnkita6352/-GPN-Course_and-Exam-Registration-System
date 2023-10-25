package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Registration System</title>\n");
      out.write("       <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"//use.fontawesome.com/releases/v5.0.7/css/all.css\">\n");
      out.write("        <script src=\"../../assets/js/jquery1.min.js\"></script>\n");
      out.write("        <script src=\"../../assets/js/bootstrap1.min.js\"></script>\n");
      out.write("       \n");
      out.write("\n");
      out.write("<style>\n");
      out.write("\n");
      out.write("/*assign full width inputs*/\n");
      out.write("input[type=text]{\n");
      out.write("width: 100%;\n");
      out.write("padding: 12px 20px;\n");
      out.write("margin: 8px 0;\n");
      out.write("display: inline-block;\n");
      out.write("border: 1px solid #ccc;\n");
      out.write("box-sizing: border-box;\n");
      out.write("}\n");
      out.write("input[type=password]{\n");
      out.write("width: 100%;\n");
      out.write("padding: 12px 20px;\n");
      out.write("margin: 8px 0;\n");
      out.write("display: inline-block;\n");
      out.write("border: 1px solid #ccc;\n");
      out.write("box-sizing: border-box;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("body {\n");
      out.write(" background-image: url('Images/indexbackground.jpeg');\n");
      out.write("  background-repeat: no-repeat;\n");
      out.write("  background-size: 100% 100%;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("/*set a style for the buttons*/\n");
      out.write("button {\n");
      out.write("background-color:#4CAF50;\n");
      out.write("color: white;\n");
      out.write("padding: 14px 20px;\n");
      out.write("margin: 8px 0;\n");
      out.write("border: none;\n");
      out.write("cursor: pointer;\n");
      out.write("width: 100%;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* set a hover effect for the button*/\n");
      out.write("button:hover {\n");
      out.write("background-color:#ccc ;\n");
      out.write("                color:black;\n");
      out.write("opacity: 0.8;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".container {\n");
      out.write("            height: 500px;\n");
      out.write("            width: 350px;\n");
      out.write("            margin: 30px 400px 100px 400px;\n");
      out.write("            padding : 50px 150px 190px 150px;\n");
      out.write("            text-align: left;\n");
      out.write("            background-color:#001a33;\n");
      out.write("            color: white;  \n");
      out.write(" \n");
      out.write("}\n");
      out.write(".invalid-alert{\n");
      out.write("    border-radius: 20px;\n");
      out.write("    margin:10px 420px 10px 420px ;\n");
      out.write("    background-color:#ffcccc;\n");
      out.write("    font-size:20px;\n");
      out.write("    padding:20px 0px 20px 20px;\n");
      out.write("    color:#ff3333;\n");
      out.write("    \n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write(".wrapper {\n");
      out.write("    position: relative;\n");
      out.write("}\n");
      out.write("i.fa-eye {\n");
      out.write("      position: absolute;\n");
      out.write("      top: 18px; left: 320px;\n");
      out.write("      color: black;\n");
      out.write("      font-size:19px\n");
      out.write("}\n");
      out.write("i.fa-eye-slash {\n");
      out.write("     position: absolute;\n");
      out.write("     top: 18px;\n");
      out.write("     left: 320px;\n");
      out.write("     color: black;\n");
      out.write("     font-size:19px;\n");
      out.write("}\n");
      out.write("</style> </head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<h1 style=\"text-align: center;background-color: white;padding: 0px 50px 0px 50px; font-size: 60px;\"><img src=\"Images/logo.png\"  alt=\"Image is unavailable\"></center></h1>\n");
      out.write(" ");
  try{
            if(!request.getParameter("failResult").equals(null))
      out.write("\n");
      out.write("<div class=\"invalid-alert\" >");
out.print(request.getParameter("failResult"));
      out.write("<a style=\"font-size:25px;padding:0px 10px 0px 100px;\" href=\"index.jsp\">&times;</a></div>   \n");
      out.write("        ");
}catch(Exception e){}
      out.write("\n");
      out.write("<center><form>\n");
      out.write("   \n");
      out.write("                          \n");
      out.write("<div class=\"container\">\n");
      out.write("\n");
      out.write("    <h1 style=\"text-align: center;padding: 20px 0px 30px 0px;margin: 20px 0px 75px 0px;font-size: 50px\">Login Form</h1>\n");
      out.write("\n");
      out.write("  <div>   \n");
      out.write("<label><b>Profile </b></label>\n");
      out.write("<input type=\"text\" placeholder=\"Enter Profile \" name=\"profile\" list=\"profilelist\" required>\n");
      out.write("<datalist id=\"profilelist\">\n");
      out.write("<option>Administrator</option>\n");
      out.write("<option>Registrar</option>\n");
      out.write(" <option>HOD</option>\n");
      out.write("<option>Student</option>\n");
      out.write("</datalist><br><br><br>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<label><b>Username</b></label>\n");
      out.write("<input type=\"text\" placeholder=\"Enter Username\" name=\"uname\" required><br><br><br>\n");
      out.write("\n");
      out.write("<label><b>Password</b></label><br>\n");
      out.write("<div class=\"wrapper\">\n");
      out.write("<input type=\"password\" placeholder=\"Enter Password\" name=\"psw\" id=\"password-field\" required >\n");
      out.write("<i id=\"pass-status\" class=\"fas fa-eye\" aria-hidden=\"true\" onClick=\"viewPassword()\"></i></div><br><br><br>\n");
      out.write("\n");
      out.write("<center> <button style=\"width:150px;height: 50px; font-size: 25px;\" formaction=\"Controller/loginasprofile.jsp\" type=\"submit\">\n");
      out.write("                <b>Login</b>\n");
      out.write("        </button> </center>\n");
      out.write("    </form>\n");
      out.write("          \n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</form>\n");
      out.write("</center>\n");
      out.write("</div>\n");
      out.write(" \n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("function viewPassword()\n");
      out.write("{\n");
      out.write("  var passwordInput = document.getElementById('password-field');\n");
      out.write("  var passStatus = document.getElementById('pass-status');\n");
      out.write(" \n");
      out.write("  if (passwordInput.type == 'password'){\n");
      out.write("    passwordInput.type='text';\n");
      out.write("    passStatus.className='fas fa-eye-slash';\n");
      out.write("   \n");
      out.write("  }\n");
      out.write("  else{\n");
      out.write("    passwordInput.type='password';\n");
      out.write("    passStatus.className='fas fa-eye';\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</script>       \n");
      out.write("</body>\n");
      out.write("</html> ");
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
