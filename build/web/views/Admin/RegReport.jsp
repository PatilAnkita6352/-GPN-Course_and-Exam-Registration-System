<%-- 
    Document   : courseregrep
    Created on : 20 Nov, 2020, 4:59:54 PM
    Author     : SHWETA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
<%@page import="mainController.CourseCon"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Details</title>
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
     <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
       
    </head>
    <body>
        <%  //checking if user is admin
            String name=((String)session.getAttribute("admin_uname"));
            if(name.equals(null))
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
           { 
        %>
        
        <!--Used for displaying flash data.-->
        <%@include file="../headerforallPanelviews.jsp"%>
        <br><div class="container"><%
             session.removeAttribute("term");//from afterRegRep.jsp
            session.removeAttribute("regyear");//from afterRegRep.jsp
            session.removeAttribute("regType");//from afterRegRep.jsp
             String result=request.getParameter("result");
            try{
            if(result!=null){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(result);%></p></div></div>
            <%}
                }catch(Exception e){}
              try{
            if(request.getParameter("failResult")!=null){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
            <%}
                }catch(Exception e){}     
        %></div>
        
        <% //displaying heading of page
            String regType=request.getParameter("regType");     //regtype value is set by adminpanel.jsp based on which button was pressed between coursereg or examreg
            if(regType.equals("course"))
            {session.setAttribute("regType","course");
            %>   <center> <h1><u>Course Registration Report</u></h1></center><br><%}
            else if(regType.equals("exam"))
            {session.setAttribute("regType","exam");
            %><center> <h1><u>Exam Registration Report</u></h1></center><br> <%}
        %>
         <!--Form to accept record year and term-->
         <h2>Enter Term and Year</h2>
         <form action="afterRegRep.jsp" method="post">
             
            <label><h5>Term :</h5</label>
            <select name="recTerm"style="width: 170px;height: 30px">
                                    <option value="ODD">ODD</option>
                                    <option value="EVEN">EVEN</option>
            </select>&nbsp &nbsp &nbsp &nbsp
            
            <label><h5>Year :</h5></label><input type="text" name="recYear"style="width: 170px;height: 30px" required>
        &nbsp &nbsp 
        <button class="btn btn-primary" style="width:100px;height: 40px"><font size="4">Go</font></button>
        </form>
        
    <% } %>
    </body>
</html>