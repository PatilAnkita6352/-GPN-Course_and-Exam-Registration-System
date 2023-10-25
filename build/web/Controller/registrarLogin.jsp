<%@page import="mainController.HodCon"%>
<%@page import="beans.Hod_data"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
        <title>Registrar Login</title>
    </head>
   
    <body>
     
        <% String registrar_uname=(String)session.getAttribute("usern");
            String pword=(String)session.getAttribute("passw");
             
         int i=HodCon.registrarLogin(registrar_uname, pword);
         if(i==1)
         {
            session.setAttribute("registrar_uname", registrar_uname);
            session.setAttribute("registrar_user", "registrar");
            response.sendRedirect("../views/Registrar/registrarPanel.jsp?result=successfull..");
         }
         else
         {
             session.setAttribute("registrar_uname", null);
             session.setAttribute("registrar_user", null);
             response.sendRedirect("../index.jsp?failResult=Invalid Credentials.Please check your Profile,Username and Password.");
         }
         %>
       
    </body>
</html>
