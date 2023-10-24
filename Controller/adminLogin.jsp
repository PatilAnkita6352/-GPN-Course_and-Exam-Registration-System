<%@page import="mainController.AdminCon"%>
<%@page import="beans.Admin_data"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
       
       
    </head>
    <body>
        <%

            String admin_uname=(String)session.getAttribute("usern");
            String pword=(String)session.getAttribute("passw");
           
            System.out.println("admin login check called");
            %>
            <!--<script>-->
             
                    <!--var error = document.getElementById("error")-->
               
            <%
                if(AdminCon.login(admin_uname,pword))
                {
                    session.setAttribute("admin_uname",admin_uname);
                    session.setAttribute("admin_user", "admin");
                    System.out.println("admin credentials correct hence moved to admin panel");
                    response.sendRedirect("../views/Admin/adminPanel.jsp");
                    //login successful hence moved to admin panel
                }
                else
                {
                    session.setAttribute("admin_uname", null);
                    session.setAttribute("admin_user", null);%>
                    <%response.sendRedirect("../index.jsp?failResult=Invalid Credentials.Please check your Profile,Username and Password.");
                                               
                    //login unsuccessful hence moved to adminLoginForm
                }
     %>  
    </body>
</html>