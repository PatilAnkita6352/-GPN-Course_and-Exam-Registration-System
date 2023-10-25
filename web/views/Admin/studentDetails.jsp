<%-- 
    Document   : studentDetalis
    Created on : Sep 10, 2018, 12:15:27 PM
    Author     : Vaishnavi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Details</title>
         <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
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
        <%@include file="../headerforallPanelviews.jsp"%>
         <br><div class="container"><%
             
              try{
            if(!(request.getParameter("failResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
            <%}
                }catch(Exception e){}
                
        %></div>
        <form action="../../Controller/studentDetails.jsp" method="post">
            <label> Roll number :</label>   <input type="number" required name="rollnumber">
            <br><br>
              <button class="btn btn-primary">Submit</button>
        </form>
        <%}%>
    </body>
</html>
