<%-- 
    Document   : register
    Created on : Jul 25, 2018, 3:11:42 PM
    Author     : sarvadnya
--%>

<%@page import="mainController.StudCon"%>
<%@page import="beans.Student_data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>student Registartion</title>
    </head>
    <body>
        
        <jsp:useBean id="sd" class="beans.Student_data"></jsp:useBean>
        <jsp:setProperty property="*" name="sd"/>
        <% 
            try{
                //calling following method for registration
            int i=StudCon.register(sd);
            if(i>0)
            {
                if( ((String)session.getAttribute("admin_user")).equals("admin"))
                    response.sendRedirect("../views/Admin/adminPanel.jsp");
                    //Moved to admin panel if admin is login 
                else
                    response.sendRedirect("../views/HOD/hodPanel.jsp");
                    //Moved to admin panel if hod is login 
            }
            else
                out.println("Sorry ! Failed to register student");
            }
            catch(Exception e)
          {               
             out.println("Exception "); %> 
             <h2> 
                 <%out.println(e);%>  
            <% out.println(" occured !\n\n");
               out.println("Try again !");
          }
      %>  </h2>  
    </body>
</html>
