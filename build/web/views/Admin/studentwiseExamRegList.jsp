<%-- 
    Document   : studentwiseExamRegList
    Created on : 21 Nov, 2020, 11:30:50 AM
    Author     : SHWETA
--%>

<%@page import="beans.Student_data"%>
<%@page import="mainController.CourseCon"%>
<%@page import="mainController.HodCon"%>
<%@page import="mainController.StudCon"%>
<%@page import="beans.Hod_data"%>
<%@page import="beans.Student_data"%>
<%@page import="beans.Course_reg"%>
<%@page import="beans.Exam_reg"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.ListIterator"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
        <script src="../../assets/jquery.min.js"></script>
        <script src="../../assets/js/bootstrap.min.js"></script>
        <style>
            table{
                text-align: left;
            }
            th{
                text-align: center;
            }
            @page{
                size:a4 portrait;
            }
            img{
               transition: none;          
            }
        </style>
        <title>Student Details</title>
    </head>
    <body><%@include file="../headerforallPanelviews.jsp" %>
        <a href="afterRegRep.jsp" id="BackBtn"><button  value="Back" class="btn btn-lg btn-primary">Back</button></a>
    <%  
           String uname=((String)session.getAttribute("admin_uname"));
            if(uname.equals(null))
            {
               response.sendRedirect("../../index.jsp");
            }
            else
           {%>
         
           <%
            String term=(String)session.getAttribute("term");
            String regyear=(String)session.getAttribute("regyear");
            String roll_no=request.getParameter("rollno");
           
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
                  <table border="1" class="table">
                        <thead>
                        <th>Sr.no</th>
                        <th>Course Code</th>
                        <th>Course Name</th>
                        <th class="align" style="width:10%">Theory</th>
                        <th class="align" style="width:10%">Practical</th>
                        </thead>
                        <tbody>
                            <%  
                               
                            Courses course;
                            int j=0;
                           List li =StudCon.getExRegCourseByRegTermYear(c.getUsername(), term+"-"+Integer.parseInt(regyear));
                      if(li.size()!=0)
                      {
                            %>
                       <h3>Courses registered by <%=request.getParameter("rollno")%> for <%=term%> Term</h3><br>
                         
                           <%
                               for (Object obj:li)
                           {
                            Exam_reg er=(Exam_reg)obj;
                            course=CourseCon.getCourseObject(er.getCourse_code().trim());%>
                            <tr>
                                <td><%= ++j %></td>
                                <td><%= er.getCourse_code()%></td>
                                <td><%= course.getCourse_name() %></td>
                                <td align="center">
                                <%
                                 int Status= er.getEx_th();
                                    if(Status == 1){ %>
                                    <img src="../../Images/green-tick1.png" height="15" width="15">
                                    <%}else{%>
                                    <img src="../../Images/red-cross1.png" height="15" width="15">
                                <%}%>
                            </td>
                            <td align="center">
                                <%
                                    Status=er.getEx_pt();
                                    if(Status==1){ %>
                                    <img src="../../Images/green-tick1.png" height="15" width="15">
                                    <%}else{%>
                                    <img src="../../Images/red-cross1.png" height="15" width="15">
                                <%}%>
                            </td>      
                            </tr>
                         
                            

                            <%}%></tbody></table>
                            <br>  <br>  <br>                  
        <form method="post">
        <button  class="btn btn-lg btn-primary" id="PrintBtn" data-toggle="collapse" onclick="printpage()">Print</button>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <button id="homeBtn" value="Home" formaction="adminPanel.jsp" class="btn btn-lg btn-primary">Home</button>
        </form>
                <%} 
                else
                    {
                        response.sendRedirect("afterRegRep.jsp?failResult=Exam registration is not done by the student.");
                    } }
               }
               else
                {
                    response.sendRedirect("afterRegRep.jsp?failResult=No record found");
                }}
             %>
             
              <script type="text/javascript">
        function printpage()
        {
           /* var demo=document.getElementById('demo');
            demo.style.visibility='hidden';*/
            var btn1=document.getElementById('PrintBtn');
            btn1.style.visibility='hidden';
            var btn=document.getElementById('homeBtn');  
            btn.style.visibility='hidden';
            var btn3=document.getElementById('BackBtn'); 
            btn3.style.display='none';

            window.print();  
            btn1.style.visibility='visible';
            btn.style.visibility='visible';
            btn3.style.display='inline-block';

           
        }
    </script>
          </body>
</html>