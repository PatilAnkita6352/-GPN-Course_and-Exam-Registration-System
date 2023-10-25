<%-- 
    Document   : loginasprofile
    Created on : 19 Nov, 2020, 10:07:38 AM
    Author     : OM
--%>

<%@page import="java.util.*"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body><%
            String username=request.getParameter("uname");   
            String pword=request.getParameter("psw");
            
            session.setAttribute("usern",username);
            session.setAttribute("passw",pword);
            if(request.getParameter("profile").equals("Administrator"))
            {
             response.sendRedirect("adminLogin.jsp");}
            
            else if(request.getParameter("profile").equals("Registrar"))
            {
             response.sendRedirect("registrarLogin.jsp");}
            
            else if(request.getParameter("profile").equals("HOD"))
            {
             response.sendRedirect("hodLogin.jsp");}
            
            else if(request.getParameter("profile").equals("Student"))
            {
             response.sendRedirect("studLogin.jsp");}
            else
            {response.sendRedirect("../index.jsp?failResult=Invalid Credentials.Please check your Profile,Username and Password.");}
            
       %>    
    </body>
</html>
