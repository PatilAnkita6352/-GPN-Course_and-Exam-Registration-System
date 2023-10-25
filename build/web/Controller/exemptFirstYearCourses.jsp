
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exemption of first year courses</title>
    </head>
    <body>
          <%
           
        if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null )
            {
                 response.sendRedirect("../../index.jsp");
            }
        else  if(session.getAttribute("admin_user").equals("admin"))
            { 
               
                String rollNo=request.getParameter("rollNo");
                //String couCode=null;
                //out.print(rollNo);
                SimpleDateFormat f=new SimpleDateFormat("dd/MM/yyyy");
                String date=f.format(new Date());
                try{
                String courseCode[]=request.getParameterValues("course[]");
                if(courseCode.length!=0)
                {
                    boolean result=AdminCon.regFirstYearExemptedCourses(rollNo, courseCode);//regFirstYearExemptedCourses(rollNo,courseCode);
                    if(result) 
                        response.sendRedirect("../views/Admin/exemption.jsp?result=Exemption of courses is successful.");
                    else
                        response.sendRedirect("../views/Admin/exemption.jsp?failResult=Exemption of courses is unsuccessful.");
                }
                }
                catch(Exception e){
                    response.sendRedirect("../views/Admin/regOfFirstYearExemptedCourses.jsp?failResult=Please select at least one course&rollNo="+rollNo);
                }
            }%>
    </body>
</html>
