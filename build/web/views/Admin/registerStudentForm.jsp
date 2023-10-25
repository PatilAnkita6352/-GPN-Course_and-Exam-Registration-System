<%--
    Document   : registerStudentForm
    Created on : Jul 25, 2019, 7:17:45 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Student Registration</title>
         <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
          <script src="../../assets/css/font-awesome.min.css"></script>
         <script src="../../assets/js/jquery1.min.js"></script>
         <script src="../../assets/js/bootstrap1.min.js"></script>
   
    <style>
            p{
                text-height: 20;              
            }
            .field-icon
            {
                float:right;
                margin-left:-5px;
                margin-right:5px;
                margin-top:-16px;
                position:relative;
                z-index: 2;
                height:30px;
                width:30px;
               
            }
        </style>
         </head>
    <body>
        <%
           
            if(session.getAttribute("admin_uname")==null && session.getAttribute("hod_uname")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user")=="admin" || session.getAttribute("hod_user")=="hod")
           {
            %>
             <%@include file="../headerforallPanelviews.jsp" %>
        <br><div class="container"><% try{
             if(!(request.getParameter("result").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("result"));%></p></div></div>
            <%}
                }catch(Exception e){}
              try{
            if(!(request.getParameter("failResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
            <%}
                }catch(Exception e){}
            }  
        %></div>
         <h1>Check Student Details Registration</h1><br>
        <form action="../../Controller/registerStudent.jsp" method="post" >
            <div class="form-group">
                <div class="row">
                    <div class="col-sm-3">
                        <label>Enter your roll number :</label>
                        <input type="text" name="rollno" class="form-control" required oninvalid="this.setCustomValidity('Roll number is required.')"
                               oninput="this.setCustomValidity('')" ><br>
                        <button type="submit" class="btn btn-primary">Check</button>
                       
                    </div>
               </div>
            </div>
        </form>
       
       
    </body>
</html>

