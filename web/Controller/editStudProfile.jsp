<%@page import="mainController.StudCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Student Profile</title>
    </head>
    <body>
        
        <jsp:useBean id="sd" class="beans.Student_data"></jsp:useBean> 
        <jsp:setProperty property="*" name="sd"/>  
        <%
            if(session.getAttribute("stud_user")==null || session.getAttribute("stud_uname")==null)
            {
                response.sendRedirect("../index.jsp");
            }
            else
            {
                
                int i=StudCon.saveStudentProfile(sd,(String)session.getAttribute("stud_uname"));
                if(i>0)
                {
                    response.sendRedirect("../views/Student/studPanel.jsp?result=Profile updated successfully");
                }
                else
                {
                     response.sendRedirect("../views/Student/studPanel.jsp?failResult=Profile updatedion failed");
                }
            }
        %>
    </body>
</html>
