

<%@page import="beans.Admin_data"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Course_reg"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration of Examination</title>
    </head>
    <body>
        <%
            //session checking
            if(session.getAttribute("stud_uname")==null || session.getAttribute("stud_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            } 
            else if(session.getAttribute("stud_user").equals("student")) 
           {  
                String ans=request.getParameter("yn");;
                if(ans.equals("yes"))
                {
                    response.sendRedirect("../views/Student/regExam.jsp");
                }
                else if(ans.equals("no"))
                { 
                    response.sendRedirect("../views/Student/printRegForStud.jsp");
                }
           }
            %>
    </body>
</html>
