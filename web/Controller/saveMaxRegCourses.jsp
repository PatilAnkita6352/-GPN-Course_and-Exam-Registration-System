<%-- 
    Document   : maxAllowedRegCourses
    Created on : Dec 27, 2018, 12:38:21 PM
    Author     : Shubham Nehe
--%>

<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Allowed Maximum Registered Courses</title>
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
                int noOfMaxCourses=Integer.parseInt(request.getParameter("noOfMaxCourses"));
                if(noOfMaxCourses>=8 && noOfMaxCourses<=15) 
                { 
                    if(AdminCon.saveMaxRegCourses(noOfMaxCourses,(String)session.getAttribute("admin_uname")))
                        //Successful updation of no. of maximum allowed courses.
                        response.sendRedirect("../views/Admin/adminPanel.jsp?result=Maximum "+noOfMaxCourses+" courses are allowed including Backlog courses for registration were updated successfully.");
                    else
                        //Unsuccessful updation of no. of maximum allowed courses.
                        response.sendRedirect("../views/Admin/maxRegCourses.jsp?failResult=Sorry, but updation of number of maximum allowed courses for registration failed.");
                }
                else
                {
                    //Maximum allowed courses for registration should be between 8 and 15 
                    response.sendRedirect("../views/Admin/maxRegCourses.jsp?failResult=Maximum allowed courses for registration should be between 8 and 15.");
                }
           }catch(Exception e){
               //If admin doesn't enter any value in textbox,then it throws exception and hence redirected to maxRegCourses.jsp with message. 
               response.sendRedirect("../views/Admin/maxRegCourses.jsp?failResult=Please enter the number of courses.");  
           }
       }%>
    </body>
</html>
