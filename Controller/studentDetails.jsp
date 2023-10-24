<%-- 
    Document   : studentDetails
    Created on : Nov 22, 2020, 1:54:03 PM
    Author     : Vaishnavi
--%>


<%@page import="beans.Student_data"%>

<%@page import="java.util.ListIterator"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
        <title>Student Details</title>
    </head>
    <body>
    <%  
           String uname=((String)session.getAttribute("admin_uname"));
            if(uname.equals(null))
            {
               response.sendRedirect("../index.jsp");
            }
            else
           {%>
           <%@include file="headerforallPanelController.jsp"%>
           <%
            String roll_no=request.getParameter("rollnumber");
            
           List list=AdminCon.studentDetails(roll_no);
          if(list!=null)
          {
                ListIterator lit=list.listIterator();
               Student_data c;
                while(lit.hasNext()) {
                c=(Student_data)lit.next();
                %>
            
    <div class="container">
              <h1>Student Information</h1><br>
              
              <h4><label>Roll number :</label> <%= c.getRollno()%><br><br>
        
                  <label>Name :</label> <%= c.getS_name()%><br><br>
                  <label>Programme :</label> <%= c.getProgramme()%><br><br>
                  <label>Year : </label> <%= c.getYear()%> <br><br>
                  <label>Term : </label> <%=c.getTerm() %> <br><br>
                  <label>Email : </label> <%= c.getS_email() %><br><br>
                  <label>Phone Number :</label> <%= c.getPhone_no()%><br><br></h4>
    </div>

             <% }
               }
               else
                {
                    response.sendRedirect("../views/Admin/studentDetails.jsp?failResult=No record found");
                }}
             %>
          </body>
</html>

