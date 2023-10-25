<%-- 
    Document   : deleteCourseForm
    Created on : 2 Mar, 2019, 8:39:45 PM
    Author     : ADMIN
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Courses</title>
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
           { 
            %>   
         <jsp:include page="../headerforallPanelviews.jsp"/>
          
          <div class="container">
            <% 
            try{
            if(!(request.getParameter("result").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%= request.getParameter("result")%></p></div></div>
            <%}
               }catch(Exception e){}
                try{
                if(!(request.getParameter("failResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%=request.getParameter("failResult")%></p></div></div>
            <%}
                }catch(Exception e){}
                
        %><br></div>
          
        <h1>Delete Course</h1>
        <form action="../../Controller/deleteCourse.jsp" method="post">
            
            Enter the course code  : <input type="text" name="couCode"  placeholder="Ex.CM6577" required oninvalid="this.setCustomValidity('Rollnumber is required.')"
                              oninput="this.setCustomValidity('')" >
            <br><br>
            
            <input type="submit" class="btn btn-primary" value="Delete">
        </form>
        <%}%>
    </body>
</html>
