 <%--
    Document   : hod_panel
    Created on : Jul 29, 2018, 12:24:05 AM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOD Panel</title>
       
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
             session.setAttribute("profilepanel","hodpanel");
            String name=((String)session.getAttribute("hod_uname"));
            try{
            if(!name.equals(null))
            {
          %>
         <jsp:include page="../headerforallPanelviews.jsp"/>
        <br>
        <h1>Welcome to HOD panel</h1>
        <hr><br>
    <marquee style="background:gray;color: white" width="100%"><%try{if(!AdminCon.getNotice().equals(null)){out.print(AdminCon.getNotice());}}catch(Exception e){}%></marquee><br>
         <%
            try{
          if(!(request.getParameter("flag").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("flag"));%></p></div></div>
            <%}
            }catch(Exception e){}
            String flag1=request.getParameter("flag1");
            try{if(!flag1.equals(null)){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(flag1);%></p></div></div>
            <%}
            }catch(Exception e){}
            %>
        <br><% String result=request.getParameter("result");
            try{if(!result.equals(null)){ %> <p class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%= result %></p> <% }}catch(Exception e){} %>
       
            <div class="row">
                <div class="col-lg-4">
                <div class="panel panel-primary">
                   <div class="panel-heading">
                           <h3>Student Settings</h3>
                   </div>
                   <div class="panel-body">
                       <form method="post">
<!--                       <button class="btn btn-primary" formaction="viewStudCourseForm.jsp">View Student's Registered Courses</button><br><br>-->
                       <button class="btn btn-primary" formaction="viewStudForm.jsp">Student Details</button><br><br>
                       <button class="btn btn-primary" formaction="../Admin/registerStudentForm.jsp"> Check Student Details Registration </button><br><br>
                       <button class="btn btn-primary" formaction="changeStudPwdByHodForm.jsp">Change Student Password</button><br><br>
                       </form>
                   </div>
                </div>
                </div>
                <div class="col-lg-4">
                <div class="panel panel-primary">
                   <div class="panel-heading">
                           <h3>Registrar Settings</h3>
                   </div>
                   <div class="panel-body">
                       <form method="post">
                       <button class="btn btn-primary" formaction="changeHodPwdForm.jsp">Change HOD Password</button><br><br>
                       <button class="btn btn-primary" formaction="registrarPwdForm.jsp">Change Registrar Password</button><br><br>
                       <button class="btn btn-primary" formaction="registrarRegForm.jsp">Register Registrar</button><br><br>
                       </form>
                   </div>
                </div>
                </div>
                <div class="col-lg-4">
                <div class="panel panel-primary">
                   <div class="panel-heading">
                           <h3>Registration</h3>
                   </div>
                   <div class="panel-body">
                       <form method="post">
                           <button class="btn btn-primary" id="hod" name="user" value="hod" formaction="../../Controller/startStopReg.jsp?user=hod">Start Registration</button><br><br>
                       <button class="btn btn-primary" formaction="offerCourseForm.jsp">Offer Courses</button><br><br>
                       <button class="btn btn-primary" formaction="createCourse.jsp">Create Courses</button><br><br>
                       <button class="btn btn-primary" formaction="setEquiCoursesForm.jsp">Set Equivalent Courses</button><br><br>
                       </form>
                   </div>
                </div>
                </div>
             </div>
           
       <% }
            }catch(Exception e){response.sendRedirect("../../index.jsp");}
            %>
        <%@include file="../../footer.jsp" %>
    </body>
</html>
