<%-- 
    Document   : view_student
    Created on : Aug 17, 2018, 9:31:31 AM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Courses</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
      
     <script src="../assets/js/jquery1.min.js"></script>
     <script src="../assets/js/bootstrap1.min.js"></script>
     
          <style>
            p{
                text-height: 20;
                
            }
        </style>
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
        <jsp:include page="../headerforallPanelviews.jsp"/>
          <div class="container"><br>
         <% try{if(!request.getParameter("failResult").equals(null)){ %> <p class=" alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%= request.getParameter("failResult") %></p> <% }}catch(Exception e){} %>
         <h1>View Student's Registered Courses</h1><br>
        <form action="viewStudCourses.jsp" method="post">
            Enter Student Roll No : <input type="text" name="stud_rol_no" required oninvalid="this.setCustomValidity('Roll number is required.')"
                              oninput="this.setCustomValidity('')"><br><br>
            <button class="btn btn-primary">View</button>
        </form> 
          </div>
        <%@include file="../../footer.jsp" %>
        
        <% } %>
    </body>
</html>
