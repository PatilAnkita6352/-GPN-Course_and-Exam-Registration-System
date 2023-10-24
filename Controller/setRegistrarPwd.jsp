<%-- 
    Document   : setRegistrarPwd
    Created on : Sep 7, 2018, 3:41:59 PM
    Author     : sarvadnya
--%>

<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Set Registrar Password</title>
    </head>
    <body>
       <% String uname=(String)session.getAttribute("hod_uname");
          String registrar_pwd=request.getParameter("registrar_pwd");
          boolean flag=HodCon.changeRegistrarPwd(registrar_pwd, uname);
          if(flag)
          {
              response.sendRedirect("../views/HOD/hodPanel.jsp?result=Registrar Password Changed Successfully");
          }
          else
          {
              response.sendRedirect("../views/HOD/registrarPwdForm.jsp?failResult=Registrar Password Not Changed");
          }
       %>
    </body>
</html>
