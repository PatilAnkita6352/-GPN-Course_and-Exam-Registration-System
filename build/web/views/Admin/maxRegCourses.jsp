<%-- 
    Document   : maxAllowedRegCourses
    Created on : Dec 27, 2018, 12:31:30 PM
    Author     : Shubham Nehe
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Maximum Allowed Courses</title>
         <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
     <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
     
          <style>
            p{
                text-height: 20;
                
            }
        </style>
    </head>
    <body>
        <%
            if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
           { %>
           
            <jsp:include page="../headerforallPanelviews.jsp"/>
                <div class="container">
                    <!--For displaying flash data--> 
                    <%try{ 
                        if(!request.getParameter("failResult").equals(null))%>
                        <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p>
                    <%}catch(Exception e){}%> 
                    <br>
                    <form method="POST" action="../../Controller/saveMaxRegCourses.jsp">
                        <label> Maximum number of allowed courses including Backlog Courses : </label> <input type="number" name="noOfMaxCourses" required oninvalid="this.setCustomValidity('Maximum courses  is required.')"
                                                                  oninput="this.setCustomValidity('')"><br><br>
                        <input type="submit" class="btn btn-primary" id="submitBtn" name="submit" value="Allow Courses"> 
                    </form>
          <% }%>
                </div>
    </body>
</html>
