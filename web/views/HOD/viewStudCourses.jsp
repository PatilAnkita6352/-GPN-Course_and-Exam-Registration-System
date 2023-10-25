<%-- 
    Document   : view_stud_courses
    Created on : Aug 17, 2018, 9:38:25 AM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.CourseCon"%>
<%@page import="mainController.StudCon"%>
<%@page import="mainController.HodCon"%>
<%@page import="beans.Student_data"%>
<%@page import="beans.Hod_data"%>
<%@page import="beans.Course_reg"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
        <title>Student Courses</title>
       
    </head>
    <body>
    <%
       String name=((String)session.getAttribute("hod_uname"));
       if(name.equals(null))
       {
          response.sendRedirect("../../index.jsp");
       }
       else
      { 
         %><jsp:include page="../headerforallPanelviews.jsp"/><%
           try
           { 
              Hod_data hod=HodCon.getHODInfo((String)session.getAttribute("hod_uname"));
              Student_data stud=(Student_data)StudCon.getStudentInfo(request.getParameter("stud_rol_no"));
              Courses course;
              List li;
              int j=0;
              //Hod can access only his department and shift students.              
              if(hod.getProgramme().equals(stud.getProgramme()) && hod.getShift()==stud.getShift())
              { 
                   li=StudCon.getRegCourse(stud.getUsername(), stud.getTerm(), stud.getYear());
                   System.out.print("((((((((((((((((((li sixe"+li.size());
                   if(li.size()!=0)
                   {
                      %>
                      <br><br>
             <div class="container">
                      <table border="1" class="table">
                        <thead>
                        <th>Sr.no</th>
                        <th>Course Code</th>
                        <th>Course Name</th>
                        </thead>
                        <tbody> 
                        <h2>Courses registered by <%=request.getParameter("stud_rol_no")%></h2><br>
                       <%for(Object obj:li)
                        {
                            Course_reg cr=(Course_reg)obj;
                            course=CourseCon.getCourseObject(cr.getCourse_code().trim());%>
                            <tr>
                                <td><%= ++j %></td>
                                <td><%= cr.getCourse_code()%></td>
                                <td><%= course.getCourse_name() %></td>
                            </tr>
                        <% }
                   }
                    else
                    {
                        response.sendRedirect("viewStudCourseForm.jsp?failResult=Course registration is not done by the student.");
                    }
              }
              else
               { 
                   response.sendRedirect("viewStudCourseForm.jsp?failResult=You can only view students of your department and shift.");
               } 
            }catch(Exception e){response.sendRedirect("viewStudCourseForm.jsp?failResult=Enter correct roll number.");}   
       }//Session check else close
%>             
         </tbody>
        </table>
       </div>
         <%@include file="../../footer.jsp" %>
        
    </body>
</html>
