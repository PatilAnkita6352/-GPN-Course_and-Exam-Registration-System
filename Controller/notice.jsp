

<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notice</title>
    </head>
    <body>
        <%
            if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
           {    
             String flag=request.getParameter("flag");
             if(flag.equals("update"))
             {
             String notice=request.getParameter("notice");
             AdminCon.updateNotice(notice);
             response.sendRedirect("../views/Admin/notice.jsp?result=Notice updated successfully");
             }
             else if(flag.equals("delete"))
             {
              AdminCon.deleteNotice();   
              response.sendRedirect("../views/Admin/notice.jsp?result=Notice deleted successfully");
             }
           }
          %>   
    </body>
</html>
