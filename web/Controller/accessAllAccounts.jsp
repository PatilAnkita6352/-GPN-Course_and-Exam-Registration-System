

<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Access all accounts</title>
    </head>
    <body>
        <% if(request.getParameter("user").equals("hod"))
        {
             String hodUname=AdminCon.getUsernameForAccess(request.getParameter("user"), request.getParameter("programme"), Integer.parseInt(request.getParameter("shift")),"");
             if(hodUname!=null)
             {
                session.setAttribute("hod_uname", hodUname);
                session.setAttribute("hod_user", "hod");
                response.sendRedirect("../views/HOD/hodPanel.jsp");
             }
             else
                 response.sendRedirect("../views/Admin/accessAllAccountsForm.jsp?failResult=Sorry, but this user do not exist.");
        }
        else if(request.getParameter("user").equals("registrar")) 
        {
             String registrarUname=AdminCon.getUsernameForAccess(request.getParameter("user"), request.getParameter("programme"), Integer.parseInt(request.getParameter("shift")),"");
             if(registrarUname!=null)
             {
                session.setAttribute("registrar_uname", registrarUname);
                session.setAttribute("registrar_user", "registrar");
                response.sendRedirect("../views/Registrar/registrarPanel.jsp");
             }
             else
                 response.sendRedirect("../views/Admin/accessAllAccountsForm.jsp?failResult=Sorry, but this user do not exist.");
        }
        else if(request.getParameter("user").equals("student"))
        {
             String studUname=AdminCon.getUsernameForAccess(request.getParameter("user"), request.getParameter("programme"), 1,request.getParameter("rollno"));
             if(studUname!=null)
             {
                session.setAttribute("stud_uname", studUname);
                session.setAttribute("stud_user", "student");
                response.sendRedirect("../views/Student/studPanel.jsp");
             }
             else
                 response.sendRedirect("../views/Admin/accessAllAccountsForm.jsp?failResult=Sorry, but this user do not exist.");
        }
        %>
    </body>
</html>
