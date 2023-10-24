
<%@page import="mainController.CourseCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Course</title>
    </head>
    <body>
        <%////out.print("deleted successfully"); out.print("deleted unsuccessfully");  
            String couCode=request.getParameter("couCode");
            int i=CourseCon.deleteCourse(couCode);
            if(i==1)
            {
            response.sendRedirect("../views/Admin/deleteCourseForm.jsp?result=Course deleted successfully.");
            }
            else  if(i==0)
            {
               response.sendRedirect("../views/Admin/deleteCourseForm.jsp?failResult=Course deleted unsuccessfully.");
            }
            else  if(i==-1)
            {
               response.sendRedirect("../views/Admin/deleteCourseForm.jsp?failResult=Course is not present.");
            }
            
        %>
       
    </body>
</html>
