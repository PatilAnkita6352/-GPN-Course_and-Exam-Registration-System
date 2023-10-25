<%--
    Document   : examRegReset
    Created on : Feb 21, 2019, 7:59:58 PM
    Author     : User
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Registration Reset</title>
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
            if(session.getAttribute("admin_uname").equals(null))
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
           {     %>
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
         
   
    <center> <h1><u>Exam Registration Reset</u></h1>
 

    <form action="../../Controller/examRegReset.jsp" method="post">
       
        Roll Number :<input type="text" required name="rollno">
       
       
        <br><br>
         <button class="btn btn-primary">Search</button>
    </form>
        </center>
    <%}%>
    </body>
   
</html>
