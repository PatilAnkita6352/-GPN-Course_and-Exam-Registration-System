<%@page import="java.util.List"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Check Student Registration</title>
    </head>
    <body>
      <%
          String roll_no=request.getParameter("rollno");
        List list=AdminCon.studentDetails(roll_no);
        Student_data stud=new Student_data();
        if(list!=null)
        {
            stud=(Student_data)list.get(0);
            int i=StudCon.registerStudent(stud);
            if(i>0)
            {
                response.sendRedirect("../views/Admin/registerStudentForm.jsp?result=Student has already registered sucessfully");
            }
            else
            {
                response.sendRedirect("../views/Admin/registerStudentForm.jsp?failresult=Student registration unsucessfull");
            }
        }
        else
        {
            response.sendRedirect("../views/Admin/registerStudentForm.jsp?failResult=Record is not found");
        }
       
%>
     
    </body>
</html>