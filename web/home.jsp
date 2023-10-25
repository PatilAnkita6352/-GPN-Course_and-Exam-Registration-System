<%-- 
    Document   : home
    Created on : 19 Nov, 2020, 11:15:23 AM
    Author     : Ankita
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <%
            
           
           
             if(session.getAttribute("profilepanel").equals("adminpanel"))
           { 
                            response.sendRedirect("views/Admin/adminPanel.jsp");
             
           }
             else if(session.getAttribute("profilepanel").equals("hodpanel"))
            {   
                        
                            response.sendRedirect("views/HOD/hodPanel.jsp");
            }
             
             else if(session.getAttribute("profilepanel").equals("registrarpanel"))
            {
                        
                            response.sendRedirect("views/Registrar/registrarPanel.jsp");
            }
             else if(session.getAttribute("profilepanel").equals("studpanel"))
            { 
                        
                            response.sendRedirect("views/Student/studPanel.jsp");
            }
             else{
                response.sendRedirect("index.jsp");}
           
          %>  
         
       
    </body>
</html

