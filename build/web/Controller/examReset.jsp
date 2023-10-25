

<%@page import="mainController.ExamRegCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Registration Reset</title>
    </head>
    <body>
          <%
              String user=((String)session.getAttribute("admin_user"));
            if(!user.equals("admin"))
            {
               response.sendRedirect("../index.jsp");
            }
            else
           {
           String rollno=request.getParameter("roll_no");
           System.out.println("////////////////////////////////////////"+rollno);
          int r=ExamRegCon.examRegReset(rollno);
         
          if(r>0)
          {
             response.sendRedirect("../views/Admin/examRegReset.jsp?result=Record deleted successfully");
             
             
          }
          else
          {
              response.sendRedirect("../views/Admin/examRegReset.jsp?failResult=Record deleted unsuccessfully");
          }
           }
            %>
    </body>
</html>
