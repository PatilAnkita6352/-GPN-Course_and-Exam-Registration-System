<%-- 
    Document   : setCurriculum
    Created on : 21 Apr, 2021, 6:02:08 PM
    Author     : SHWETA
--%>
<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null)
        {
           response.sendRedirect("../../index.jsp");
        }
        else if(session.getAttribute("admin_user").equals("admin")) 
       { 
           try{
                    if(AdminCon.setCurriculumYr(Integer.parseInt(request.getParameter("curriculumyr")),(String)session.getAttribute("admin_uname")))
                                response.sendRedirect("../views/Admin/adminPanel.jsp?result=Curriculum Year is set successfully ");
                    else
                               response.sendRedirect("../views/Admin/maxRegCourses.jsp?failResult=Sorry,failed.");
                
                
           }catch(Exception e){
              
               response.sendRedirect("../views/Admin/maxRegCourses.jsp?failResult=Please enter the number of courses.");  
           }
       }%>
    </body>
</html>
