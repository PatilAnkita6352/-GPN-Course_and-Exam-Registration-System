
<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOD Registration</title>
    </head>
    <body>
        <%
              String user=((String)session.getAttribute("admin_user"));
            if(!user.equals("admin"))
            {
               response.sendRedirect("../index.jsp");
            }
            else
           {%>
       <jsp:useBean id="hd" class="beans.Hod_data"></jsp:useBean>
        <jsp:setProperty property="*" name="hd"/>
        <%
            try
        {
            int i=HodCon.registerHOD(hd);
            if(i>0)
            {
                response.sendRedirect("../views/Admin/hodRegForm.jsp?result=HOD is successfully registered");
               // Hod Successfully registered.
            }
            else
             {
                response.sendRedirect("../views/Admin/hodRegForm.jsp?failResult=HOD is not registered successfully");
               // Hod not Successfully registered.
            }
           
        }
        catch(Exception e)
        {
            response.sendRedirect("../views/Admin/hodRegForm.jsp?failResult=HOD is already registered");
        }
        }
        %>
    </body>
</html>
