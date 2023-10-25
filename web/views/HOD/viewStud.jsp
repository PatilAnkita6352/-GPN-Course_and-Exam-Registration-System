<%--
    Document   : viewStud
    Created on : Aug 26, 2018, 9:00:49 PM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.CourseCon"%>
<%@page import="mainController.HodCon"%>
<%@page import="mainController.StudCon"%>
<%@page import="beans.Hod_data"%>
<%@page import="beans.Student_data"%>
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
        <title> Student Details</title>
    </head>
    <body>
        <%  
            String uname=((String)session.getAttribute("hod_uname"));
            if(uname.equals(null))
            {
               response.sendRedirect("../../index.jsp");
            }
            else
           {
          %>
         <%@include file="../headerforallPanelviews.jsp"%>
          <div class="container">
             
        <%
            try
           {
              Hod_data hod=HodCon.getHODInfo((String)session.getAttribute("hod_uname"));
              Student_data stud=(Student_data)StudCon.getStudentInfo(request.getParameter("stud_rol_no"));
              Courses course;
              List li;
              int j=0;
         
        if(hod.getProgramme().equals(stud.getProgramme()) && hod.getShift()==stud.getShift())
              {
                                 
        %>
               <h1>Student Details</h1><hr>
               <h4><label>Roll no : </label> <%= stud.getRollno() %><br><br>
               <label> Name : </label> <%= stud.getS_name() %><br><br>
               <label>Programme : </label> <%= stud.getProgramme() %><br><br>
               <label>Year : </label> <%= stud.getYear()%> <br><br>
               <label>Term : </label> <%=stud.getTerm() %> <br><br>
               <label>Email : </label> <%= stud.getS_email() %><br><br>
               <label>Phone Number : </label> <%= stud.getPhone_no() %><br></h4>
               
                      <%
                          li=StudCon.getRegCourse(stud.getUsername(), stud.getTerm(), stud.getYear());
                   System.out.print("((((((((((((((((((li sixe"+li.size());
                   if(li.size()!=0)
                   {
                      %>
                     
                        <div class="container">
                      <table border="1" class="table">
                        <thead>
                        <th>Sr.no</th>
                        <th>Course Code</th>
                        <th>Course Name</th>
                        </thead>
                        <tbody>
                        <h3>Courses registered by <%=request.getParameter("stud_rol_no")%> for <%=stud.getTerm()%> Term</h3><br>
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
                        response.sendRedirect("viewStudForm.jsp?failResult=Course registration is not done by the student.");
                    }
              }
                    else
                    {
                       response.sendRedirect("viewStudForm.jsp?failResult=Hod can view only his students of his department and shift.");
                    }
            }catch(Exception e){response.sendRedirect("viewStudForm.jsp?failResult=Roll number is invalid");}    
            } //Session check                
%>   <%@include file="../../footer.jsp" %>
          </div>
    </body>  
</html>
